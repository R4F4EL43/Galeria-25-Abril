using _25_Abril.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace _25_Abril.Controllers
{
    public class HomeController : Controller
    {
        private Entities25Abril BD = new Entities25Abril();

        public ActionResult Index()
        {
            List<FavArtes> favArtes = new List<FavArtes>();
            if(BD.FavArtes != null)
            {
                foreach (FavArtes fav in BD.FavArtes.ToList())
                {
                    if (BD.Arte.FirstOrDefault(s => s.ID_Arte == fav.Arte_ID) != null && BD.Conta.FirstOrDefault(s => s.ID_Conta == fav.Arte.Conta.ID_Conta) != null)
                    {
                        fav.Arte = BD.Arte.FirstOrDefault(s => s.ID_Arte == fav.Arte_ID);
                        fav.Arte.Conta = BD.Conta.FirstOrDefault(s => s.ID_Conta == fav.Arte.Conta.ID_Conta);
                        favArtes.Add(fav);
                    }
                }
            }            
            return View(favArtes);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}