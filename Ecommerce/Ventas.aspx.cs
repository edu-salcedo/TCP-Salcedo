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
    public partial class Ventas : System.Web.UI.Page
    {
        public List<Producto> lista = new List<Producto>();
        protected void Page_Load(object sender, EventArgs e)
        {
            ProductoNegosio negosio = new ProductoNegosio();
            lista = negosio.listar();

        }
    }
}