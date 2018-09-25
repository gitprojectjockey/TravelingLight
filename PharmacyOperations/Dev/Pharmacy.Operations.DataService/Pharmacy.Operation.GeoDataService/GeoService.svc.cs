using Pharmacy.Operation.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;

namespace Pharmacy.Operation.GeoDataService
{
    public class GeoService : IGeoService
    {
        public List<OrderGeoDataPoint> GetOrderDataPoints()
        {
            try
            {
                List<DataPoint> dataPoints = DataPoints.GetOrderDestinations();

                return dataPoints.Select(dp => new OrderGeoDataPoint()
                {
                    Latitude = dp.Latitude,
                    Longitude = dp.Longitude
                }).ToList();
            }
            catch (Exception ex)
            {
                DataServiceFault fault = new DataServiceFault
                {
                    Result = false,
                    FaultMessage = ex.Message,
                    FaultDescription = $"Pharmacy.Operation.GeoDataService.GeoService.GetOrderDataPoint method threw exception {ex.HResult}",
                };
                
                throw new FaultException<DataServiceFault>(fault,new FaultReason(fault.FaultDescription));
            }
        }

        public string KnockKnock(string whoIsThere)
        {
            return whoIsThere;
        }
    }
}
