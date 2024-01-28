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
using _25_Abril.ViewModels;

namespace _25_Abril.Controllers
{
    public class ContasController : Controller
    {
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

            List<Arte> artes = new List<Arte>();
            if(BD.Arte != null)
            {
                foreach (Arte arte in BD.Arte)
                {
                    if (arte.Conta_ID == conta.ID_Conta)
                        artes.Add(arte);
                }
            }            

            ContaArte_ViewModel model = new ContaArte_ViewModel();
            model.Conta = conta;
            model.Artes = artes;
            
            return View(model);
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
        public ActionResult Create(string Nome, string Email, string Password)
        {
            if (Nome != null && Email != null && Password != null)
            {
                if(BD.Conta.FirstOrDefault(s => s.Nome == Nome && s.Email == Email && s.Password == Password) == null)
                {
                    BD.addConta(Nome, Email, Password, false);
                    BD.SaveChanges();
                    
                    if (BD.Conta.FirstOrDefault(s => s.Nome == Nome && s.Email == Email && s.Password == Password) != null)
                    {
                        Session["User"] = Nome; 
                        return RedirectToAction("Details", new { nome = Nome });
                    }
                        
                }                
            }

            return View();
        }

        // GET: Contas/Edit/5
        public ActionResult Edit(string nome)
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
                    Session["User"] = conta.Nome;
                    Session["UserImage"] = conta.Image;
                    return RedirectToAction("Details", new { nome = conta.Nome });
                }
            }


            return RedirectToAction("Index");
        }

        public ActionResult Logout()
        {
            Session["User"] = null;
            Session["UserImage"] = null;
            return RedirectToAction("Index", "Home");
        }


        public ActionResult Admin()
        {
            PedidoTipoPedido_ViewModel model = new PedidoTipoPedido_ViewModel();
            if (BD.PedidosAdmins != null)
                model.Pedidos = BD.PedidosAdmins.ToList();

            if (BD.TipoPedidoes != null)
                model.Tipos = BD.TipoPedidoes.ToList();


            return View(model);
        }

        public ActionResult Comentarios(string nome)
        {
            if (nome == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Arte arte = BD.Arte.FirstOrDefault(s => s.Nome_Arte == nome);
            if (arte == null)
            {
                return HttpNotFound();
            }

            List<Comentario> comentarios = new List<Comentario>();
            if (BD.Comentario.ToList() != null)
            {
                foreach (Comentario com in BD.Comentario.ToList())
                {
                    if (com.Arte_ID == arte.ID_Arte)
                        comentarios.Add(com);
                }
            }
            Session["CurrentArte"] = arte.ID_Arte;

            return View(comentarios);
        }

        
        /////////////////////////////////////////////////////////////
        


        public ActionResult AcceptPedido()
        {
            PedidosAdmin pedido = BD.PedidosAdmins.Find(1);
            //if (pedido == null)
            //{
            //    return HttpNotFound();
            //}

            return View(pedido);
        }

        public ActionResult RefusePedido()
        {
            PedidosAdmin pedido = BD.PedidosAdmins.Find(1);
            //if (pedido == null)
            //{
            //    return HttpNotFound();
            //}

            return View(pedido);
        }

        public ActionResult AcceptComentario(string nome)
        {
            PedidosAdmin pedido = BD.PedidosAdmins.Find(1);
            //if (pedido == null)
            //{
            //    return HttpNotFound();
            //}

            return View(pedido);
        }

        public ActionResult RefuseComentario(string nome)
        {
            PedidosAdmin pedido = BD.PedidosAdmins.Find(1);
            //if (pedido == null)
            //{
            //    return HttpNotFound();
            //}

            return View(pedido);
        }

    }
}
