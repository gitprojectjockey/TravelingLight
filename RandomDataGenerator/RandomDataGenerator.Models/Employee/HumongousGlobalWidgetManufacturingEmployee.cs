using RandomDataGenerator.Models.Company;
using System;

namespace RandomDataGenerator.Models.Employee
{
    public class HumongousGlobalWidgetManufacturingEmployee : IEmployee
    {
        public string Id { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public DateTime HireDate { get; set; }

        public ICompany Company { get; set; }
    }
}

