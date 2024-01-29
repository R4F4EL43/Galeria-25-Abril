using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Runtime.Remoting.Messaging;
using System.Security.Cryptography;
using System.Web;
using System.Web.Mvc;
using _25_Abril.Models;
using _25_Abril.ViewModels;
using Microsoft.Ajax.Utilities;

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
            if (BD.Arte != null)
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
                if (BD.Conta.FirstOrDefault(s => s.Nome == Nome && s.Email == Email && s.Password == Password) == null)
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
            if (Nome != null && Password != null)
            {
                Conta conta = BD.Conta.FirstOrDefault(s => s.Nome == Nome && s.Password == Password);
                if (conta != null)
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
            List<PedidosAdmin> pedidos = new List<PedidosAdmin>();
            if (BD.PedidosAdmin != null)
                pedidos = BD.PedidosAdmin.ToList();


            return View(pedidos);
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
            Comentario comentario = new Comentario();

            ArteComentarios_ViewModel arteComentario = new ArteComentarios_ViewModel();
            arteComentario.Arte = arte;
            arteComentario.Comentarios = comentarios;
            arteComentario.Comentario = comentario;

            Session["CurrentArte"] = arte.ID_Arte;
            return View(arteComentario);
        }

        public ActionResult AcceptComentario(int id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            Comentario comentario = BD.Comentario.Find(id);
            if (comentario == null)
                return HttpNotFound();

            BD.acptComentario(id);
            BD.SaveChanges();

            Arte arte = new Arte();
            arte = BD.Arte.FirstOrDefault(s => s.ID_Arte == comentario.Arte_ID);
            return RedirectToAction("Comentarios", "Contas", new { nome = arte.Nome_Arte });
        }

        public ActionResult RefuseComentario(int id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            Comentario comentario = BD.Comentario.Find(id);
            if (comentario == null)
                return HttpNotFound();

            BD.rfvComentario(id);
            BD.SaveChanges();

            Arte arte = BD.Arte.FirstOrDefault(s => s.ID_Arte == comentario.Arte_ID);
            return RedirectToAction("Comentarios", "Contas", new { nome = arte.Nome_Arte });
        }


        public ActionResult AcceptArt(string nome)
        {
            if (nome == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            Arte arte = BD.Arte.FirstOrDefault(s => s.Nome_Arte == nome);
            if (arte == null)
                return HttpNotFound();

            BD.rfvArte(arte.Nome_Arte);
            BD.SaveChanges();

            return RedirectToAction("Comentarios", "Contas", new { nome = arte.Nome_Arte });
        }

        public ActionResult RefuseArt(string nome)
        {
            if(nome == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            Arte arte = BD.Arte.FirstOrDefault(s => s.Nome_Arte == nome);
            if (arte == null)
                return HttpNotFound();

            BD.acptArte(arte.Nome_Arte);
            BD.SaveChanges();


            return RedirectToAction("Comentarios", "Contas", new { nome = arte.Nome_Arte });
        }

        public ActionResult TiposArte()
        {
            List<Tipo_de_Arte> tipos = new List<Tipo_de_Arte>();
            tipos = BD.Tipo_de_Arte.ToList();

            return View(tipos);
        }

        public ActionResult CreateTipo(string tipo)
        {
            if(tipo == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            BD.addTipoArte(tipo);
            BD.SaveChanges();

            return RedirectToAction("TiposArte", "Contas");
        }

        public ActionResult DelTipo(string tipo)
        {
            if (tipo == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            Tipo_de_Arte tipoArte = BD.Tipo_de_Arte.FirstOrDefault(s => s.Tipo_Arte == tipo);
            if(BD.Arte.FirstOrDefault(s => s.TipoArte_ID == tipoArte.ID_Tipo) == null)
            {
                BD.delTipoArte(tipo);
                BD.SaveChanges();
            }
            

            return RedirectToAction("TiposArte", "Contas");
        }

        public ActionResult DelArte (string nome)
        {
            if (nome == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            Arte arte = BD.Arte.FirstOrDefault(s => s.Nome_Arte == nome);
            if (arte == null)
                return HttpNotFound();

            BD.delArte(arte.Nome_Arte);
            BD.SaveChanges();


            return RedirectToAction("Details", "Contas", new { nome = Session["User"] });
        }

        public ActionResult UploadFoto(HttpPostedFileBase ficheiro, string nome)
        {
            if (ficheiro != null && ficheiro.ContentLength > 0 && nome != null)
            {
                Conta conta = BD.Conta.FirstOrDefault(s => s.Nome == nome);

                string data = DateTime.Today.Day.ToString() + DateTime.Today.Month.ToString() + DateTime.Today.Year.ToString();
                string hora = DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString();
                string fichName = data + hora + "-" + conta.Nome + "Image." + ficheiro.FileName.Trim().Split('.')[1];

                string projectFolder = Server.MapPath("~/Imagens/Users/");
                string filePath = Path.Combine(projectFolder, fichName);                

                

                if (conta != null)
                {
                    BD.stImage(conta.Nome, "/Imagens/Users/" + fichName);
                    Session["UserImage"] = conta.Image;
                    ficheiro.SaveAs(filePath);
                }                
            }
            return RedirectToAction("Details", "Contas", new { nome = Session["User"] });
        }

        public ActionResult UploadArte()
        {
            Arte arte = new Arte();

            List<string> listTipos = new List<string>();
            foreach (Tipo_de_Arte tipoArte in BD.Tipo_de_Arte)
            {
                listTipos.Add(tipoArte.Tipo_Arte);
            }
            IEnumerable<string> tipos = listTipos;

            Tipo_de_Arte tipo = new Tipo_de_Arte();

            ArteTiposArte_ViewModel model = new ArteTiposArte_ViewModel();
            model.Arte = arte;
            model.Tipos = tipos;
            model.Tipo = tipo;

            return View(model);
        }

        public ActionResult AddArte(HttpPostedFileBase ficheiro, string nome, string Nome_Arte, string Descricao, string Tipo_de_Arte)
        {
            if(nome == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            if (Nome_Arte == null || Descricao == null || Tipo_de_Arte == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            Conta conta = BD.Conta.FirstOrDefault(s => s.Nome == nome);
            if (conta == null)
                return HttpNotFound();

            Arte arte = BD.Arte.FirstOrDefault(s => s.Nome_Arte == Nome_Arte && s.Conta_ID == conta.ID_Conta);
            if(arte != null)
                return RedirectToAction("Details", "Contas", new { nome = Session["User"] });
            



            if (ficheiro != null && ficheiro.ContentLength > 0)
            {

                string data = DateTime.Today.Day.ToString() + DateTime.Today.Month.ToString() + DateTime.Today.Year.ToString();
                string hora = DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString();
                string fichName = data + hora + "-" + conta.Nome + "Arte." + ficheiro.FileName.Trim().Split('.')[1];

                string projectFolder = Server.MapPath("~/Imagens/Projetos/");
                string filePath = Path.Combine(projectFolder, fichName);



                if (conta != null)
                {
                    if((BD.addArte(Nome_Arte, Descricao, conta.Nome, Tipo_de_Arte, "/Imagens/Projetos/" + fichName)) > 0)
                    {
                        BD.SaveChanges();
                        ficheiro.SaveAs(filePath);
                    }
                    
                }
            }
            return RedirectToAction("Details", "Contas", new { nome = Session["User"] });
        }


    }
}
