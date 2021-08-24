using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Capa_Entidad;
using Capa_Negocio;

namespace Presentacion.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        Empleado_Negocio negocio = new Empleado_Negocio();
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
        public ActionResult Create(Usuario inEmp)
        {
            try
            {
                negocio.GuardarUsuario(inEmp);
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
        public ActionResult Edit(Usuario emp)
        {
            try
            {
                negocio.EditarUsuario(emp);
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
        public ActionResult Delete(Usuario emp)
        {
            try
            {
                negocio.EliminarUsuario(emp);
                return RedirectToAction("Details");
            }
            catch
            {
                return View();
            }
        }
    }
}

