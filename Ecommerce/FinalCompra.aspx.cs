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
    public partial class FinalCompra1 : System.Web.UI.Page
    {
        public List<Cart> listacompra = new List<Cart>();
        protected void Page_Load(object sender, EventArgs e)
        {
           List<Items> itemsCarrito = new List<Items>();
            Venta ven = new Venta();

            if (Session["logeado"] == null)
            {
                Response.Redirect("Catalogo.aspx");
            }

            if (Session["compra"] == null || Session["venta"]==null)
            {
                    
            }
            else
            {
                listacompra = (List<Cart>)Session["compra"];

                ven = (Venta)Session["venta"];
            }

            lbfecha.Text =Convert.ToString( ven.FechaVenta);
            lbtipopago.Text= Convert.ToString(ven.tipoPago);


        }

     
    }
}