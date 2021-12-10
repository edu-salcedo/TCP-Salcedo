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
        public int tipopago;
        string metodopago;
        VentaNegosio neg = new VentaNegosio();
        public List<Cart> carrito = new List<Cart>();
        public User usuario;
        public List<User> lisUser = new List<User>();
        protected void Page_Load(object sender, EventArgs e)
        {
            UserNegosio usuarioNegosio = new UserNegosio();
            List<Pago> listaTipo = new List<Pago>();
            listaTipo = neg.listarTipo();
            if (Session["Logeado"] == null || Session["carrito"]==null)
            {
                Response.Redirect("Login.aspx");
            }
                usuario = new User();
                usuario = (User)Session["Logeado"];
                if (usuario.tipo == 1) Response.Redirect("Catalogo.aspx");
            try
            {
                lisUser = usuarioNegosio.listar();

                if (usuario.id > 0)
                {
                    usuario = Buscar_Usuario(usuario.id);
                    lbnombre.Text = usuario.Nombre;
                    lbapellido.Text = usuario.Apellido;
                    lbdni.Text = Convert.ToString(usuario.DNI);
                    lbmail.Text =  usuario.mail;
                    lbdireccion.Text =usuario.direccion;
                    lbtelefono.Text =  Convert.ToString(usuario.telefono);
                }
                if (Session["carrito"] == null)
                {
                    Session.Add("carrito", new List<Cart>());
                }
                else
                {
                    carrito = (List<Cart>)Session["carrito"];
                }


                if (!IsPostBack)  // si es la primera vuelta
                {
                    List<Pago> pagolist = new List<Pago>();
                    pagolist = neg.listarTipo();
                    ddPago.DataSource = pagolist;    ///se llena el dropdown  con la lista de tipo de pago registardas
                    ddPago.DataValueField = "id";
                    ddPago.DataTextField = "nombre";
                    ddPago.SelectedIndex = -1;

                    ddPago.DataBind();

                }
            }
            catch
            {
                Response.Redirect("Error.aspx");
            }
        }

        User Buscar_Usuario(int id)
        {
            User aux = new User();
            foreach (User item in lisUser)
            {
                if (item.id == id)
                {
                    aux = item;
                }

            }

            return aux;
        }

        protected void btnComprar_Click(object sender, EventArgs e)
        {
            int id;
            Venta venta = new Venta();
            Items detalleVenta = new Items();
            ItemsNegosio itemCart = new ItemsNegosio();
            decimal subtotal;
            try
            {
                foreach (Cart item in carrito)
                {
                    subtotal = 0;
                    subtotal = item.Precio * item.Cantidad;
                    venta.Importe += subtotal;
                }
                venta.idUsuario = usuario.id;
                venta.FechaVenta = DateTime.Now;
                venta.tipoPago = Convert.ToInt32(ddPago.SelectedValue); 
                venta.metodoPago = Convert.ToString(ddPago.Text);
                venta.estado = new Estado();
                venta.estado.Id=1;
                neg.Registrar(venta); //registramos la venta
                id = neg.BuscarID();
                foreach (Cart item in carrito)             //  por cada producto el el carrito insertamos el detalle
                {
                    detalleVenta.idProducto = item.IdProducto;
                    detalleVenta.idVenta = id;
                    detalleVenta.cantidad = item.Cantidad;
                    detalleVenta.Precio = item.Precio;
                    itemCart.Registrar(detalleVenta);
                }
            }
            catch
            {
                Response.Redirect("Error.aspx");
            }
            Session["compra"] = carrito;
            Session["venta"] = venta;
            Session["carrito"] = null;  // se eliminan los productos de carrito 
            Response.Redirect("FinalCompra.aspx");

        }

    }
}