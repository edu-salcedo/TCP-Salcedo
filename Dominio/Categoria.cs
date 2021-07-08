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
        public string Imagen { get; set; }
        public Categoria()
        {

        }
        public Categoria(int id, string nom,string img)
        {
            Id = id;
            Nombre = nom;
            Imagen = img;
        }
        public override string ToString()
        {
            return Nombre;
        }
    }
}
