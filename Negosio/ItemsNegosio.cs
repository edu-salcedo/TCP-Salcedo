using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Dominio;
namespace Negosio
{
    public class ItemsNegosio
    {


        public List<Items> listar()
        {
            try
            {
                List<Items> listaVenta = new List<Items>();
                AccesoDatos conexion = new AccesoDatos();
                conexion.conectar();
                conexion.setearQuery("select IdProducto,IdVenta,Precio ,Cantidad from DetalleVenta");
                SqlDataReader lector = conexion.leer();

                while (lector.Read())
                {
                    Items aux = new Items();
                    aux.idProducto = lector.GetInt32(0);
                    aux.idVenta = lector.GetInt32(1);
                    aux.Precio = (decimal)lector["Precio"];
                    aux.cantidad = lector.GetInt32(3);
                    listaVenta.Add(aux);
                }
                conexion.cerrarConexion();
                return listaVenta;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        Items listarventa(Items detalle)
        {

                Items aux = new Items();

            AccesoDatos conexion = new AccesoDatos();
            try
            {
                conexion.setearQuery("select id,NombreUsuario,Contraseña,IdTipoUsuario tipo from Usuarios where NombreUsuario=@usuario and Contraseña=@Contrasena ");
                conexion.agregarParametro("@usuario", detalle.idVenta);
                conexion.agregarParametro("@Contrasena ", detalle.idProducto);

                conexion.conectar();
                conexion.lector = conexion.comando.ExecuteReader();
                // si devuelve hay que traer el id
                if (conexion.lector.HasRows) // si leyo  le voy a asignar los datos al usuario
                {
                    conexion.lector.Read();
                    aux.idProducto= (int)conexion.lector["id"];
                    aux.idVenta = (int)conexion.lector["tipo"];
                    aux.Precio = (int)conexion.lector["tipo"];
                    aux.cantidad= (int)conexion.lector["tipo"];
                }
                 return aux;
                }
            catch
            {

            }

            return aux;       
        }
    
        public void Registrar(Items nuevo)
        {
            try
            {
                AccesoDatos conexion = new AccesoDatos();
                //conexion.setearQuery("insert into usuario ( username,password,idtipo)values( @user, @pass, @nombren, @apellido, @tel, @tipo, @mail)");
                conexion.setearSP("insertDetalleVenta");   // procedimiento lamacenado pra registrar un usuario
                conexion.agregarParametro("@idproducto", nuevo.idProducto);
                conexion.agregarParametro("@idventa", nuevo.idVenta);
                conexion.agregarParametro("@precio", nuevo.Precio);
                conexion.agregarParametro("@cantidad", nuevo.cantidad);
                conexion.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
