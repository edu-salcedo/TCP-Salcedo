using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Items
    {
        public int idProducto { get; set; }
        public int idVenta { get; set; }
        public int cantidad { get; set; }
        public decimal Precio { get; set; }
    }
}
