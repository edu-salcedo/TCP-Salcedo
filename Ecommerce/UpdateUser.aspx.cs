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
    public partial class UpdateUser : System.Web.UI.Page
    {
        public User usuario;
        List<User> listaUsuario = new List<User>();
        protected void Page_Load(object sender, EventArgs e)
        {
            UserNegosio negosio = new UserNegosio();
            if (Session["logeado"]==null)
            {
                Response.Redirect("Catalogo.aspx");
            }

            if (Session["Usuarios"] == null)
            {
                listaUsuario = negosio.listar();
            }
            else
            {
                listaUsuario = (List<User>)Session["Usuarios"];
            }

            usuario = new User();
            usuario = (User)Session["logeado"];

            if (usuario.id > 0)
            {
                if(!IsPostBack)
                {
                   buscar(usuario.id);
                   texUname.Text = usuario.Usuario;
                   Texnombre.Text = usuario.Nombre;
                   Texapellido.Text = usuario.Apellido;
                   Textdni.Text = Convert.ToString(usuario.DNI);
                   TexMail.Text = usuario.mail;
                   TexDireccion.Text = usuario.direccion;
                   Textelefono.Text = Convert.ToString(usuario.telefono);
                }
            }

        }

        public void buscar(int iduser)
        {
            foreach(User item in listaUsuario)
            {
                if (item.id==iduser)
                {
                    usuario = item;
                }
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            UserNegosio negosio = new UserNegosio();
            if(IsPostBack)
            { 
               buscar(usuario.id);
               usuario.Usuario = texUname.Text;
               usuario.Nombre = Texnombre.Text; 
               usuario.Apellido = Texapellido.Text;
                usuario.DNI = Convert.ToInt32(Textdni.Text);
               usuario.mail = TexMail.Text;
               usuario.direccion = TexDireccion.Text;
               usuario.telefono =Convert.ToInt32(Textelefono.Text);
               negosio.editar(usuario);
            }
            Response.Redirect("Compra.aspx");
        }
    }
}