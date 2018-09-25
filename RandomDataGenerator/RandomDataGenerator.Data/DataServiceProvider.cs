using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using RandomDataGenerator.Data.Entities;
using RandomDataGenerator.Data.UnitOfWork;

namespace RandomDataGenerator.Data
{
    public class DataServiceProvider : IDataServiceProvider
    {
        IUnitOfWork _unitOfWork;
        public DataServiceProvider(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public async Task<List<CompanyEntity>> GetCompanies()
        {
            var companies = await _unitOfWork.CompanyRepository.GetAllAsync();
            return companies.ToList();
        }

        public async Task<List<EmployeeEntity>> GetEmployees()
        {
          var employees = await _unitOfWork.EmployeeRepository.GetAllAsync();
          return employees.ToList();
        }

        public async Task<List<StreetEntity>> GetStreets()
        {
            var streets = await _unitOfWork.StreetRepository.GetAllAsync();
            return streets.ToList();
        }

        public int GenerateEmployees(string companyName, Guid companyUID, int count )
        {
            return _unitOfWork.CallGenerateEmployeesSp(companyName,companyUID,count);
        }

        public int GenerateWidgetPackageTypes()
        {
            return _unitOfWork.CallGenerateWidgetPackageTypeSp();
        }

        public int GenerateWidgets(string companyName, Guid companyUID, int count)
        {
            return _unitOfWork.CallGenerateWidgetsSp(companyName, companyUID, count);
        }

        public int GenerateWidgetWarehouses(string companyName, Guid companyUID, int count)
        {
            return _unitOfWork.CallGenerateWidgetWarehousesSp(companyName, companyUID, count);
        }
    }
}
