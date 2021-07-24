<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="MenuAdmin.aspx.cs" Inherits="Ecommerce.MenuAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <style>
        .col img{
            background-color:blue;
            padding:6px;
        }
        .menu {
            padding:5rem 5rem;
            border-color: blue;
            background-color:cadetblue;
        }
    </style>
    <div class="menu">
          <div class="container text-center fs-2">
              <p>Bienvenido Admin</p>
          </div>
        <div class="row text-center">
            <div class="col col-lg col-6  col-sm col-12">
                <a href="Clientes.aspx"><img src="img/clientes.jpg" class="img-fluid rounded-circle ima" style="width: 200px; height: 200px; border-color: blue;" /></a> 
            </div>
            <div class="col col-lg col-6  col-sm col-12 ">
               <a href="Productos.aspx"><img src="img/productos.jpg" class="img-fluid rounded-circle" style="width: 200px; height: 200px" /></a> 
            </div>
        </div>
        <div class="row text-center">
            <div class="col col-lg col-6  col-sm col-12 m-4">
                <a href="Ventas.aspx"><img src="img/ventas.jpg" class="img-fluid rounded-circle" style="width: 200px; height: 200px" /></a> 
            </div>
            <div class="col col-lg col-6  col-sm col-12 m-4">
               <a href="MarcaYCat.aspx"> <img src="img/marcas.png" class="img-fluid rounded-circle" style="width: 200px; height: 200px" /></a> 
            </div>
        </div>
    </div>



</asp:Content>
