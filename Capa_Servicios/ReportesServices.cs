using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Capa_Entidad;
using Capa_Datos;

namespace Capa_Servicios
{
    public class ReportesServices
    {
        DocumentControlEntities db = new DocumentControlEntities();

        //Reporte documento.
        public List<rptDoc_Result> ReporteDoc()
        {
            return db.rptDoc().ToList();
        }
        //Reporte Documentos por empleado
        public List<rptEmpDoc_Result> ReporteEmpDoc(string emp)
        {
            return db.rptEmpDoc(emp).ToList();
        }

        //Reporte por departamento de origen
        public List<rptDocO_Result> ReporteDocOrigen(string dptOrigen)
        {
            return db.rptDocO(dptOrigen).ToList();
        }
        //Reporte documento por departamento de destino
        public List<rptDocD_Result> ReporteDocDestino(string dptDestino)
        {
            return db.rptDocD(dptDestino).ToList();
        }
        //Reporte documento por fecha
        public List<rptDocFecha_Result> ReporteDocFecha(string fdesde, string fhasta)
        {
            return db.rptDocFecha(fdesde, fhasta).ToList();
        }
        //Reporte empleado
        public List<rptEmpDpt_Result> ReporteEmp()
        {
            return db.rptEmpDpt().ToList();
        }     
    }
}
