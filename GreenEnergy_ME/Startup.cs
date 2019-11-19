using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(GreenEnergy_ME.Startup))]
namespace GreenEnergy_ME
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
