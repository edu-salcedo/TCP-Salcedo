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
    public partial class FinalCompra : System.Web.UI.Page
    {
        public List<Cart> listacompra = new List<Cart>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["compra"] == null)
            {
                Response.Redirect("Catalogo.aspx");
            }
            else
            {
                listacompra = (List<Cart>)Session["compra"];
            }

        }
    }
}