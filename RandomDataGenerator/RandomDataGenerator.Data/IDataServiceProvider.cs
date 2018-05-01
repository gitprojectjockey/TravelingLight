using RandomDataGenerator.Data.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace RandomDataGenerator.Data
{
    public interface IDataServiceProvider
    {
        Task<List<EmployeeEntity>> GetEmployees();
        Task<List<CompanyEntity>> GetCompanies();
        Task<List<StreetEntity>> GetStreets();
    }
}
