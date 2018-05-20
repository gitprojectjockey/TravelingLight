using Microsoft.EntityFrameworkCore;
using RandomDataGenerator.Data.Entities;
using System;
using System.Data;
using System.Data.SqlClient;

namespace RandomDataGenerator.Data.DataContext
{
    public class RDContext : DbContext
    {
        public RDContext(DbContextOptions options) : base(options) { }

        public DbSet<EmployeeEntity> Employee { get; set; }
        public DbSet<CompanyEntity> Company { get; set; }
        public DbSet<StreetEntity> Street { get; set; }

        public int GenerateWidgetPackageTypes()
        {
            return Database.ExecuteSqlCommand("GenerateWidgetPackageTypes");
        }

        public int GenerateWidgetWarehouses(string companyName, Guid companyUID, int count)
        {
            return Database.ExecuteSqlCommand
                   (
                     "GenerateWidgetWarehouses @CompanyUID,@CompanyName,@RequestedWarehouseCount",
                     new SqlParameter("@CompanyUID", companyUID.ToString()),
                     new SqlParameter("@CompanyName", companyName),
                     new SqlParameter("@RequestedWarehouseCount", count)
                   );
        }

        public int GenerateWidgets(string companyName, Guid companyUID, int count)
        {
            return Database.ExecuteSqlCommand
                   (
                     "GenerateWidgets @CompanyUID,@CompanyName,@RequestedWidgetCount",
                     new SqlParameter("@CompanyUID", companyUID.ToString()),
                     new SqlParameter("@CompanyName", companyName),
                     new SqlParameter("@RequestedWidgetCount", count)
                   );
        }

        public int GenerateEmployees(string companyName, Guid companyUID, int count)
        {
            return Database.ExecuteSqlCommand
                   (
                     "GenerateEmployees @CompanyUID,@CompanyName,@RequestedEmployeeCount",
                     new SqlParameter("@CompanyUID", companyUID.ToString()),
                     new SqlParameter("@CompanyName", companyName),
                     new SqlParameter("@RequestedEmployeeCount", count)
                   );
        }
    }
}
