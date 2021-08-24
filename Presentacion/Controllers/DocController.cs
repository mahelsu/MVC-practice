using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Capa_Entidad;
using Capa_Negocio;

namespace Presentacion.Controllers
{
    public class DocController : Controller
    {
        DocNegocio negocio = new DocNegocio();
        // GET: Doc
        public ActionResult Index()
        {
            return View();
        }

        // GET: Doc/Details/5
        public ActionResult Details()
        {
            return View(negocio.MostrarDatos());
        }

        // GET: Doc/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Doc/Create
        [HttpPost]
        public ActionResult Create(Documento doc)
        {
            try
            {
                negocio.GuardarDocumento(doc);
                return RedirectToAction("Details");
            }
            catch
            {
                return View();
            }
        }

        //// GET: Doc/Edit/5
        //public ActionResult Edit(int id)
        //{
        //    return View();
        //}

        //// POST: Doc/Edit/5
        //[HttpPost]
        //public ActionResult Edit(int id, FormCollection collection)
        //{
        //    try
        //    {
        //        // TODO: Add update logic here

        //        return RedirectToAction("Index");
        //    }
        //    catch
        //    {
        //        return View();
        //    }
        //}

        //// GET: Doc/Delete/5
        //public ActionResult Delete(int id)
        //{
        //    return View();
        //}

        //// POST: Doc/Delete/5
        //[HttpPost]
        //public ActionResult Delete(int id, FormCollection collection)
        //{
        //    try
        //    {
        //        // TODO: Add delete logic here

        //        return RedirectToAction("Index");
        //    }
        //    catch
        //    {
        //        return View();
        //    }
        //}
    }
}