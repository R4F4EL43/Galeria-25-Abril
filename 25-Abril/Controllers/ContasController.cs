using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Runtime.Remoting.Messaging;
using System.Security.Cryptography;
using System.Web;
using System.Web.Mvc;
using _25_Abril.Models;

namespace _25_Abril.Controllers
{
    public class ContasController : Controller
    {
        SqlConnection Connection = new SqlConnection(@"Server=.\SQLEXPRESS;Database=25-Abril;Trusted_Connection=True;");
        private Entities25Abril BD = new Entities25Abril();

        // GET: Contas
        public ActionResult Index()
        {
            return View(BD.Conta.ToList());
        }

        // GET: Contas/Details/5
        public ActionResult Details(string nome)
        {
            if (nome == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Conta conta = BD.Conta.FirstOrDefault(s => s.Nome == nome);
            if (conta == null)
            {
                return HttpNotFound();
            }
            return View(conta);
        }

        // GET: Contas/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Contas/Create
        // Para proteger-se contra ataques de excesso de postagem, ative as propriedades específicas às quais deseja se associar. 
        // Para obter mais detalhes, confira https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Nome,Email,Password")] Conta conta)
        {
            if (ModelState.IsValid)
            {
                BD.addConta(conta.Nome, conta.Email, conta.Password, false);
                BD.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(conta);
        }

        // GET: Contas/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Conta conta = BD.Conta.Find(id);
            if (conta == null)
            {
                return HttpNotFound();
            }
            return View(conta);
        }

        // POST: Contas/Edit/5
        // Para proteger-se contra ataques de excesso de postagem, ative as propriedades específicas às quais deseja se associar. 
        // Para obter mais detalhes, confira https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(string nome, [Bind(Include = "Nome,Email,Password")] Conta conta)
        {
            if (ModelState.IsValid)
            {
                BD.updConta(nome, conta.Nome, conta.Email, conta.Password);
                //BD.Entry(conta).State = EntityState.Modified;
                BD.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(conta);
        }

        // GET: Contas/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Conta conta = BD.Conta.Find(id);
            if (conta == null)
            {
                return HttpNotFound();
            }
            return View(conta);
        }

        // POST: Contas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Conta conta = BD.Conta.Find(id);
            BD.Conta.Remove(conta);
            BD.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                BD.Dispose();
            }
            base.Dispose(disposing);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(string Nome, string Password)
        {
            if(Nome != null && Password != null)
            {
                Conta conta = BD.Conta.FirstOrDefault(s => s.Nome == Nome && s.Password == Password);
                if(conta != null)
                {
                    return RedirectToAction("Details", new { nome = conta.Nome });
                }
            }


            return RedirectToAction("Index");
        }

        
        
    }
}
