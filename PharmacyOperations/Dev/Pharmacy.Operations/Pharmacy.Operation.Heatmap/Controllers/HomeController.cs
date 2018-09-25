using System;
using System.Linq;
using System.ServiceModel;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Caching.Memory;
using Microsoft.Extensions.Configuration;
using Pharmacy.Operation.Heatmap.Models;

namespace Pharmacy.Operation.Heatmap.Controllers
{
    public class HomeController : Controller
    {
        private IMemoryCache _cache;
        private readonly IConfiguration _configuration;
        public HomeController(IMemoryCache cache, IConfiguration configuration)
        {
            _cache = cache;
            _configuration = configuration;
        }

        public IActionResult Index()
        {
            Geo.GeoServiceClient gsc = new Geo.GeoServiceClient();
            try
            {
                var chk = gsc.KnockKnockAsync("81D88791-EF6D-417D-9E6B-049DC642684A").Result ?? "";
                if (!chk.Equals("81D88791-EF6D-417D-9E6B-049DC642684A"))
                {
                    throw new ApplicationException();
                }
            }
            catch
            {
                ViewData["WCFEndpointError"] = $"Failed to establish a connection to Heatmap Geo Data Service at {gsc.Endpoint.Address}. Please check service availability and restart browser.";
            }
            return View();
        }

        [Route("home/getgeodata")]
        public async Task<JsonResult> GetGeoData()
        {
            Geo.GeoServiceClient gsc = new Geo.GeoServiceClient();
            try
            {
                Geo.OrderGeoDataPoint[] geoDataPoints = await gsc.GetOrderDataPointsAsync();

                var model = new HeatmapCoordinates().Points = geoDataPoints.Select(dp => new HeatmapDataPoint()
                {
                    Latitude = dp.Latitude,
                    Longitude = dp.Longitude
                }).ToList();
                return Json(model);
            }
            catch (FaultException<Geo.DataServiceFault> fault)
            {
                Response.StatusCode = (int)System.Net.HttpStatusCode.InternalServerError;
                return Json(new { success = false, responseText = $"{fault.Detail} - {fault.Message}" });
            }
            finally
            {
                await gsc.CloseAsync();
            }
        }

        [HttpGet, Route("home/getmapsettings")]
        public JsonResult GetMapSettings()
        {
            //TODO: trap errors
            var cacheKey = _configuration["Caching:Key"] ?? "";
            var settings = new HeatmapSettings();
           
            if (_cache.TryGetValue(cacheKey, out HeatmapSettings result))
            {
                settings.GradientType = result.GradientType;
                settings.Radius = result.Radius;
                settings.Opacity = result.Opacity;
            };
            return Json(settings);
        }

        [HttpPost, Route("home/setmapsettings")]
        public JsonResult SetMapSettings([FromBody]HeatmapSettings heatMapSettings)
        {
            var cacheKey = _configuration["Caching:Key"] ?? "";
            var cacheDuration = int.TryParse(_configuration["Caching:MinutesToCache"], out int returnValue)
                ? int.Parse(_configuration["Caching:MinutesToCache"])
                : 1440;

            var cacheEntryOptions = new MemoryCacheEntryOptions().SetSlidingExpiration(TimeSpan.FromMinutes(cacheDuration));

            var result = _cache.Set(cacheKey, heatMapSettings, cacheEntryOptions);

            return Json(result);
        }
    }
}
