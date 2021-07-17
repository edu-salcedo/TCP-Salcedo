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
                conexion.setearQuery("select NombreUsuario, Nombre, Apellido, Email, Direccion, Telefono tel,id,DNI from WVusers");
                SqlDataReader lector = conexion.leer();

                while (lector.Read())
                {
                    User aux = new User();
                    aux.Usuario = lector.GetString(0);
                    aux.Nombre = lector.GetString(1);
                    aux.Apellido = lector.GetString(2);
                    aux.mail = lector.GetString(3);
                    aux.direccion = lector.GetString(4);
                    aux.telefono = (int)lector["tel"];
                    aux.id = (int)lector["id"];
                    aux.DNI = (int)lector["DNI"];
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

        public User Verificar(User nuevo)
        {
                AccesoDatos conexion = new AccesoDatos();
            try
            {
                conexion.setearQuery("select id,NombreUsuario,Contraseña,IdTipoUsuario tipo from Usuarios where NombreUsuario=@usuario and Contraseña=@Contrasena ");
                User aux = new User();
                conexion.agregarParametro("@usuario", nuevo.Usuario);
                conexion.agregarParametro("@Contrasena ", nuevo.Contrasena);

                conexion.conectar();
                conexion.lector = conexion.comando.ExecuteReader();
                // si devuelve hay que traer el id
                if (conexion.lector.HasRows) // si leyo  le voy a asignar los datos al usuario
                {
                    conexion.lector.Read();
                    aux.id = (int)conexion.lector["id"];
                    aux.Usuario =(string) conexion.lector["NombreUsuario"];
                    aux.Contrasena =(string)conexion.lector["Contraseña"];
                    aux.tipo= (int)conexion.lector["tipo"];
                }
                else
                {
                    aux.id = 0;
                }
                    conexion.cerrarConexion();
                return aux;
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

        public void editar(User nuevo)
        {
            try
            {
                AccesoDatos conexion = new AccesoDatos();
                conexion.setearQuery("update DatosPersonales set Nombre=@nombre,Apellido=@apellido,DNI=@dni,Telefono=@telefono,Email=@mail, Direccion=@direccion where Idusuario=@id");
                conexion.agregarParametro("@id", nuevo.id);

                conexion.agregarParametro("@nombre", nuevo.Nombre);
                conexion.agregarParametro("@apellido", nuevo.Apellido);
                conexion.agregarParametro("@dni", nuevo.DNI);
                conexion.agregarParametro("@telefono", nuevo.telefono);
                conexion.agregarParametro("@mail", nuevo.mail);
                conexion.agregarParametro("@direccion", nuevo.direccion);

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