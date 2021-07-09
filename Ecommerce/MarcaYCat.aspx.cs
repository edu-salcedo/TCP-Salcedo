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
    public partial class MarcaYCat : System.Web.UI.Page
    {
        public List<Marca> lismarca;
        public List<Categoria> liscat;
        CategoriaNegosio catneg;
        MarcaNegosio marneg;
        public int idmarca=0;
        public int idcat=0;
        public string imagen;
        protected void Page_Load(object sender, EventArgs e)
        {
            marneg = new MarcaNegosio();
            catneg = new CategoriaNegosio();
            lismarca = marneg.listar();
            liscat = catneg.listar();

            idcat = Convert.ToInt32(Request.QueryString["idcat"]);
            idmarca = Convert.ToInt32(Request.QueryString["idMarca"]);

            if (idcat>0)
            {
                Categoria cat = new Categoria();
                cat =buscarCat();
                texnom.Text = cat.Nombre;
                TexImagen.Text = cat.Imagen;
                imagen = cat.Imagen;
                if(!IsPostBack)
                {

                }
            }
            if (idmarca>0)
            {
                Marca mar = new Marca();
                mar = buscarMarca();
                texmarca.Text = mar.Nombre;             
            }

        }
        Categoria buscarCat()
        {
            Categoria aux = new Categoria();

            foreach (Categoria item in liscat)
            {
                if (item.Id == idcat)
                {
                    aux = item;
                }
            }
            return aux;
        }

        Marca buscarMarca()
        {
            Marca aux = new Marca();

            foreach (Marca item in lismarca)
            {
                if (item.Id == idmarca)
                {
                    aux = item;
                }
            }
            return aux;
        }

        protected void TexImagen_TextChanged(object sender, EventArgs e)
        {
            imagen = TexImagen.Text;
        }

        protected void BtnGuardar_Click(object sender, EventArgs e)
        {

            //if (IsPostBack)
            //{
            //    if (idcat > 0)
            //    {
            //        Categoria cat = new Categoria();
            //        cat = buscarCat();
            //        texnom.Text = cat.Nombre;
            //        TexImagen.Text = cat.Imagen;
            //    }
            //    if (idmarca > 0)
            //    {
            //        Marca mar = new Marca();
            //        mar = buscarMarca();
            //        texmarca.Text = mar.Nombre;
            //    }
            //}
        }
    }
}