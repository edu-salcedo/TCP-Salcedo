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
    public partial class UpdateProducto : System.Web.UI.Page
    {
        public Producto prod;
        public ProductoNegosio negosio;
        public MarcaNegosio Marcaneg;
        public CategoriaNegosio Catneg;
        public string idItem;
        public string imagen;
        protected void Page_Load(object sender, EventArgs e)
        {
            negosio = new ProductoNegosio();
            Marcaneg = new MarcaNegosio();
            Catneg = new CategoriaNegosio();
            prod = new Producto();
            List<Marca> marcalist = new List<Marca>();
            List<Categoria> Catlist = new List<Categoria>();
            idItem = Request.QueryString["idproduct"];

            try
            {
                if (!IsPostBack)  // si es la primera vuelta
                {
                    marcalist = Marcaneg.listar();
                    ddMarca.DataSource = marcalist;    ///se llena el dropdown  con la lista de marcas registardas
                    ddMarca.DataValueField = "id";
                    ddMarca.DataTextField = "nombre";
                    ddMarca.SelectedIndex = -1;

                    ddMarca.DataBind();

                    Catlist = Catneg.listar();
                    ddCat.DataSource = Catlist;    ///se llena el dropdown  con la lista de categorias registardas
                    ddCat.DataValueField = "id";
                    ddCat.DataTextField = "nombre";
                    ddCat.SelectedIndex = -1;

                    ddCat.DataBind();
                }
                else    // si es la segunda vuelta o mas
                {
                    prod.Nombre = txtNombre.Text;
                    prod.Descripcion = txtDescripcion.Text;
                    prod.categoria = new Categoria();
                    prod.categoria.Id = Convert.ToInt32(ddCat.SelectedValue);
                    prod.marca = new Marca();
                    prod.marca.Id = Convert.ToInt32(ddMarca.SelectedValue);
                    prod.Imagen = txtUrl.Text;
                    if (txtPrecio.Text == "") //parche para cuando ingresas primero el url  hace el autopostback y queda precio "" y te tira error
                    {
                       prod.Precio = 0;
                       prod.stock = 0;
                    }
                    else
                    {
                        prod.Precio = Convert.ToDecimal(txtPrecio.Text);
                        prod.stock = Convert.ToInt32(txtStock.Text);
                    }
                }

                if (idItem != null)//si viene a Editar
                {
                    if (Session.Contents["ListaProducto"] == null)
                    {
                        Session.Add("ListaProducto", negosio.listar());
                    }
                    prod = ((List<Producto>)Session.Contents["ListaProducto"]).Find(X => X.Id.ToString().Contains(idItem));  //asignamos a produc  el producto encontado en la session listaproducto

                    if (!IsPostBack)// si es la primera vuelta  llenamos los campos de texto con el producto
                    {
                        txtNombre.Text = prod.Nombre.ToString();
                        txtDescripcion.Text = prod.Descripcion.ToString();
                        ddCat.SelectedValue = prod.categoria.Id.ToString();
                        ddMarca.SelectedValue = prod.marca.Id.ToString();
                        int precio = Convert.ToInt32(prod.Precio);
                        txtPrecio.Text = precio.ToString();
                        txtStock.Text = prod.stock.ToString();
                        txtUrl.Text = prod.Imagen.ToString();
                        imagen = prod.Imagen.ToString();
                    }
                }
        }
            catch
            {
                Response.Redirect("error.aspx");
            }
}
        protected void txtUrl_TextChanged(object sender, EventArgs e)
        {
            imagen = txtUrl.Text;
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Page.Validate();

            if (!Page.IsValid)
            {
                return;
            }
            if (IsPostBack)
            {
                prod.Nombre = txtNombre.Text;
                prod.Descripcion = txtDescripcion.Text;
                prod.categoria = new Categoria();
                prod.categoria.Id = Convert.ToInt32(ddCat.SelectedValue);
                prod.marca = new Marca();
                prod.marca.Id = Convert.ToInt32(ddMarca.SelectedValue);
                prod.Precio = Convert.ToDecimal(txtPrecio.Text);
                prod.stock = Convert.ToInt32(txtStock.Text);
                if (txtUrl.Text.Length < 1000)
                {
                    prod.Imagen = txtUrl.Text;
                }
            }

            if(txtUrl.Text.Length <1000)
            {

                if (prod.Id == 0)
                {
                    negosio.registrar(prod);
                    Session["ListaProducto"]=negosio.listar();  //agregamos a la session listaProducto el nuevo producto ingresado
                }
                else
                {
                    negosio.editar(prod);
                }
                Response.Redirect("Productos.aspx");
            }
            else
            {
                lbstring.Text="la url tiene muchos caracteres";
                lbstring.Visible = true;
            }
        }
    }
}