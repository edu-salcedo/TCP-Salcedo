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
        public User usuario;
        public List<User> lisUser = new List<User>();
        protected void Page_Load(object sender, EventArgs e)
        {
            UserNegosio usuarioNegosio = new UserNegosio();
    
                lisUser = usuarioNegosio.listar();
                if (Session["Logeado"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    usuario = new User();
                    usuario = (User)Session["Logeado"];
                }
                if (usuario.id > 0)
                {
                    usuario = Buscar_Usuario(usuario.id);
                    Texnombre.Text = usuario.Nombre;
                    Texapellido.Text = usuario.Apellido;
                    TexMail.Text = usuario.mail;
                    TexDireccion.Text = usuario.direccion;
                    Textelefono.Text = Convert.ToString(usuario.telefono);
                }
                if (Session["carrito"] == null)
                {
                    Session.Add("carrito", new List<Cart>());
                }
                else
                {
                    carrito = (List<Cart>)Session["carrito"];
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
            VentaNegosio neg = new VentaNegosio();

                foreach (Cart item in carrito)
                {
                    venta.Importe += item.Precio;
                }
                venta.idUsuario = usuario.id;
                venta.FechaVenta = DateTime.Now;
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

                Session["compra"] = carrito;
                Session["carrito"] = null;  // se eliminan los productos de carrito 
                Response.Redirect("FinalCompra.aspx");

        }
    }
}