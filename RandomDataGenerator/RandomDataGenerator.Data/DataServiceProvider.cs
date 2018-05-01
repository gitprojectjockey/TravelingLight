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
    }
}
