using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negosio;
using Dominio;

namespace Ecommerce
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnregistrar_Click(object sender, EventArgs e)
        {
            UserNegosio UserIn = new UserNegosio();
            User newUser = new User();


            newUser.Nombre = txtName.Text;
            newUser.Apellido = txtApellido.Text;
            newUser.mail = txtMail.Text;
            newUser.tipo = 2;
            newUser.telefono = Convert.ToInt32(txtfone.Text);
            newUser.Usuario = txtUname.Text;
            newUser.DNI = Convert.ToInt32(txtDNI.Text);
            newUser.Contrasena = txtPass.Text;
            newUser.direccion = txtAdress.Text;

            UserIn.Registrar(newUser);

            //string script = @"<script type='text/javascript'>
            //            alert('Usuario agregado con exito');
            //        </script>";

            //ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);

            Response.Redirect("Login.aspx");
        }
    }
}