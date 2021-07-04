<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="Ecommerce.Productos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container">
        <div class="row pt-3">
            <div class="col-12 col-md-8  ">
                <table class="table table-hover">
                    <tr>
                        <th scope="col"></th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Precio</th>
                        <th scope="col">Stock</th>
                        <th scope="col"></th>
                    </tr>
                    <%foreach (Dominio.Producto item in Produc)
                        { %>
                    <tr>
                        <td>
                            <img src="<%=item.Imagen %>" alt="No hay imagen" width="100" height="100" /></td>

                        <td><%=item.Nombre %></td>
                        <td><%=string.Format("{0:C}",item.Precio) %></td>
                        <td><%=item.stock %></td>
                        <td><a class="btn btn-danger" href="Carrito.aspx?idCancelar=<%= item.Id %>" role="button">Eliminar</a></td>
                         <td><a href="UpdateProducto.aspx" class="btn btn-primary btn lg">editar</a></td>
                
                    </tr>
                    <%}%>
                </table>
            </div>
            <div class="col-12 col-md-4">
                <div class="container">
                    <hr />
                    <h3>Estos son todos los productos </h3>
                    <hr />
                    <asp:Label ID="lbtotal" runat="server" Text=""></asp:Label>
                    <a href="UpdateProducto.aspx" class="btn btn-success btn lg">Agregar un nuevo articulo</a>
   
                </div>

            </div>
        </div>


    </div>
</asp:Content>
