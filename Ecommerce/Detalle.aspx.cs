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
    public partial class Detalle : System.Web.UI.Page
    {
        int idArticulo;
       public  Producto Prodetalle=null;
        List<Producto> listaProducto;
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {

                ProductoNegosio negocio = new ProductoNegosio();
                idArticulo = Convert.ToInt32(Request.QueryString["idArticulo"]);
                listaProducto = negocio.listar();
               
                Prodetalle= Buscar(listaProducto, idArticulo);

            }
            catch(Exception ex)
            {
                Response.Redirect("Default.aspx");
            }
        }
        
        public Producto Buscar(List<Producto>list,int id )
        {
            foreach(Producto item in list)
            {
                if (item.Id==id)
                {
                    Prodetalle = item;
                }
            }
            return Prodetalle;
        }
    }
}