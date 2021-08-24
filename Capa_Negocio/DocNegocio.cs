using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Capa_Datos;
using Capa_Entidad;

namespace Capa_Negocio
{
    public class DocNegocio
    {
        DocDatos ejecutor = new DocDatos();
        public void GuardarDocumento(Documento elemento)
        {
            elemento.secuencia = ejecutor.GenerateCode(elemento);
            ejecutor.InsertarDocumento(elemento);        
        }
        public List<Documento> MostrarDatos()
        {
            return ejecutor.ListarDocumento().ToList();
        }
    }
}
