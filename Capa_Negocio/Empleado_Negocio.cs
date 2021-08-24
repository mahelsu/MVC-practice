using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Capa_Entidad;
using Capa_Datos;

namespace Capa_Negocio
{
    public class Empleado_Negocio
    {
        Empleados_Datos ejecutor = new Empleados_Datos();
        public void GuardarUsuario(Usuario elemento)
        {
            ejecutor.InsertarEmpleado(elemento);
        }
        public List<Usuario> MostrarDatos()
        {
            return ejecutor.ListarEmpleado().ToList();
        }
        public void EditarUsuario(Usuario elemento)
        {
            ejecutor.EditarEmpleado(elemento);
        }
        public void EliminarUsuario(Usuario elemento)
        {
            ejecutor.ElminarEmpleado(elemento);
        }
    }
}
