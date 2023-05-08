using Abp.AspNetCore;
using Abp.AspNetCore.TestBase;
using Abp.Modules;
using Abp.Reflection.Extensions;
using LAB_0805.EntityFrameworkCore;
using LAB_0805.Web.Startup;
using Microsoft.AspNetCore.Mvc.ApplicationParts;

namespace LAB_0805.Web.Tests
{
    [DependsOn(
        typeof(LAB_0805WebMvcModule),
        typeof(AbpAspNetCoreTestBaseModule)
    )]
    public class LAB_0805WebTestModule : AbpModule
    {
        public LAB_0805WebTestModule(LAB_0805EntityFrameworkModule abpProjectNameEntityFrameworkModule)
        {
            abpProjectNameEntityFrameworkModule.SkipDbContextRegistration = true;
        } 
        
        public override void PreInitialize()
        {
            Configuration.UnitOfWork.IsTransactional = false; //EF Core InMemory DB does not support transactions.
        }

        public override void Initialize()
        {
            IocManager.RegisterAssemblyByConvention(typeof(LAB_0805WebTestModule).GetAssembly());
        }
        
        public override void PostInitialize()
        {
            IocManager.Resolve<ApplicationPartManager>()
                .AddApplicationPartsIfNotAddedBefore(typeof(LAB_0805WebMvcModule).Assembly);
        }
    }
}