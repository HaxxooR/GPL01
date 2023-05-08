using Abp.AutoMapper;
using Abp.Modules;
using Abp.Reflection.Extensions;
using LAB_0805.Authorization;

namespace LAB_0805
{
    [DependsOn(
        typeof(LAB_0805CoreModule), 
        typeof(AbpAutoMapperModule))]
    public class LAB_0805ApplicationModule : AbpModule
    {
        public override void PreInitialize()
        {
            Configuration.Authorization.Providers.Add<LAB_0805AuthorizationProvider>();
        }

        public override void Initialize()
        {
            var thisAssembly = typeof(LAB_0805ApplicationModule).GetAssembly();

            IocManager.RegisterAssemblyByConvention(thisAssembly);

            Configuration.Modules.AbpAutoMapper().Configurators.Add(
                // Scan the assembly for classes which inherit from AutoMapper.Profile
                cfg => cfg.AddMaps(thisAssembly)
            );
        }
    }
}
