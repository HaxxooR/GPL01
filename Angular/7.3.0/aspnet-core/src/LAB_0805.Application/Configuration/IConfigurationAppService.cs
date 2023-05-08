using System.Threading.Tasks;
using LAB_0805.Configuration.Dto;

namespace LAB_0805.Configuration
{
    public interface IConfigurationAppService
    {
        Task ChangeUiTheme(ChangeUiThemeInput input);
    }
}
