using System;
using RandomDataGenerator.Models.Company;

namespace RandomDataGenerator.Models.Employee
{
    public class BigWidgetsEmployee : IEmployee
    {
        public string Id { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public DateTime HireDate { get; set; }

        public ICompany Company { get; set; }
    }
}

