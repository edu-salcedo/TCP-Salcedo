using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Dominio;

namespace Negosio
{
     public class CategoriaNegosio
    {
        public List<Categoria> listar()
        {

            List<Categoria> lista = new List<Categoria>();
            AccesoDatos conexion = new AccesoDatos();
            conexion.conectar();
            conexion.setearQuery("select id,nombre,Imagen from Categoria");
            SqlDataReader lector = conexion.leer();

            while (lector.Read())
            {
                lista.Add(new Categoria((int)lector["id"], (string)lector["Nombre"], (string)lector["Imagen"]));
            }
            conexion.cerrarConexion();
            return lista;
        }

        public void registrar(Categoria nuevo)
        {
            try
            {
                AccesoDatos conexion = new AccesoDatos();
                conexion.setearQuery("insert into Categoria( Nombre,Imagen)values(@nombre, @imagen) ");

                conexion.agregarParametro("@imagen", nuevo.Imagen);
                conexion.agregarParametro("@nombre", nuevo.Nombre);
                conexion.ejecutarAccion();
                conexion.cerrarConexion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void editar(Categoria cat)
        {
            try
            {
                AccesoDatos conexion = new AccesoDatos();
                conexion.setearQuery("update Categoria set Nombre=@nombre,imagen= @imagen  where Id=@id ");
                conexion.agregarParametro("@id", cat.Id);
                conexion.agregarParametro("@nombre", cat.Nombre);
                conexion.agregarParametro("@imagen", cat.Imagen);
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
