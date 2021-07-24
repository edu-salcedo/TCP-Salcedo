<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Catalogo.aspx.cs" Inherits="Ecommerce.Catalogo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="margin: 10px 40px">

        <div class="row">

            <div class="col-3 mt p-5">

                <h1>Marcas</h1>
                <% foreach (Dominio.Marca item2 in lismarca)
                    {
                %>
                <ul class="list-group">
                    <li class="list-group-item">
                        <a class="marca" href="Catalogo.aspx?marca=<%=item2.Nombre%>"><%=item2.Nombre %></a>
                    </li>
                </ul>
                <%}%>
            </div>

            <div class="col-9">
                <div class="row">
                    <%         
                        foreach (Dominio.Producto item in listaProducto)
                        {
                            if (item.Estado == true)
                            {%>
                              <div class="col-lg col-4 col-md col-6 col-sm col-12 mb-3">
                                  <div class="card text-center h-100" style="width: 15rem;">
                                      <a class="navbar-brand" href="Detalle.aspx?idArticulo=<%=item.Id.ToString() %>"><span>
                                          <img src="<%=item.Imagen%>" alt="no hay imagen" style="width: 10rem" /></span></a>
                                      <div class="card-body flex-column">
                                          <h4 class="card-title"><b><%= item.Nombre %> </b></h4>
                                          <h5 class="card-title"><%= item.marca %></h5>
                                          <h5 class="card-title"><%= string.Format("{0:C}", item.Precio) %></h5>
                                      </div>
                                      <div class="d-grid gap-2 col-9 mx-auto">
                                          <a href="Carrito.aspx?idArticulo=<%=item.Id.ToString() %>" class="btn btn-success"><i class="bi bi-cart4"></i>Agregar</a>
                                          <%--no debe tener espacios  el href si no te manda error de objeto no instanciado--%>
                                          <br />
                                      </div>
                                  </div>
                              </div>
                          <%}
                        } %>
                </div>
            </div>
        </div>
    </div>
    <br />
</asp:Content>

