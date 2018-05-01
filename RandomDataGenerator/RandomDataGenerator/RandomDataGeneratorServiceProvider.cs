using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using RandomDataGenerator.Data;
using RandomDataGenerator.Data.DataContext;
using RandomDataGenerator.Data.UnitOfWork;
using System;

namespace RandomDataGenerator.Common
{
    public static class RandomDataGeneratorServiceProvider
    {
        public static IServiceProvider GetProvider(IConfiguration config)
        {
            var services = new ServiceCollection();
            services.AddDbContext<RDContext>(options => options.UseSqlServer(config.GetConnectionString("RDDConnection")));
            services.AddScoped<IUnitOfWork, UnitOfWork>();
            services.AddTransient<DataServiceProvider>();
            return services.BuildServiceProvider();
        }
    }
}
