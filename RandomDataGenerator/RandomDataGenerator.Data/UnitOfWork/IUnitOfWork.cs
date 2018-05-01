using EWN.Data.Repo.Core;
using RandomDataGenerator.Data.Entities;
using System;

namespace RandomDataGenerator.Data.UnitOfWork
{
    public interface IUnitOfWork : IDisposable
    {
        IRepository<EmployeeEntity> EmployeeRepository { get; }
        IRepository<CompanyEntity> CompanyRepository { get; }
        IRepository<StreetEntity> StreetRepository { get; }
    }
}
