using System.Threading.Tasks;
using Abp.Application.Services;
using LAB_0805.Sessions.Dto;

namespace LAB_0805.Sessions
{
    public interface ISessionAppService : IApplicationService
    {
        Task<GetCurrentLoginInformationsOutput> GetCurrentLoginInformations();
    }
}
