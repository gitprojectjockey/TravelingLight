using System;
using System.Collections.Generic;
using RandomDataGenerator.Models.Employee;

namespace RandomDataGenerator.Models.Company
{
    public class BigWidgets : ICompany
    {
        public Guid Id { get; set; }
        public  string Name { get; set; }
        public  DateTime Est { get; set; }
        public  string Address { get; set; }
        public  string Email { get; set; }
        public  string Phone { get; set; }
        public List<IEmployee> Employees { get; set; }
    }
}
