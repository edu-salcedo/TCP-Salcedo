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
    public partial class VistaClientes : System.Web.UI.Page
    {
        public List<Venta> listacompra = new List<Venta>();
        VentaNegosio negosio = new VentaNegosio();
        protected void Page_Load(object sender, EventArgs e)
        {
            User usuario = new User();
            if (Session["Logeado"]==null)
            {
                Response.Redirect("Catalogo.aspx");
            }
            else
            {
                usuario = (User)Session["Logeado"];
            }
            try
            {
               listacompra = negosio.listar();
               listacompra = listacompra.FindAll(x => x.idUsuario==usuario.id);
            }
            catch
            {
                Response.Redirect("Error.aspx");
            }

        }
    }
}