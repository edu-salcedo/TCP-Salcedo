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
        Categoria cat;
        Marca mar;
        public int idmarca=0;
        public int idcat=0;
        public string imagen;
        public int aux;
        protected void Page_Load(object sender, EventArgs e)
        {
            marneg = new MarcaNegosio();
            catneg = new CategoriaNegosio();
            lismarca = marneg.listar();
            liscat = catneg.listar();
             cat = new Categoria();
             mar = new Marca();

            if(IsPostBack)
            {
                mar.Nombre = texmarca.Text;
                cat.Nombre = texnom.Text;
                cat.Imagen = TexImagen.Text;
            }
     

            if (Request.QueryString["idcat"]!=null) // si biene a editar una categoria
            {
                idcat = Convert.ToInt32(Request.QueryString["idcat"]); 
                cat =buscarCat();
                if (!IsPostBack)
                {
                    texnom.Text = cat.Nombre;
                    TexImagen.Text = cat.Imagen;
                    imagen = cat.Imagen;
                }
                BtnGuardar.Visible = true;
                BtnGuardar.Text = "Editar Categoria";
            }
            if (Request.QueryString["idMarca"]!=null)  // si biene a editar una marca
            {
                idmarca = Convert.ToInt32(Request.QueryString["idMarca"]);
                mar = buscarMarca();
                if (!IsPostBack)
                {
                    texmarca.Text = mar.Nombre;
                }
                BtnGuardar.Visible = true;
                BtnGuardar.Text = "Editar Marca";
            }

            if(Request.QueryString["cat"]=="1") //si pulsa boton ingresar nuevo categoria
            {
                    aux=1;
                BtnGuardar.Visible = true;
                BtnGuardar.Text = " Registrar Categoria";
            }
            if (Request.QueryString["mar"] == "2") //si pulsa boton ingresar nuevo marca
            {
                    aux= 2;
                BtnGuardar.Visible = true;
                BtnGuardar.Text = "Registar Marca";
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

            if (IsPostBack)
            {
                if (idcat>0|| aux==1)
                {
                    cat.Nombre = texnom.Text;
                    cat.Imagen =TexImagen.Text;
                    if (TexImagen.Text.Length < 100)
                    {
                     if (aux==1) catneg.registrar(cat);
                    if (idcat>0) catneg.editar(cat);

                    }
                    else
                    {
                        lbrec.Text = "la url tiene muchos caracteres";
                    }
                 
                }
                if (idmarca>0||aux==2)
                {
                    mar.Nombre = texmarca.Text;
                   
                    if (aux==2)marneg.registrar(mar);
                    if (idmarca>0) marneg.editar(mar);
                    
                }
            }


            Response.Redirect("MarcaYCat.aspx");
        }
    }
}