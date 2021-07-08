using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negosio;

namespace Ecommerce
{
    public partial class Clinetes : System.Web.UI.Page
    {
        public List<User> listaUsuario;
        public int iduser = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            UserNegosio negosio = new UserNegosio();
            iduser = Convert.ToInt32(Request.QueryString["idCli"]);

            if (Session["Usuarios"] == null)
            {
                listaUsuario = negosio.listar();
            }
            else
            {
                listaUsuario = (List<User>)Session["Usuarios"];
            }

            if (iduser > 0)
            {
                User usuario = new User();
                usuario = buscar();

                texUname.Text = usuario.Usuario;
                Texnombre.Text = usuario.Nombre;
                Texapellido.Text = usuario.Apellido;
                TexMail.Text = usuario.mail;
                TexDireccion.Text = usuario.direccion;
                Textelefono.Text =Convert.ToString( usuario.telefono);
            }

        }

        User buscar()
        {
            User aux = new User();

            foreach(User item in listaUsuario)
            {
                if (item.id==iduser)
                {
                    aux = item;
                }
            }
            return aux;
        }
    }
}