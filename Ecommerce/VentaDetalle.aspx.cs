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
    public partial class VentaDetalle : System.Web.UI.Page
    {
        public List<Cart> listacompra = new List<Cart>();
        List<Venta> listaventa = new List<Venta>();
        ItemsNegosio negitem;
        public UserNegosio usuaronegosio=new UserNegosio();
        public User usuario;
        public Venta ven = new Venta();
         public   VentaNegosio venteneg = new VentaNegosio();
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Items> itemsCarrito = new List<Items>();
            negitem = new ItemsNegosio();
            listaventa = venteneg.listar();
            int idventa = Convert.ToInt32(Request.QueryString["idven"]);
            listacompra = negitem.listarventa();
            listacompra = listacompra.FindAll(x => x.Idventa == idventa);

            ven = listaventa.Find(x => x.Id == idventa);
            usuario = new User();

            if (Session["logeado"] == null)
            {
                Response.Redirect("Catalogo.aspx");
            }
            usuario =usuaronegosio.Buscar(ven.idUsuario);


            lbfecha.Text = "Fecha :  " + Convert.ToString(ven.FechaVenta);
            lbtipopago.Text ="Metodo de Pago : " + Convert.ToString(ven.metodoPago);
            lbnombre.Text = "Cliente: " + usuario.Nombre +" "+ usuario.Apellido;
            lbtelefono.Text = "Telefono : " + Convert.ToString(usuario.telefono);
            lbdireccion.Text = "Direccion : " + Convert.ToString(usuario.direccion);
            lbdni.Text = "DNI : " + Convert.ToString(usuario.DNI);

            lbtotal.Text = "Total : " + Convert.ToString(ven.Importe);



            if (!IsPostBack)  // si es la primera vuelta
            {
                List<Estado> estadolist = new List<Estado>();
                estadolist = venteneg.listarestado();
                ddestado.DataSource = estadolist;    ///se llena el dropdown  con la lista de estado registardas
                ddestado.DataValueField = "id";
                ddestado.DataTextField = "nombre";
                ddestado.SelectedIndex = -1;

                ddestado.DataBind();

            ddestado.SelectedValue = ven.estado.Id.ToString();
            }
        }

        protected void btnestado_Click(object sender, EventArgs e)
        {
            string n= Convert.ToString(ddestado.SelectedValue);
            venteneg.EditarEstado(ven.Id,n);
        }
    }
}