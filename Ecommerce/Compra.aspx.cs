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
    public partial class Compra : System.Web.UI.Page
    {
        public List<Cart> carrito = new List<Cart>();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["carrito"] == null)
            {
                Session.Add("carrito", new List<Cart>());
            }
            else
            {
                carrito = (List<Cart>)Session["carrito"];
            }
        }
    }
}