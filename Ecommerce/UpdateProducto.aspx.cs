﻿using System;
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
                    prod.Imagen = txtUrl.Text;

                }
                else
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
            }
            catch
            {

            }
            if (idItem != null)//si viene a Editar
            {

                if (Session.Contents["ListaProducto"] == null)
                {
                    Session.Add("ListaProducto", negosio.listar());
                }
                prod = ((List<Producto>)Session.Contents["ListaProducto"]).Find(X => X.Id.ToString().Contains(idItem));  //asignamos a produc  el producto encontado en la session listaproducto

                txtNombre.Text = prod.Nombre.ToString();
                txtDescripcion.Text = prod.Descripcion.ToString();
                ddCat.SelectedValue = prod.categoria.Id.ToString();
                ddMarca.SelectedValue = prod.marca.Id.ToString();
                int precio = Convert.ToInt32(prod.Precio);
                txtPrecio.Text = precio.ToString();
                txtStock.Text = prod.stock.ToString();
                imagen = prod.Imagen.ToString();
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
                prod.Imagen = txtUrl.Text;

            }

            if (prod.Id == 0)
            {
                negosio.registrar(prod);
            }
            if(prod.Id>0)
            {
                negosio.editar(prod);

            }
        }
    }
}