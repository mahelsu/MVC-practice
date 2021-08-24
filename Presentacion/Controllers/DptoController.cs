using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Capa_Entidad;
using Capa_Negocio;

namespace Presentacion.Controllers
{
    public class DptoController : Controller
    {
        Departamento_Negocio negocio = new Departamento_Negocio();
        // GET: Dpto
        public ActionResult Index()
        {
            return View();
        }
        // GET: Dpto/Details/5
        public ActionResult Details()
        {
            return View(negocio.MostrarDatos());
        }
        // GET: Dpto/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Dpto/Create
        [HttpPost]
        public ActionResult Create(Departamento inDpt)
        {
            try
            {
                negocio.GuardarDepartamento(inDpt);
                return RedirectToAction("Details");                
            }
            catch
            {
                return View();
            }
        }
        // GET: Dpto/Edit/5
        public ActionResult Edit()
        {
            return View();
        }
        // POST: Dpto/Edit/5
        [HttpPost]
        public ActionResult Edit(Departamento dpt)
        {
            try
            {
                negocio.EditarDepartamento(dpt);
                return RedirectToAction("Details");
            }
            catch
            {
                return View();
            }
        }
        // GET: Dpto/Delete/5
        public ActionResult Delete()
        {
            return View();
        }
        // POST: Dpto/Delete/5
        [HttpPost]
        public ActionResult Delete(Departamento dpt)
        {
            try
            {
                negocio.EliminarDepartamento(dpt);
                return RedirectToAction("Details");           
            }
            catch
            {
                return View();
            }
        }
    }
}
