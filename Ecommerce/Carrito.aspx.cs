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
    public partial class Carrito : System.Web.UI.Page
    {
        public Producto articuloNuevo { get; set; }
        public List<Producto> lista;
        public List<Cart> carrito = new List<Cart>();
        public int idPro = 0;
        public int idmas = 0;
        public decimal total = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["carrito"] == null)
                {
                    Session.Add("carrito", new List<Cart>());
                }
                else
                {
                    carrito = (List<Cart>)Session["carrito"];
                }
                if (!IsPostBack)
                {
                    if (Request.QueryString["idArticulo"] != null)  // si biene a agregar un producto al carrito
                    {
                        idPro = Convert.ToInt32(Request.QueryString["idArticulo"]);
                        buscar_producto(idPro);
                    }
                    if (Request.QueryString["idmas"] != null)  // si biene a sumar cantidad de producto
                    {
                        idmas = Convert.ToInt32(Request.QueryString["idmas"]);
                        buscar_producto(idmas);
                    }
                    if (Request.QueryString["idcancelar"] != null)//si bine a quitar el producto del carrito
                    {
                        idPro = Convert.ToInt32(Request.QueryString["idcancelar"]);
                        carrito.Remove(carrito.Find(x => x.IdProducto == idPro));
                        Session["carrito"] = carrito;
                    }
                    total = calcularImporte();
                    lbtotal.Text = Convert.ToString(string.Format("{0:C}", total));
                }
            }
            catch (Exception)
            {
                Response.Redirect("Error.aspx");
            }
        }

        protected void buscar_producto(int id)
        {
            lista = new List<Producto>();
            Cart cart = new Cart();
            Cart aux = new Cart();
            aux = (Cart)carrito.Find(x => x.IdProducto == id);
            ProductoNegosio auxNegocio = new ProductoNegosio();
            lista = auxNegocio.listar();
            foreach (Producto item in lista)
            {
                if (item.Id == id & aux==null) //si el id enviado esta en la lista de base de datos y el id no esta en carrito
                {
                    cart.IdProducto = item.Id;
                    cart.ImagenPro = item.Imagen;
                    cart.NombrePro = item.Nombre;
                    cart.Precio = item.Precio;
                    cart.Cantidad = 1;

                    carrito.Add(cart);
                    Session.Add("carrito", carrito);
                }
                if (item.Id == id & aux!=null) // si el id enviado esta en lista de base de datos y el id esta en el carrito
                {
                    foreach (Cart item2 in carrito)
                    {
                        if (item2.IdProducto == id)
                            item2.Cantidad++;
                    }
                    Session["carrito"] = carrito;
                }
            }
        }


        decimal calcularImporte()
        {
            decimal parcial = 0;
            foreach(Cart item in carrito)
            {
                parcial =Convert.ToDecimal( item.Cantidad * item.Precio);
                total += parcial;
            }
            return total;
        }
    }
}