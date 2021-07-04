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
        public List<Producto> carritoCompra = null;
        private int idProduc = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            carritoCompra = new List<Producto>();
            if (Session["carrito"] == null)    // si session "carrito" es nulo creamos una session del lista de articulos
            {
                Session.Add("carrito", new List<Producto>());
            }
            else
            {
                carritoCompra = (List<Producto>)Session["carrito"];
            }

            if (!IsPostBack)
            {


                if (Request.QueryString["idArticulo"] != null)
                {
                    try
                    {
                        idProduc = Convert.ToInt32(Request.QueryString["idArticulo"]);
                        articuloNuevo = new Producto();
                        ProductoNegosio auxNegocio = new ProductoNegosio();
                        articuloNuevo = auxNegocio.listar().Find(x => x.Id == idProduc);  // le asigna a la variable articulonuevo  el id encontrado
                        carritoCompra = (List<Producto>)Session["carrito"];
                        carritoCompra.Add(articuloNuevo);
                        Session.Add("carrito", carritoCompra);             //agregamos a la lista secion "carrito" con el nuevo articulo 

                    }
                    catch (Exception)
                    {
                        Response.Redirect("Error.aspx");
                    }

                }
            }

        }
    }
}