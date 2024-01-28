using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using _25_Abril.Models;
using _25_Abril.ViewModels;

namespace _25_Abril.Controllers
{
    public class ArtesController : Controller
    {
        private Entities25Abril db = new Entities25Abril();

        // GET: Artes
        [HttpPost]
        public ActionResult Index()
        {
            List<Arte> artes = new List<Arte>();
            if(db.Arte != null)
            {
                foreach (Arte arte in db.Arte.ToList())
                {

                    if (db.Conta.FirstOrDefault(s => s.ID_Conta == arte.Conta_ID) != null)
                    {
                        arte.Conta = db.Conta.FirstOrDefault(s => s.ID_Conta == arte.Conta_ID);
                        artes.Add(arte);
                    }

                }
            }

            List<Tipo_de_Arte> tiposArte = db.Tipo_de_Arte.ToList();

            ArtesTipoArte_ViewModel arteTipos = new ArtesTipoArte_ViewModel();
            arteTipos.Artes = artes;
            arteTipos.Tipos = tiposArte;

            return View(arteTipos);
        }

        public ActionResult Index(List<string> tipos)
        {
            List<Arte> artes = new List<Arte>();
            if (db.Arte != null)
            {
                foreach (Arte arte in db.Arte.ToList())
                {
                    if (tipos == null || tipos.FirstOrDefault(s => s == arte.Tipo_de_Arte.Tipo_Arte) != null)
                    {
                        if (db.Conta.FirstOrDefault(s => s.ID_Conta == arte.Conta_ID) != null)
                        {
                            arte.Conta = db.Conta.FirstOrDefault(s => s.ID_Conta == arte.Conta_ID);
                            artes.Add(arte);
                        }
                    }

                }
            }

            List<Tipo_de_Arte> tiposArte = db.Tipo_de_Arte.ToList();
            

            ArtesTipoArte_ViewModel arteTipos = new ArtesTipoArte_ViewModel();
            arteTipos.Artes = artes;
            arteTipos.Tipos = tiposArte;

            return View(arteTipos);
        }

        // GET: Artes/Details/5
        public ActionResult Details(string nome)
        {
            if (nome == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Arte arte = db.Arte.FirstOrDefault(s => s.Nome_Arte == nome);
            if (arte == null)
            {
                return HttpNotFound();
            }

            List<Comentario> comentarios = new List<Comentario>();
            if (db.Comentario.ToList() != null)
            {
                foreach (Comentario com in db.Comentario.ToList())
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


            return View(arteComentario);
        }

        // GET: Artes/Create
        public ActionResult Create()
        {
            ViewBag.Conta_ID = new SelectList(db.Conta, "ID_Conta", "Nome");
            ViewBag.TipoArte_ID = new SelectList(db.Tipo_de_Arte, "ID_Tipo", "Tipo_Arte");
            return View();
        }

        // POST: Artes/Create
        // Para proteger-se contra ataques de excesso de postagem, ative as propriedades específicas às quais deseja se associar. 
        // Para obter mais detalhes, confira https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID_Arte,Nome_Arte,Descricao,Aceite,TipoArte_ID,Conta_ID")] Arte arte)
        {
            if (ModelState.IsValid)
            {
                db.Arte.Add(arte);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Conta_ID = new SelectList(db.Conta, "ID_Conta", "Nome", arte.Conta_ID);
            ViewBag.TipoArte_ID = new SelectList(db.Tipo_de_Arte, "ID_Tipo", "Tipo_Arte", arte.TipoArte_ID);
            return View(arte);
        }

        // GET: Artes/Edit/5
        public ActionResult Edit(string nome)
        {
            if (nome == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Arte arte = db.Arte.FirstOrDefault(s => s.Nome_Arte == nome);
            if (arte == null)
            {
                return HttpNotFound();
            }
            ViewBag.Conta_ID = new SelectList(db.Conta, "ID_Conta", "Nome", arte.Conta_ID);
            ViewBag.TipoArte_ID = new SelectList(db.Tipo_de_Arte, "ID_Tipo", "Tipo_Arte", arte.TipoArte_ID);
            return View(arte);
        }




        // POST: Artes/Edit/5
        // Para proteger-se contra ataques de excesso de postagem, ative as propriedades específicas às quais deseja se associar. 
        // Para obter mais detalhes, confira https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID_Arte,Nome_Arte,Descricao,Aceite,TipoArte_ID,Conta_ID")] Arte arte)
        {
            if (ModelState.IsValid)
            {
                db.Entry(arte).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Conta_ID = new SelectList(db.Conta, "ID_Conta", "Nome", arte.Conta_ID);
            ViewBag.TipoArte_ID = new SelectList(db.Tipo_de_Arte, "ID_Tipo", "Tipo_Arte", arte.TipoArte_ID);
            return View(arte);
        }

        // GET: Artes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Arte arte = db.Arte.Find(id);
            if (arte == null)
            {
                return HttpNotFound();
            }
            return View(arte);
        }

        // POST: Artes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Arte arte = db.Arte.Find(id);
            db.Arte.Remove(arte);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddComentario(string ComentarioTexto)
        {
            if(ComentarioTexto != null)
            {
                Comentario comentario = new Comentario();
                Conta conta = new Conta();
                if (Session["User"] == null)
                    conta = db.Conta.FirstOrDefault(s => s.Nome == "Anonimo");
                else
                    conta = db.Conta.FirstOrDefault(s => s.Nome == Session["User"].ToString());
                db.addComentario(ComentarioTexto, DateTime.Today, conta.ID_Conta, Convert.ToInt16(@Session["CurrentArte"].ToString()));
            }
            return RedirectToAction("Details", new {nome = db.Arte.FirstOrDefault(s => s.ID_Arte == Convert.ToInt16(@Session["CurrentArte"].ToString())).Nome_Arte});
        }
    }
}
