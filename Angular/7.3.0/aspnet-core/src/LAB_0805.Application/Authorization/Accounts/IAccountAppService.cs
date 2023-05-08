using System.Threading.Tasks;
using Abp.Application.Services;
using LAB_0805.Authorization.Accounts.Dto;

namespace LAB_0805.Authorization.Accounts
{
    public interface IAccountAppService : IApplicationService
    {
        Task<IsTenantAvailableOutput> IsTenantAvailable(IsTenantAvailableInput input);

        Task<RegisterOutput> Register(RegisterInput input);
    }
}
