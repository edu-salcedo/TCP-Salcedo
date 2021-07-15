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
        public void Registrar(Detalles nuevo)
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
