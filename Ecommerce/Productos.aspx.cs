
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
        List<Producto> listaBuscar { get; set; }
        public List<Producto> Produc;
        protected void Page_Load(object sender, EventArgs e)
        {
            ProductoNegosio negosio = new ProductoNegosio();
            if (Session["Listfiltrada"] != null)
            {
                Produc = (List<Producto>)Session["Listfiltrada"];
                if(Produc.Count==0) Produc = negosio.listar();
            }
            else
            {
                Produc = negosio.listar();
            }
            if (Request.QueryString["idCancelar"] != null)
            {
                int aux= Convert.ToInt32(Request.QueryString["idCancelar"]);
                int id= buscar(aux);
                if(id>0)
                {
                    negosio.Baja(id);
                }
                Produc = negosio.listar();

            }

        }

        int buscar(int id)
        {
            int idpro=0;
            foreach(Producto item in Produc)
            {
                if (item.Id == id)
                {
                    idpro = item.Id;
                }
            }
            return idpro;
        }
        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            List<Producto> lista = new List<Producto>();
            ProductoNegosio Negocio = new ProductoNegosio();

            if (TexBuscar.Text != "")
            {
                try
                {
                    lista = Negocio.listar();
                    Produc = lista.FindAll(x => x.Nombre.ToLower().Contains(TexBuscar.Text.ToLower()) || x.marca.Nombre.ToLower().Contains(TexBuscar.Text.ToLower())); //buscamos coinsidencias por nombre o por marca
                    Session.Add("Listfiltrada",Produc );     // agregamos a la session "carrito" el articulo encontrado 
                }
                catch
                {
                    Response.Redirect("Error.aspx");
                }

                Response.Redirect("Productos.aspx");
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
    
        }
    }
}