using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Dominio;
namespace Negosio
{
    public class VentaNegosio
    {

        public List<Pago> listarTipo()
        {

            List<Pago> lista = new List<Pago>();
            AccesoDatos conexion = new AccesoDatos();
            conexion.conectar();
            conexion.setearQuery("select id, nombre from TipoPago");
            SqlDataReader lector = conexion.leer();

            while (lector.Read())
            {
                Pago aux = new Pago();
                aux.Id = lector.GetInt32(0);
                aux.Nombre= lector.GetString(1);
                lista.Add(aux);
            }
            conexion.cerrarConexion();
            return lista;
        }
        public List<Venta> listar()
        {
            try
            {
                List<Venta> listaVenta = new List<Venta>();
                AccesoDatos conexion = new AccesoDatos();
                conexion.conectar();
                conexion.setearQuery("select id, IdUsuario,Fecha,Importe,TipoPago,MetodoPago,idestado,estado from WVCompras");
                SqlDataReader lector = conexion.leer();

                while (lector.Read())
                {
                    Venta aux = new Venta();
                    aux.Id = lector.GetInt32(0);
                    aux.idUsuario = lector.GetInt32(1);
                    aux.FechaVenta= (DateTime)lector["Fecha"];
                    aux.Importe= (decimal)lector["Importe"];
                    aux.tipoPago= lector.GetInt32(4);
                    aux.metodoPago= lector.GetString(5);
                    aux.estado = new Estado();
                    aux.estado.Id = lector.GetInt32(6);
                    aux.estado.Nombre= lector.GetString(7);
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

        public void Registrar(Venta nuevo)
        {
            try
            {
                AccesoDatos conexion = new AccesoDatos();
                //conexion.setearQuery("insert into usuario ( username,password,idtipo)values( @user, @pass, @nombren, @apellido, @tel, @tipo, @mail)");
                conexion.setearSP("SPInsertVenta");   // procedimiento lamacenado pra registrar un usuario
                conexion.agregarParametro("@idcliente", nuevo.idUsuario);
                conexion.agregarParametro("@fecha", nuevo.FechaVenta);
                conexion.agregarParametro("@Importe", nuevo.Importe);
                conexion.agregarParametro("@tipopago", nuevo.tipoPago);
                conexion.agregarParametro("@estado", 1);
                conexion.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public int BuscarID()
        {

            int IdAux;
            try
            {
                AccesoDatos conexion = new AccesoDatos();
               conexion.setearQuery("select max(id) from Venta"); // buscamos el ultimo id de la tabla venta   
                conexion.conectar();
               conexion.lector = conexion.comando.ExecuteReader();
               conexion.lector.Read(); 
                IdAux = conexion.lector.GetInt32(0);
                conexion.cerrarConexion();
                return IdAux; 
            }
            catch (Exception)
            {

                throw;
            }
        }


        public List<Estado> listarestado()
        {
            try
            {
                List<Estado> listaestado = new List<Estado>();
                AccesoDatos conexion = new AccesoDatos();
                conexion.conectar();
                conexion.setearQuery("select id,nombre from Estado");
                SqlDataReader lector = conexion.leer();

                while (lector.Read())
                {
                    Estado aux = new Estado();
                    aux.Id = lector.GetInt32(0);
                    aux.Nombre= lector.GetString(1);
                    if (aux.Id != 4 && aux.Id != 5)
                    {
                        listaestado.Add(aux);
                    }
                }
                conexion.cerrarConexion();
                return listaestado;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void EditarEstado(int id ,string op)
        {

            AccesoDatos conexion = new AccesoDatos();
            try
            {
                if (op =="recibido")
                {
                    conexion.setearQuery("update Venta set idestado=5 where id=@id");
                    conexion.agregarParametro("@id", id);
                    conexion.ejecutarAccion();
                }
                else if (op == "norecibido")
                {
                    conexion.setearQuery("update Venta set idestado=2 where id=@id");
                    conexion.agregarParametro("@id", id);
                    conexion.ejecutarAccion();
                }
                else if(op == "cancelar")
                {
                    conexion.setearQuery("update Venta set idestado=4 where id=@id");
                    conexion.agregarParametro("@id", id);
                    conexion.ejecutarAccion();
                }
                else
                {
                    int i = Int32.Parse(op);
                    conexion.setearQuery("update Venta set idestado=@i where id=@id");
                    conexion.agregarParametro("@id", id);
                    conexion.agregarParametro("@i", i);
                    conexion.ejecutarAccion();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
