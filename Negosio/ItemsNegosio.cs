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
        public List <Cart>listarventa(int idventa)
        {
              List<Cart>listaux = new List<Cart>();
            AccesoDatos conexion = new AccesoDatos();
            conexion.conectar();
            try
            {
                conexion.setearQuery("select  DT.IdVenta,P.Nombre,DT.Cantidad,P.Precio Precio from DetalleVenta DT inner join Producto P on P.Id=DT.IdProducto ");
                SqlDataReader lector = conexion.leer();
                while (lector.Read()) 
                {
                    Cart aux = new Cart();
                    aux.Idventa = lector.GetInt32(0);
                    aux.NombrePro=lector.GetString(1);
                    aux.Cantidad= lector.GetInt32(2);
                    aux.Precio = (decimal)lector["Precio"];
                    listaux.Add(aux);
                }
                 return listaux;
                }
            catch
            {

            }
            return listaux;       
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
