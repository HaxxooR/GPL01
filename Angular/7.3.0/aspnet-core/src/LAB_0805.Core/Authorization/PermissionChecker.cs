using Abp.Authorization;
using LAB_0805.Authorization.Roles;
using LAB_0805.Authorization.Users;

namespace LAB_0805.Authorization
{
    public class PermissionChecker : PermissionChecker<Role, User>
    {
        public PermissionChecker(UserManager userManager)
            : base(userManager)
        {
        }
    }
}
