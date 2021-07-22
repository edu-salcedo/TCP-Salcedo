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
    public partial class DetalleCompra : System.Web.UI.Page
    {
        public List<Cart> listacompra = new List<Cart>();
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Items> itemsCarrito = new List<Items>();
            Venta ven = new Venta();
            User usuario = new User();

            if (Session["logeado"] == null)
            {
                Response.Redirect("Catalogo.aspx");
            }
            usuario = (User)Session["logeado"];

      
            lbfecha.Text = "Fecha :  " + Convert.ToString(ven.FechaVenta);
            lbtipopago.Text = "Metodo de Pago : " + Convert.ToString(ven.metodoPago);
            lbnombre.Text = "Nombre : " + usuario.Nombre + usuario.Apellido;
            lbtelefono.Text = "Telefono : " + Convert.ToString(usuario.telefono);
            lbdireccion.Text = "Direccion : " + Convert.ToString(usuario.direccion);
            lbdni.Text = "DNI : " + Convert.ToString(usuario.DNI);

            lbtotal.Text = "Total : " + Convert.ToString(ven.Importe);
    }
}