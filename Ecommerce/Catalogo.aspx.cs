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
    public partial class Catalogo : System.Web.UI.Page
    {
        public List<Producto> listaProducto { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            ProductoNegosio Negosio = new ProductoNegosio();

            try
            {
                if (Session["ListBuscar"] == null)                                  // si la session "ListBuscar" es nulo 
                {
                    listaProducto = Negosio.listar();                                //llenamos la variable listaArticulos de todos los articulos en base de datos
                }
                else
                {
                    listaProducto = (List<Producto>)Session["ListBuscar"];         //si no llenamos la listaArticulos con la ssesion de busqueda
                    Session["ListBuscar"] = null;
                }
            }
            catch
            {
                Response.Redirect("Error.aspx");
            }
        }
    }
}