using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(RovingGM.Startup))]
namespace RovingGM
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
