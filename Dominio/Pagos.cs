using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Pagos
    {
        public int Id { get; set; }
        public int Idventa { get; set; }
        public decimal importe { get; set; }
        public string Nombre { get; set; }
        public Pagos()
        {

        }
        public Pagos(int id, string nom)
        {
            Id = id;
            Nombre = nom;
        }
        public override string ToString()
        {
            return Nombre;
        }
    }
}
