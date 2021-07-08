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
    public partial class Default : System.Web.UI.Page
    {
        CategoriaNegosio Catneg= new CategoriaNegosio();
        public List<Categoria> listcat { get; set; }
        Categoria cat = new Categoria();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["listaCat"]==null)
            {
                listcat = Catneg.listar();
            }
            else
            {
                listcat = (List<Categoria>)Session["listaCat"];
            }
        }
    }
}