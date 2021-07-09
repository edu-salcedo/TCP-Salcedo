using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Dominio;

namespace Negosio
{
     public class MarcaNegosio
    {
        public List<Marca> listar()
        {

            List<Marca> lista = new List<Marca>();
            AccesoDatos conexion = new AccesoDatos();
            conexion.conectar();
            conexion.setearQuery("select id, nombre from Marca");
            SqlDataReader lector = conexion.leer();

            while (lector.Read())
            {
                lista.Add(new Marca((int)lector["id"], (string)lector["Nombre"]));
            }
            conexion.cerrarConexion();
            return lista;
        }

        public void registrar(Marca nuevo)
        {
            try
            {
                AccesoDatos conexion = new AccesoDatos();
                conexion.setearQuery("insert into Producto(Nombre)values(@nombre)");

                conexion.agregarParametro("@nombre", nuevo.Nombre);
                conexion.ejecutarAccion();
                conexion.cerrarConexion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
