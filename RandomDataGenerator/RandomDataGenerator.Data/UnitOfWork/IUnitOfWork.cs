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

        int CallGenerateEmployeesSp(string companyName, Guid companyUID, int count);
        int CallGenerateWidgetWarehousesSp(string companyName, Guid companyUID, int count);
        int CallGenerateWidgetsSp(string companyName, Guid companyUID, int count);
        int CallGenerateWidgetPackageTypeSp();
    }
}
