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
        protected void Page_Load(object sender, EventArgs e)
        {

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
                Session["Logeado"] = nuevo;
                if (nuevo.tipo == 1)
                {
                    Response.Redirect("Productos.aspx");
                }
                if (nuevo.tipo == 2 & Session["carrito"] == null)
                {
                    Response.Redirect("Catalogo.aspx");
                }
                else
                {
                    Response.Redirect("Compra.aspx");
                }
            }

        }
    }
}