using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Categoria
    {
        public long Id { get; set; }
        public string Nombre { get; set; }
        public Categoria()
        {

        }
        public Categoria(int id, string nom)
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
