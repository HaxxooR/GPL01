using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Abp.Modules;
using Abp.Reflection.Extensions;
using LAB_0805.Configuration;

namespace LAB_0805.Web.Host.Startup
{
    [DependsOn(
       typeof(LAB_0805WebCoreModule))]
    public class LAB_0805WebHostModule: AbpModule
    {
        private readonly IWebHostEnvironment _env;
        private readonly IConfigurationRoot _appConfiguration;

        public LAB_0805WebHostModule(IWebHostEnvironment env)
        {
            _env = env;
            _appConfiguration = env.GetAppConfiguration();
        }

        public override void Initialize()
        {
            IocManager.RegisterAssemblyByConvention(typeof(LAB_0805WebHostModule).GetAssembly());
        }
    }
}
