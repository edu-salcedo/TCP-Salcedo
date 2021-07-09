
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

            if (Request.QueryString["idCancelar"] != null)
            {
                int aux= Convert.ToInt32(Request.QueryString["idCancelar"]);
                int id= buscar(aux);
                if(id>0)
                {
                    negosio.eliminar(id);
                }

            }

        }

        int buscar(int id)
        {
            int idpro=0;
            foreach(Producto item in Produc)
            {
                if (item.Id == id) ;
                {
                    idpro = item.Id;
                }
            }
            return idpro;
        }

    }
}