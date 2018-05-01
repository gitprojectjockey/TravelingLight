using System;

namespace RRDDataGenerator.Models.Employee
{
    public abstract class EmployeeBase
    {
        public abstract string Id { get; set; }

        public abstract string FirstName { get; set; }

        public abstract string LastName { get; set; }

        public abstract DateTime HireDate { get; set; }

        public abstract string EmployeeNumber { get; set; }

        public virtual string GetDescription()
        {
            return $"Employee {EmployeeNumber}-{FirstName} {LastName} was hired on {HireDate}";
        }
    }
}
