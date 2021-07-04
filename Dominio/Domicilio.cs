using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Domicilio
    {
        public string Direccion { get; set; }
        public int Piso { get; set; }
        public char Departamento { get; set; }
        public string Ciudad { get; set; }
        public int CodPostal { get; set; }
    }
}
