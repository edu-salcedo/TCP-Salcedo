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
    public partial class Admin : System.Web.UI.MasterPage
    {
        User login;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Logeado"]!=null)
            {
                login = new User();
                login = (User)Session["Logeado"];
                if (login.tipo==2)
                {
                    Response.Redirect("Default.aspx");
                }
            }
            else
            {
                Response.Redirect("Default.aspx");
            }

        }

        protected void btnsalir_Click(object sender, EventArgs e)
        {
            Session["logeado"] = null;
            Session["carrito"] = null;
            Response.Redirect("Catalogo.aspx");
        }
    }
}