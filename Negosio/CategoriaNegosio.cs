using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Dominio;

namespace Negosio
{
    class CategoriaNegosio
    {
        public List<Categoria> listar()
        {

            List<Categoria> lista = new List<Categoria>();
            AccesoDatos conexion = new AccesoDatos();
            conexion.conectar();
            conexion.setearQuery("select id,nombre from CATEGORIAS");
            SqlDataReader lector = conexion.leer();

            while (lector.Read())
            {
                lista.Add(new Categoria((int)lector["id"], (string)lector["Descripcion"]));
            }
            conexion.cerrarConexion();
            return lista;
        }
    }
}
