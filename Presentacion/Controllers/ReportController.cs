using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Capa_Entidad;
using Capa_Servicios;
using Capa_Negocio;

namespace Presentacion.Controllers
{
    public class ReportController : Controller
    {
        ReportesServices servicios = new ReportesServices();
        Departamento_Negocio negocios = new Departamento_Negocio();
        public ActionResult IndexReport()
        {
            return View();
        }
        //REPORTE DE DOCUMENTOS
        public ActionResult ResultadoRptDoc()
        {          
            return View(servicios.ReporteDoc());
        }

        //REPORTE DE DOCUMENTOS POR EMPLEADO
        public ActionResult ReporteEmpDocB()
        {
            return View();
        }

        [HttpPost]
        public ActionResult ReporteEmpDocR(string nombre)
        {      
            return View(servicios.ReporteEmpDoc(nombre));
        }

        //REPORTE POR DEPARTAMENTO DE ORIGEN
        public ActionResult ReporteDocOrigenF()
        {
            return View();
        }

        [HttpPost]
        public ActionResult ReporteDocOrigenR(string dptOrigen)
        {
            return View(servicios.ReporteDocOrigen(dptOrigen));
        }

        //REPORTE POR DEPARTAMENTO DE DESTINO
        public ActionResult ReporteDocDestinoF()
        {
            return View();
        }

        [HttpPost]
        public ActionResult ReporteDocDestinoR(string dptDestino)
        {
            return View(servicios.ReporteDocDestino(dptDestino));
        }

        //REPORTE DOCUMENTOS POR LAPSO DE FECHA
        public ActionResult ReporteDocFechaF()
        {
            return View();
        }

        [HttpPost]
        public ActionResult ReporteDocFechaR(string fDesde, string fHasta)
        {
            return View(servicios.ReporteDocFecha(fDesde, fHasta));
        }

        //REPORTE DE EMPLEADOS
        public ActionResult ReporteEmpleado()
        {
            return View(servicios.ReporteEmp());
        }
        //REPORTE DE DEPARTAMENTOS
        public ActionResult ReporteDepartamento()
        {
            return View(negocios.MostrarDatos());
        }
    }
}
