using EWN.Data.Repo.Core;
using RandomDataGenerator.Data.DataContext;
using RandomDataGenerator.Data.Entities;
using System;

namespace RandomDataGenerator.Data.UnitOfWork
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly RDContext _context;
        private bool disposed = false;
        public UnitOfWork(RDContext context)
        {
            _context = context;
        }
        
        public IRepository<EmployeeEntity> EmployeeRepository => new Repository<EmployeeEntity>(_context);

        public IRepository<CompanyEntity> CompanyRepository => new Repository<CompanyEntity>(_context);

        public IRepository<StreetEntity> StreetRepository => new Repository<StreetEntity>(_context);

        public int CallGenerateEmployeesSp(string companyName, Guid companyUID, int count)
        {
            return _context.GenerateEmployees(companyName, companyUID, count);
        }

        public int CallGenerateWidgetWarehousesSp(string companyName, Guid companyUID, int count)
        {
            return _context.GenerateWidgetWarehouses(companyName, companyUID, count);
        }

        public int CallGenerateWidgetsSp(string companyName, Guid companyUID, int count)
        {
            return _context.GenerateWidgets(companyName, companyUID, count);
        }

        public int CallGenerateWidgetPackageTypeSp()
        {
            return _context.GenerateWidgetPackageTypes();
        }

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    _context.Dispose();
                }
            }
            this.disposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}
