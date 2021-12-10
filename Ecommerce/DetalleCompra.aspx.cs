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
    public partial class DetalleCompra : System.Web.UI.Page
    {
        public List<Cart> listacompra = new List<Cart>();
        List<Venta> listaventa = new List<Venta>();
        ItemsNegosio negitem;
        public User usuario;
        public Venta ven = new Venta();
        public int idventa;
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Items> itemsCarrito = new List<Items>();
            negitem = new ItemsNegosio();
            VentaNegosio ventaneg = new VentaNegosio();
            listaventa = ventaneg.listar();
            idventa = Convert.ToInt32(Request.QueryString["idven"]);
            listacompra = negitem.listarventa();
            listacompra = listacompra.FindAll(x => x.Idventa == idventa);

             usuario = new User();

            if (Session["logeado"] == null)
            {
                Response.Redirect("Catalogo.aspx");
            }

            if (Request.QueryString["Aceptarcompra"] !=null)
            {
                idventa = Convert.ToInt32(Request.QueryString["Aceptarcompra"]);
                ventaneg.EditarEstado(idventa,"recibido");
            }
            if(Request.QueryString["Cancelarcompra"] != null)
            {
                idventa = Convert.ToInt32(Request.QueryString["Cancelarcompra"]);
                ventaneg.EditarEstado(idventa,"norecibido");
            }

            ven = listaventa.Find(x => x.Id == idventa);
            usuario = (User)Session["logeado"];
            lbfecha.Text = "Fecha :  " + Convert.ToString(ven.FechaVenta);
            lbtipopago.Text = "Metodo de Pago : " + Convert.ToString(ven.metodoPago);
            lbnombre.Text = "Nombre : " + usuario.Nombre + usuario.Apellido;
            lbtelefono.Text = "Telefono : " + Convert.ToString(usuario.telefono);
            lbdireccion.Text = "Direccion : " + Convert.ToString(usuario.direccion);
            lbdni.Text = "DNI : " + Convert.ToString(usuario.DNI);

            lbtotal.Text = "Total : " + Convert.ToString(ven.Importe);
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {

            VentaNegosio negosio = new VentaNegosio();
            negosio.EditarEstado(ven.Id,"cancelar");

            Response.Redirect("VistaClientes.aspx");
        }
    }
}