using System.Data.Common;
using Microsoft.EntityFrameworkCore;

namespace LAB_0805.EntityFrameworkCore
{
    public static class LAB_0805DbContextConfigurer
    {
        public static void Configure(DbContextOptionsBuilder<LAB_0805DbContext> builder, string connectionString)
        {
            builder.UseSqlServer(connectionString);
        }

        public static void Configure(DbContextOptionsBuilder<LAB_0805DbContext> builder, DbConnection connection)
        {
            builder.UseSqlServer(connection);
        }
    }
}
