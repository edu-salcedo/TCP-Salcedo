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
            User usuario = new User();

            if (Session["logeado"] == null)
            {
                Response.Redirect("Catalogo.aspx");
            }
            usuario = (User)Session["logeado"];
            if (Session["compra"] == null || Session["venta"]==null)
            {
                    
            }
            else
            {
                listacompra = (List<Cart>)Session["compra"];
                ven = (Venta)Session["venta"];
            }

            lbfecha.Text = "Fecha :  "+Convert.ToString( ven.FechaVenta);
            lbtipopago.Text= "Metodo de Pago : "+ Convert.ToString(ven.tipoPago);
            lbnombre.Text = "Nombre : "+usuario.Nombre;
            lbtelefono.Text = "Telefono : "+ Convert.ToString(usuario.telefono);
            lbdireccion.Text= "Direccion : "+Convert.ToString(usuario.direccion);
            lbdni.Text="DNI : "+Convert.ToString(usuario.DNI);

            lbtotal.Text = "Total : "+ Convert.ToString(ven.Importe);

        }

     
    }
}