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
        string Categoria;
        string marca;
        public List<Producto> listaProducto { get; set; }
        public List<Marca> lismarca { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            ProductoNegosio Negosio = new ProductoNegosio();
            MarcaNegosio marneg = new MarcaNegosio();
            Categoria = Request.QueryString["nomcat"];
            marca= Request.QueryString["marca"];
            List<Producto> listaaux = new List<Producto>();
            try
            {
               lismarca = marneg.listar();
               if (Session["ListBuscar"] == null & Categoria==null && marca==null)   // si la session "ListBuscar" es nulo 
                {
                    listaProducto = Negosio.listar();     //llenamos la variable listaArticulos de todos los articulos en base de datos
                }
                else
                {                  
                    if (Categoria != null)  // sim biene por el lado de categorias 
                    {
                        listaaux = Negosio.listar();
                        listaProducto = listaaux.FindAll(x => x.categoria.Nombre.Contains(Categoria));
                    }
                    else
                    {
                        if(marca!=null)  // si biene por la lista de marcas
                        {
                            listaaux = Negosio.listar();
                            listaProducto = listaaux.FindAll(x => x.marca.Nombre.Contains(marca));
                        }
                        else
                        {                       
                          listaProducto = (List<Producto>)Session["ListBuscar"];  //si no llenamos la listaArticulos con la ssesion de busqueda
                          Session["ListBuscar"] = null;
                        }
                    }
                }
            }
            catch
            {
                Response.Redirect("Error.aspx");
            }
        }
    }
}