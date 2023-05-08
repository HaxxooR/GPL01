using Abp.Application.Services;
using LAB_0805.MultiTenancy.Dto;

namespace LAB_0805.MultiTenancy
{
    public interface ITenantAppService : IAsyncCrudAppService<TenantDto, int, PagedTenantResultRequestDto, CreateTenantDto, TenantDto>
    {
    }
}

