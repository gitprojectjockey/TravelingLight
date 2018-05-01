using RandomDataGenerator.Models.Employee;
using System;
using System.Collections.Generic;

namespace RandomDataGenerator.Models.Company
{
    public interface ICompany
    {
        Guid Id { get; set; }
        string Name { get; set; }
        DateTime Est { get; set; }
        string Address { get; set; }
        string Phone { get; set; }
        string Email { get; set; }
        List<IEmployee> Employees { get; set; }
    }
}
