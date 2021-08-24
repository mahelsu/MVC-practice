using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Capa_Datos;
using Capa_Entidad;

namespace Capa_Negocio
{
    public class Departamento_Negocio
    {    
        Departamentos_Datos ejecutor = new Departamentos_Datos();
        public void GuardarDepartamento(Departamento elemento)
        {
            ejecutor.InsertarDepartamento(elemento);
        }
        public List<Departamento> MostrarDatos()
        {
            return ejecutor.ListarDepartamento().ToList();
        }

        public void EditarDepartamento(Departamento elemento)
        {
            ejecutor.EditarDepartamento(elemento);
        }
        public void EliminarDepartamento(Departamento elemento)
        {
            ejecutor.ElminarDepartamento(elemento);
        }
    }
}
