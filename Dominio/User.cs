using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class User
    {
       public int id { get; set; }
        public string Usuario { get; set; }
        public string Contrasena { get; set; }
        public int tipo { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public int DNI{ get; set; }
        public int telefono { get; set; }
        public string mail { get; set; }
        public string direccion { get; set; }

    }
}
