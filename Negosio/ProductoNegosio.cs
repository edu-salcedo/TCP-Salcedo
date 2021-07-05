using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using System.Data.SqlClient;

namespace Negosio
{
   public class ProductoNegosio
    {
        public SqlCommand comando { set; get; }
        public List<Producto> listar()
        {
            try
            {

                List<Producto> lista = new List<Producto>();
                AccesoDatos conexion = new AccesoDatos();
                conexion.conectar();
                conexion.setearQuery("select P.Id idpro, P.UrlImagen, P.Nombre,P.Descripcion,M.id idMarca,M.Nombre marca," +
                                    "C.Id idCategoria,C.Nombre Cat ,P.Estado estado, P.Precio precio,P.Stock stock from Producto P ," +
                                    "Marca M, Categoria C where P.idmarca=M.id AND	P.IdCategoria=C.id");
                SqlDataReader lector = conexion.leer();

                while (lector.Read())
                {
                    Producto aux = new Producto();
                    aux.Id= (int)lector["idpro"];
                    aux.Imagen = (string)lector["UrlImagen"];
                    aux.Nombre = lector.GetString(2);
                    aux.Descripcion = lector.GetString(3);
                    aux.marca = new Marca();
                    aux.marca.Id = (int)lector["idMarca"];
                    aux.marca.Nombre = (string)lector["marca"];
                    aux.categoria = new Categoria();
                    aux.categoria.Id = (int)lector["idCategoria"];
                    aux.categoria.Nombre = (string)lector["cat"];
                    aux.Estado= (bool)lector["estado"];
                    aux.Precio = (decimal)lector["precio"];
                    aux.stock= (int)lector["stock"];


                    lista.Add(aux);
                }
                conexion.cerrarConexion();
                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void registrar(Producto nuevo)
        {
            try
            {
                AccesoDatos conexion = new AccesoDatos();
                conexion.setearQuery("insert into Producto( UrlImagen,Nombre,Descripcion,idMarca,idCategoria,Precio,Stock)values( @imagen,@nombre,@des,@marca,@cat,@precio,@stock) ");

                conexion.agregarParametro("@imagen", nuevo.Imagen);
                conexion.agregarParametro("@nombre", nuevo.Nombre);
                conexion.agregarParametro("@des", nuevo.Descripcion);
                conexion.agregarParametro("@marca", nuevo.marca.Id);
                conexion.agregarParametro("@cat", nuevo.categoria.Id);
                conexion.agregarParametro("@precio", nuevo.Precio);
                conexion.agregarParametro("@stock", nuevo.stock);

                conexion.ejecutarAccion();
                conexion.cerrarConexion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public void editar(Producto produc)
        {
            try
            {
                AccesoDatos conexion = new AccesoDatos();
                conexion.setearQuery("update Producto set  UrlImagen=@imagen, Nombre=@nombre,Descripcion=@des,idmarca=@idmarca,idcategoria=@cat,precio=@precio,stock=@stock  where Id=@id ");
                conexion.agregarParametro("@id", produc.Id);

                conexion.agregarParametro("@imagen", produc.Imagen);
                conexion.agregarParametro("@nombre", produc.Nombre);
                conexion.agregarParametro("@des", produc.Descripcion);
                conexion.agregarParametro("@idmarca", produc.marca.Id);
                conexion.agregarParametro("@cat", produc.categoria.Id);
                conexion.agregarParametro("@precio", produc.Precio);
                conexion.agregarParametro("@stock", produc.stock);

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
