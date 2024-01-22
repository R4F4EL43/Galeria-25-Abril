using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using _25_Abril.Models;
using _25_Abril.Controllers;
using System.Web.Services.Description;

namespace _25_Abril.Controllers
{
    public class AccountController : Controller
    {

        Entities25Abril Model = new Entities25Abril();

        // GET: Account
        public ActionResult Index()
        {
            return View();
        }

        // GET: Login
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        //public ActionResult Login(string login, string password)
        //{
        //    Conta conta = null;
        //    if (login != null && password != null)
        //    {
        //        conta = Model.getConta(login, password);
        //        if (conta != null)
        //        {
        //            return RedirectToAction("Home", "Home", "Index");
        //        }
        //    }
        //    return View(conta);
        //}

        public ActionResult Profile(string nome)
        {
            Conta conta = null;
            if(nome != null)
            {
                //conta = Model.g
            }
            return View();
        }
    }
}