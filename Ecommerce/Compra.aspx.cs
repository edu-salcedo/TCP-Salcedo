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
            try
            {
                lisUser = usuarioNegosio.listar();
                usuario = new User();
                usuario = (User)Session["Logeado"];

                if (usuario.id > 0)
                {
                    usuario = Buscar_Usuario(usuario.id);
                    lbnombre.Text = "nombre : "+ usuario.Nombre;
                    lbapellido.Text = usuario.Apellido;
                    lbdni.Text ="DNI : " +Convert.ToString( usuario.DNI);
                    lbmail.Text = "Correo : "+usuario.mail;
                    lbdireccion.Text = "Dirección : "+ usuario.direccion;
                    lbtelefono.Text = "Telefono : "+Convert.ToString(usuario.telefono);
                }
                if (Session["carrito"] == null)
                {
                    Session.Add("carrito", new List<Cart>());
                }
                else
                {
                    carrito = (List<Cart>)Session["carrito"];
                }
                tipopago = Convert.ToInt32(Request.QueryString["tipopago"]);
                switch (tipopago)
                {
                    case 1:
                        lbMetodopago.Text = "Metodo de pago : mercado pago";
                        metodopago = "Mercado Pago";         
                        break;
                    case 2:
                        lbMetodopago.Text = "Metodo de pago : Mastercard";
                        metodopago = "Mastercard";
                        break;
                    case 3:
                        lbMetodopago.Text = "Metodo de pago : Visa";
                        metodopago = "Visa";
                        break;
                    case 4:
                        lbMetodopago.Text = "Metodo de pago : Rapipago";
                        metodopago = "Rapipago";
                        break;
                    default: tipopago = 1;
                        break;
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

            try
            {
                foreach (Cart item in carrito)
                {
                    venta.Importe += item.Precio;
                }
                venta.idUsuario = usuario.id;
                venta.FechaVenta = DateTime.Now;
                venta.tipoPago = tipopago;
                venta.metodoPago = metodopago;
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