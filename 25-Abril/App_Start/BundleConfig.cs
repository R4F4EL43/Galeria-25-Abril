using System.Web;
using System.Web.Optimization;
using System.Web.Services.Description;

namespace _25_Abril
{
    public class BundleConfig
    {
        // Para obter mais informações sobre o agrupamento, visite https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use a versão em desenvolvimento do Modernizr para desenvolver e aprender com ela. Após isso, quando você estiver
            // pronto para a produção, utilize a ferramenta de build em https://modernizr.com para escolher somente os testes que precisa.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new Bundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      "~/Content/site.css",
                      "~/Content/Login.css"));

            bundles.Add(new StyleBundle("~/Content/Login").Include(
                      "~/Content/Account/Login.css", 
                      "~/Content/Code.css"));

            bundles.Add(new StyleBundle("~/Content/Home").Include(
                     "~/Content/Home/Home.css",
                     "~/Content/Code.css"));            

            bundles.Add(new StyleBundle("~/Content/Projetos").Include(
                     "~/Content/Projetos/Projetos.css",
                     "~/Content/Code.css"));

            bundles.Add(new StyleBundle("~/Content/About").Include(
                     "~/Content/About/About.css",
                     "~/Content/Code.css"));

            bundles.Add(new StyleBundle("~/Content/About").Include(
                     "~/Content/Projetos/Projetos.css",
                     "~/Content/Code.css"));

            bundles.Add(new StyleBundle("~/Content/Comentarios").Include(
                     "~/Content/Projetos/Comentarios.css",
                     "~/Content/Projetos/Projetos.css",
                     "~/Content/Code.css"));

            bundles.Add(new StyleBundle("~/Content/Profile").Include(
                     "~/Content/Account/Profile.css",
                     "~/Content/Code.css"));

        }
    }
}
