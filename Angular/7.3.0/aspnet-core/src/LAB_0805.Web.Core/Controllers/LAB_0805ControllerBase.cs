using Abp.AspNetCore.Mvc.Controllers;
using Abp.IdentityFramework;
using Microsoft.AspNetCore.Identity;

namespace LAB_0805.Controllers
{
    public abstract class LAB_0805ControllerBase: AbpController
    {
        protected LAB_0805ControllerBase()
        {
            LocalizationSourceName = LAB_0805Consts.LocalizationSourceName;
        }

        protected void CheckErrors(IdentityResult identityResult)
        {
            identityResult.CheckErrors(LocalizationManager);
        }
    }
}
