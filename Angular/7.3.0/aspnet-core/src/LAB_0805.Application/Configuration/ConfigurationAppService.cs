using System.Threading.Tasks;
using Abp.Authorization;
using Abp.Runtime.Session;
using LAB_0805.Configuration.Dto;

namespace LAB_0805.Configuration
{
    [AbpAuthorize]
    public class ConfigurationAppService : LAB_0805AppServiceBase, IConfigurationAppService
    {
        public async Task ChangeUiTheme(ChangeUiThemeInput input)
        {
            await SettingManager.ChangeSettingForUserAsync(AbpSession.ToUserIdentifier(), AppSettingNames.UiTheme, input.Theme);
        }
    }
}
