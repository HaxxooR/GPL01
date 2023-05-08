using Abp.Application.Services.Dto;
using Abp.AutoMapper;
using LAB_0805.MultiTenancy;

namespace LAB_0805.Sessions.Dto
{
    [AutoMapFrom(typeof(Tenant))]
    public class TenantLoginInfoDto : EntityDto
    {
        public string TenancyName { get; set; }

        public string Name { get; set; }
    }
}
