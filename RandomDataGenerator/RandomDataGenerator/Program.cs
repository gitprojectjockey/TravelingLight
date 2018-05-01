using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using RandomDataGenerator.Common;
using RandomDataGenerator.Data;
using RandomDataGenerator.Data.Entities;
using RandomDataGenerator.Factories;
using RandomDataGenerator.Models.Company;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RandomDataGenerator
{
    class Program
    {

      

        static void Main(string[] args)
        {

            MainAsync().GetAwaiter().GetResult();
            Console.ReadKey();
        }


        public static async Task MainAsync()
        {
            IConfiguration config = new ConfigurationBuilder()
               .AddJsonFile("appsettings.json", true, true)
               .Build();

            for (var i = 1; i < 100; i++)
            {
                DateTime pastDay = RandomValue.RandomPastDay(1, 10000);

                var birthDay = RandomValue.RandomPastDayString(1, 10000);

                var productPrice = RandomValue.RandomFormattedPrice(100, 10000);

                var streetNumber = RandomValue.RandomStreetNumber(100, 900);

                var phoneNumber = RandomValue.RandomPhoneNumber();

                var guidId = Identification.GetGuidId();

                Console.WriteLine(guidId);
            }

            var serviceProvider = RandomDataGeneratorServiceProvider.GetProvider(config);
            DataServiceProvider dsp = serviceProvider.GetRequiredService<DataServiceProvider>();
            List<CompanyEntity> companyEntities = await dsp.GetCompanies();
            List<EmployeeEntity> employeesEntities = await dsp.GetEmployees();
            List<StreetEntity> streetEntities = await dsp.GetStreets();

            //Get a list of employee name structure to pass to company factories
            List<PersonName> personNameList = employeesEntities.Select(e => new PersonName(e.Id, e.Name.Trim())).ToList();
            List<StreetName> streetNameList = streetEntities.Select(e => new StreetName(e.Id, e.Name.Trim())).ToList();


            foreach (var entity in companyEntities)
            {
                switch (entity.SCAC)
                {
                    case "WGWI":
                        ICompany woodgroveWidgets = new WoodGroveWidgetsCompanyFactory().CreateCompany(entity.UID,entity.Name, personNameList);
                        break;
                    case "OWII":
                        break;
                    case "SKWG":
                        break;
                    case "PLWS":
                        break;
                    case "HGWM":
                        break;
                    case "BGWT":
                        break;
                    case "EWDM":
                        break;
                    default:
                        break;
                }
                
            }

            //JsonObjectFactory<Company> companyFactory = new JsonObjectFactory<Company>();
            //foreach (var c in companies)
            //{
            //    string companyJson = companyFactory.GetJsonObjectString(c);
            //}

        }
    }
}

