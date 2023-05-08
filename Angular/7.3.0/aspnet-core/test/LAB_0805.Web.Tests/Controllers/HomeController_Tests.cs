using System.Threading.Tasks;
using LAB_0805.Models.TokenAuth;
using LAB_0805.Web.Controllers;
using Shouldly;
using Xunit;

namespace LAB_0805.Web.Tests.Controllers
{
    public class HomeController_Tests: LAB_0805WebTestBase
    {
        [Fact]
        public async Task Index_Test()
        {
            await AuthenticateAsync(null, new AuthenticateModel
            {
                UserNameOrEmailAddress = "admin",
                Password = "123qwe"
            });

            //Act
            var response = await GetResponseAsStringAsync(
                GetUrl<HomeController>(nameof(HomeController.Index))
            );

            //Assert
            response.ShouldNotBeNullOrEmpty();
        }
    }
}