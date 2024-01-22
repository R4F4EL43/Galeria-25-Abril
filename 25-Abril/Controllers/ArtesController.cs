using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using _25_Abril.Models;

namespace _25_Abril.Controllers
{
    public class ArtesController : Controller
    {
        private Entities25Abril db = new Entities25Abril();

        // GET: Artes
        public ActionResult Index()
        {
            var arte = db.Arte.Include(a => a.Conta).Include(a => a.Tipo_de_Arte);
            return View(arte.ToList());
        }

        // GET: Artes/Details/5
        public ActionResult Details(int? id)
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
        public ActionResult Edit(int? id)
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
    }
}
