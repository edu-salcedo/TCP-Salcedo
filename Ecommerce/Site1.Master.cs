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
    public partial class Site1 : System.Web.UI.MasterPage
    {
        public List<Producto> listaBuscar { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Cart> listaarticulo = new List<Cart>();

            if (Session["carrito"] == null)
            {
                Session.Add("carrito", new List<Cart>());
            }
            else
            {
                listaarticulo = (List<Cart>)Session["carrito"];
               
            }

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            List<Producto> lista = new List<Producto>();
            ProductoNegosio Negocio = new ProductoNegosio();
           
                if (TexBuscar.Text != "")
                {
                    lista = Negocio.listar();
                    listaBuscar = lista.FindAll(x => x.Nombre.ToLower().Contains(TexBuscar.Text.ToLower()) || x.marca.Nombre.ToLower().Contains(TexBuscar.Text.ToLower())); //buscamos coinsidencias por nombre o por marca
                    Session.Add("ListBuscar", listaBuscar);     // agregamos a la session "carrito" el articulo encontrado 
                    Response.Redirect("Catalogo.aspx");
                }
                  
        }
    }
}