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



//UserNegosio UserIn = new UserNegosio();
//User newUser = new User();


//newUser.Nombre = txtName.Text;
//newUser.Apellido = txtApellido.Text;
//newUser.mail = txtMail.Text;
//newUser.tipo = 2;
//newUser.telefono = Convert.ToInt32(txtfone.Text);
//newUser.Usuario = txtUname.Text;
//newUser.DNI = Convert.ToInt32(txtDni.Text);
//newUser.Contrasena = txtCPass.Text;
//newUser.direccion = txtAdress.Text;

//UserIn.Registrar(newUser);

////string script = @"<script type='text/javascript'>
////            alert('Usuario agregado con exito');
////        </script>";

////ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);

//Response.Redirect("Login.aspx");
