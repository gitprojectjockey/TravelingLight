using RandomDataGenerator.Models.Company;
using System;

namespace RandomDataGenerator.Models.Employee
{
    public interface IEmployee
    {
        string Id { get; set; }

        string FirstName { get; set; }

        string LastName { get; set; }

        DateTime HireDate { get; set; }

        ICompany Company { get; set; }
    }       
}
