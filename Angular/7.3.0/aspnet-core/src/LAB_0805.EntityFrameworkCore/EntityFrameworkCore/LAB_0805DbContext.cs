using Microsoft.EntityFrameworkCore;
using Abp.Zero.EntityFrameworkCore;
using LAB_0805.Authorization.Roles;
using LAB_0805.Authorization.Users;
using LAB_0805.MultiTenancy;

namespace LAB_0805.EntityFrameworkCore
{
    public class LAB_0805DbContext : AbpZeroDbContext<Tenant, Role, User, LAB_0805DbContext>
    {
        /* Define a DbSet for each entity of the application */
        
        public LAB_0805DbContext(DbContextOptions<LAB_0805DbContext> options)
            : base(options)
        {
        }
    }
}
