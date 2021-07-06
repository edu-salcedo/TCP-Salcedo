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
        public List<User> listauser;
        protected void Page_Load(object sender, EventArgs e)
        {
            UserNegosio Userneg = new UserNegosio();
            listauser = new List<User>();

            listauser = Userneg.listar();

            buscaruser();
        }

        protected void btnregistrar_Click(object sender, EventArgs e)
        {
            if (buscaruser())
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

                Response.Redirect("Login.aspx");
            }
            else
            {
                return;
            }

        }


        bool buscaruser()
        {
            foreach (User item in listauser)
            {
                if (item.Usuario == txtUname.Text)
                {
                    lbError.Text = "este usuario ya esta registrado";
                    lberrormail.Text = "";
                    return false;
                }
                if (item.mail == txtMail.Text)
                {
                    lberrormail.Text = "este mail ya esta registrado";
                    lbError.Text = "";
                    return false;
                }
            }
            return true;
        }
    }
}