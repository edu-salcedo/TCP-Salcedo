using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Venta
    {
        public int Id { get; set; }
        public int Idproducto { get; set; }
        public int idUsuario { get; set; }
        public DateTime FechaVenta { get; set; }
        public decimal Importe { get; set; }
        public int tipo { get; set; }
    }
}
