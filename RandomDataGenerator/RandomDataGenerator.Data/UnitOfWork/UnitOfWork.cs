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
