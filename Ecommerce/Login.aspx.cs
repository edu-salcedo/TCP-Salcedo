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
    public partial class Login : System.Web.UI.Page
    {
        UserNegosio userneg = new UserNegosio();
        User nuevo = new User();
        List<User> listausuarios = new List<User>();
        List<Cart> carrito;
        protected void Page_Load(object sender, EventArgs e)
        {
            carrito = new List<Cart>();
            if (Session["carrito"]!=null)
            {
                carrito = (List<Cart>)Session["carrito"];
            }

        }

        protected void btnIngresar_Click1(object sender, EventArgs e)
        {
            User nuevo = new User();
            User aux = new User();
            aux.Usuario = txtUser.Text;
            aux.Contrasena = txtPass.Text;
            nuevo = userneg.Verificar(aux);
            if (nuevo.id > 0)
            {
                listausuarios = userneg.listar();
                aux = listausuarios.Find(x => x.id == nuevo.id);
                nuevo.Nombre = aux.Nombre;
                nuevo.Apellido = aux.Apellido;
                nuevo.DNI = aux.DNI;
                nuevo.direccion = aux.direccion;
                nuevo.telefono = aux.telefono;
                
                Session["Logeado"] = nuevo;

                if (nuevo.tipo == 1)
                {
                    Response.Redirect("MenuAdmin.aspx");
                }
                if (nuevo.tipo == 2 & carrito.Count==0)
                {
                    Response.Redirect("Catalogo.aspx");
                }
                else
                {
                    Response.Redirect("Compra.aspx");
                }
            }
            else
            {
                lbErrorIngresar.Text = "el usuario o contraseña son incorrectos";
            }

        }
    }
}