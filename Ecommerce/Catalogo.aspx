<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Catalogo.aspx.cs" Inherits="Ecommerce.Catalogo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin:10px 40px">

        <div class="row pl-3">
            <%
                foreach (Dominio.Producto item in listaProducto)
                { %>
            <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                <div class="card text-center h-100" style="width: 18rem;">
                    <img src="<%=item.Imagen%>" alt="no hay imagen" />
                    <div class="card-body flex-column">
                        <h3 class="card-title"><b><%= item.Nombre %> </b></h3>
                        <h5 class="card-title"><%= item.marca %></h5>
                        <h5 class="card-title"><%= string.Format("{0:C}", item.Precio) %></h5>
                    </div>
                    <div class="d-grid gap-2 col-9 mx-auto">
                        <a href="Carrito.aspx?idArticulo=<%=item.Id.ToString() %>" class="btn btn-success"><i class="bi bi-cart4"></i>Agregar</a>
                        <br />
                        <a href="Detalle.aspx?idArticulo=<%=item.Id.ToString() %>" class="btn btn-info">Detalle</a>
                        <%--no debe tener espacios  el href si no te manda error de objeto no instanciado--%>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </div>
    <br />
</asp:Content>
