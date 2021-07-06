using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using System.Data.SqlClient;
namespace Negosio
{
    public class UserNegosio
    {


        public List<User> listar()
        {
            try
            {
                List<User> listaUser = new List<User>();
                AccesoDatos conexion = new AccesoDatos();
                conexion.conectar();
                conexion.setearQuery("select NombreUsuario, Nombre, Apellido, Email, Direccion, Telefono tel from WVusers");
                SqlDataReader lector = conexion.leer();

                while (lector.Read())
                {
                    User aux = new User();
                    aux.Usuario= lector.GetString(0);
                    aux.Nombre = lector.GetString(1);
                    aux.Apellido= lector.GetString(2);
                    aux.mail = lector.GetString(3);
                    aux.direccion = lector.GetString(4);
                    aux.telefono = (int)lector["tel"];
     

                    listaUser.Add(aux);
                }
                conexion.cerrarConexion();
                return listaUser;
            }
            catch (Exception ex)
            {
                throw ex;
            }


        }

            public void Registrar(User nuevo)
        {
            try
            {
                AccesoDatos conexion = new AccesoDatos();
                //conexion.setearQuery("insert into usuario ( username,password,idtipo)values( @user, @pass, @nombren, @apellido, @tel, @tipo, @mail)");
                conexion.setearSP("SPInsertUsuario");   // procedimiento lamacenado pra registrar un usuario
                conexion.agregarParametro("@Username", nuevo.Usuario);
                conexion.agregarParametro("@contrasena", nuevo.Contrasena);
                conexion.agregarParametro("@idtipo", nuevo.tipo);                       
                conexion.agregarParametro("@nombre", nuevo.Nombre);
                conexion.agregarParametro("@apellido", nuevo.Apellido);
                conexion.agregarParametro("@dni", nuevo.DNI);
                conexion.agregarParametro("@telefono", nuevo.telefono);
                conexion.agregarParametro("@mail", nuevo.mail);                     
                conexion.agregarParametro("@direccion", nuevo.direccion);

                conexion.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
    }
}