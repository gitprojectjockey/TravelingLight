using Microsoft.EntityFrameworkCore;
using RandomDataGenerator.Data.Entities;

namespace RandomDataGenerator.Data.DataContext
{
    public class RDContext : DbContext
    {
        public RDContext(DbContextOptions options) : base(options)
        {
        }
        public DbSet<EmployeeEntity> Employee{ get; set; }
        public DbSet<CompanyEntity> Company { get; set; }
        public DbSet<StreetEntity> Street { get; set; }
    }
}
