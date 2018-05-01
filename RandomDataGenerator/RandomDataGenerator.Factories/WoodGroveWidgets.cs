using System;
using System.Collections.Generic;
using RandomDataGenerator.Common;
using RandomDataGenerator.Models.Company;

namespace RandomDataGenerator.Factories
{
    public class WoodGroveWidgetsCompanyFactory : ICompanyFactory
    {
        public ICompany CreateCompany(Guid Id, string name, List<PersonName> employeeNames)
        {
            WoodGroveWidgets company = new WoodGroveWidgets
            {
                Id = Id,
                Name = name,
                Address = $"{RandomValue.RandomStreetNumber(100,5000)}"

            };


            return new WoodGroveWidgets();
        }
    }
}
