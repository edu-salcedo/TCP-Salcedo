using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Dominio;
namespace Negosio
{
    public class PagoNegosio
    {
    public List<Pagos> listar()
        {

            List<Pagos> lista = new List<Pagos>();
            AccesoDatos conexion = new AccesoDatos();
            conexion.conectar();
            conexion.setearQuery("select id, nombre from Pagos");
            SqlDataReader lector = conexion.leer();
            while (lector.Read())
            {
                lista.Add(new Pagos((int)lector["id"], (string)lector["Nombre"]));
            }
            conexion.cerrarConexion();
            return lista;
        }
    }
}
