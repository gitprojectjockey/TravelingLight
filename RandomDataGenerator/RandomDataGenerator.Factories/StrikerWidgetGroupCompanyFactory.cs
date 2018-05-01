using RandomDataGenerator.Common;
using RandomDataGenerator.Models.Company;
using System;
using System.Collections.Generic;

namespace RandomDataGenerator.Factories
{
    public class StrikerWidgetGroupCompanyFactory : ICompanyFactory
    {
        public ICompany CreateCompany(Guid Id, string name, List<PersonName> employeeNames)
        {
            return new StrikerWidgetGroup();
        }
    }
}
