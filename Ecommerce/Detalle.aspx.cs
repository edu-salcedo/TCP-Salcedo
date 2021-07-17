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
       public List<Producto> listaProducto;
        protected void Page_Load(object sender, EventArgs e)
        {
             List<Producto> aux=new List<Producto>();
            try
            {

                ProductoNegosio negocio = new ProductoNegosio();
                idArticulo = Convert.ToInt32(Request.QueryString["idArticulo"]);
                aux = negocio.listar();             
                Prodetalle= Buscar(aux, idArticulo);
                    
                listaProducto = aux.FindAll(x => x.categoria.Nombre.Contains(Prodetalle.categoria.Nombre));
                listaProducto.Remove(listaProducto.Find(x => x.Id==idArticulo));
            }
            catch
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