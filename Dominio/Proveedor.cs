﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Proveedor
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public Domicilio domicilio { get; set; }
        public string Telefono { get; set; }
    }
}
