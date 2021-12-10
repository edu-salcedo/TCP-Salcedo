<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="Ecommerce.Productos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container mx-5">

            <div class="align-items-lg-start ms-5">
                <a> <asp:TextBox ID="TexBuscar" placeholder="Buscar producto marcas y ma..." runat="server">  </asp:TextBox></a> 
                <a> <asp:Button ID="btnFiltrar" CssClass="btn btn-secondary mx-5" runat="server" Onclick="btnFiltrar_Click" Text="Search" /></a> 
            </div>

         <div class="container text-center">
                    <hr />
                    <hr />
                    <asp:Label ID="lbtotal" runat="server" Text=""></asp:Label>
                    <a href="UpdateProducto.aspx" class="btn btn-success btn lg">Agregar un nuevo articulo</a>
        </div>
        <div class="row pt-3">
                <table class="table table-hover">
                    <tr>
                        <th scope="col"></th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Precio</th>
                        <th scope="col">Stock</th>
                        <th scope="col"></th>
                    </tr>

                    <%foreach (Dominio.Producto item in Produc)
                        {
                            if (item.Estado == true)
                            {   if (item.stock >3)
                                {
                            %>
                               <tr>
                                   <td><img src="<%=item.Imagen %>" alt="No hay imagen" width="100" height="100" /></td>
                                   <td><%=item.Nombre %></td>
                                   <td><%=string.Format("{0:C}", item.Precio) %></td>
                                   <td><%=item.stock %></td>
                                   <td><a class="btn btn-danger" href="Productos.aspx?idCancelar=<%= item.Id %>" onclick="return confirm('Esta seguro de  eliminar el articulo?')"  role="button">Eliminar</a></td>
                                    <td><a href="UpdateProducto.aspx?idproduct=<%= item.Id %>" class="btn btn-primary btn lg">editar</a></td>                           
                               </tr>
                            <%  }else
                                {%>
                                <tr class="alert-warning">
                                   <td><img src="<%=item.Imagen %>" alt="No hay imagen" width="100" height="100" /></td>
                                   <td><%=item.Nombre %></td>
                                   <td><%=string.Format("{0:C}", item.Precio) %></td>
                                   <td><%=item.stock %></td>
                                   <td><a class="btn btn-danger" href="Productos.aspx?idCancelar=<%= item.Id %>"  onclick="return confirm('Esta seguro de eliminar el articulo?')" role="button">Eliminar</a></td>
                                    <td><a href="UpdateProducto.aspx?idproduct=<%= item.Id %>" class="btn btn-primary btn lg">editar</a></td>                           
                               </tr>
                     
                               <%}                                                                   
                            }
                       }%>
                </table>
            </div>
      


</asp:Content>
