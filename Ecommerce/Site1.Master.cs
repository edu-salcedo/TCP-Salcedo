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
        List<Producto> listaBuscar { get; set; }
        User nuevo;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["carrito"] == null)
            {
                Session.Add("carrito", new List<Cart>());
            }
            try
            {
                if (Session["Logeado"] != null)
                {
                    nuevo = new User();
                    nuevo = (User)Session["Logeado"];
                    txtUsuario.Text = nuevo.Usuario; //colocamos el nombre en el navar del usuario logeado
                    salir.Visible = true;
                    Iniciar.Visible = false;  //  ocultamos el iniciar sesion

                    if (nuevo.tipo == 1)
                    {
                        vistaadmin.Visible = true;
                    }
                    else
                    {
                        vistaadmin.Visible = false;
                    }
                }
            }
            catch
            {

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

        protected void salir_Click(object sender, EventArgs e)
        {
            Session["logeado"] = null;
            Response.Redirect("Catalogo.aspx");
        }
    }
}