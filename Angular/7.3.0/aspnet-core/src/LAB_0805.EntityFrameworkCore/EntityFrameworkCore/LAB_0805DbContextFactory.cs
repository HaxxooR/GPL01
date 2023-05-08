using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using Microsoft.Extensions.Configuration;
using LAB_0805.Configuration;
using LAB_0805.Web;

namespace LAB_0805.EntityFrameworkCore
{
    /* This class is needed to run "dotnet ef ..." commands from command line on development. Not used anywhere else */
    public class LAB_0805DbContextFactory : IDesignTimeDbContextFactory<LAB_0805DbContext>
    {
        public LAB_0805DbContext CreateDbContext(string[] args)
        {
            var builder = new DbContextOptionsBuilder<LAB_0805DbContext>();
            
            /*
             You can provide an environmentName parameter to the AppConfigurations.Get method. 
             In this case, AppConfigurations will try to read appsettings.{environmentName}.json.
             Use Environment.GetEnvironmentVariable("ASPNETCORE_ENVIRONMENT") method or from string[] args to get environment if necessary.
             https://docs.microsoft.com/en-us/ef/core/cli/dbcontext-creation?tabs=dotnet-core-cli#args
             */
            var configuration = AppConfigurations.Get(WebContentDirectoryFinder.CalculateContentRootFolder());

            LAB_0805DbContextConfigurer.Configure(builder, configuration.GetConnectionString(LAB_0805Consts.ConnectionStringName));

            return new LAB_0805DbContext(builder.Options);
        }
    }
}
