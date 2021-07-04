
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
    public partial class Productos : System.Web.UI.Page
    {
       public List<Producto> Produc;
        protected void Page_Load(object sender, EventArgs e)
        {
            ProductoNegosio negosio = new ProductoNegosio();
            Produc = negosio.listar();

        }
    }
}