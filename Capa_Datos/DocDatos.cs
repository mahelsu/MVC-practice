using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Capa_Entidad;

namespace Capa_Datos
{
    public class DocDatos
    {     
        DocumentControlEntities db = new DocumentControlEntities();
        DateTime date = DateTime.Today;
        public void InsertarDocumento(Documento doc)
        {
            doc.fecha = date.ToShortDateString();
            db.Documento.Add(doc);
            db.SaveChanges();
        }
        public List<Documento> ListarDocumento()
        {
            return db.Documento.ToList();
        }

        public string GenerateCode(Documento doc)
        {
            #region Siglas del departamento de origen.

            var siglaO = from Departamento in db.Departamento
                         where Departamento.nombre == doc.dptOrigen
                         select Departamento;

            Departamento filtradoO = siglaO.First();
            #endregion

            #region Sigla del departamento de destino.
           
            var siglaD = from Departamento in db.Departamento
                         where Departamento.nombre == doc.dptDestino
                         select Departamento;

            Departamento filtradoD = siglaD.First();
            #endregion

            string currentYear = DateTime.Now.Year.ToString();
            int seqNumber = Seq();

            string code = $"{currentYear}-{filtradoO.siglas}-{filtradoD.siglas}-0{seqNumber}";

            return code;  
        }        
        int Seq()
        {
            int orderNumber = db.Documento.Count();
            return Interlocked.Increment(ref orderNumber);
        }


      
    }
}
