using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Capa_Entidad;

namespace Capa_Datos
{
    public class Departamentos_Datos
    {
        DocumentControlEntities db = new DocumentControlEntities();
        public void InsertarDepartamento(Departamento dpt)
        {
            db.Departamento.Add(dpt);
            db.SaveChanges();
        }
        public List<Departamento> ListarDepartamento()
        {
            return db.Departamento.ToList();
        }
        public void EditarDepartamento(Departamento dpt)
        {
            var reg = from Departamento in db.Departamento
                      where Departamento.id == dpt.id
                      select Departamento;

            Departamento editado = reg.First();
            editado.nombre = dpt.nombre;
            editado.siglas = dpt.siglas;
            db.SaveChanges();
        }
        public void ElminarDepartamento(Departamento dpt)
        {
            var reg = from Departamento in db.Departamento
                      where Departamento.id == dpt.id
                      select Departamento;

            Departamento borrado = reg.First();
            db.Departamento.Remove(borrado);
            db.SaveChanges();
        }
    }
}
