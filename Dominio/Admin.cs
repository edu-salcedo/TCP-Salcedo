using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Admin
    {
        public User usuario { get; set; }
        public string Nombre { get; set; }
        public string email { get; set; }
        public Domicilio domicilio { get; set; }
    }
}
