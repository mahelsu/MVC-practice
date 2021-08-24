using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Capa_Entidad;

namespace Capa_Datos
{
    public class Empleados_Datos
    {
        DocumentControlEntities db = new DocumentControlEntities();
        public void InsertarEmpleado(Usuario usr)
        {
            db.Usuario.Add(usr);
            db.SaveChanges();
        }

        public List<Usuario> ListarEmpleado()
        {
            return db.Usuario.ToList();
        }

        public void EditarEmpleado(Usuario usr)
        {
            var reg = from Usuario in db.Usuario
                      where Usuario.id == usr.id
                      select Usuario;

            Usuario editado = reg.First();
            editado.cargo = usr.cargo;
            editado.idDpt = usr.idDpt;
            editado.correo = usr.correo;
            db.SaveChanges();
        }
        public void ElminarEmpleado(Usuario usr)
        {
            var reg = from Usuario in db.Usuario
                      where Usuario.id == usr.id
                      select Usuario;

            Usuario borrado = reg.First();
            db.Usuario.Remove(borrado);
            db.SaveChanges();
        }
    }
}