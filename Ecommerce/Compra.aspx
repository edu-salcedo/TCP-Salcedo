<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Compra.aspx.cs" Inherits="Ecommerce.Compra" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="row">
        <div class="col-9">
            <table class="table table-hover table-striped">
                <tr>
                    <th scope="col"></th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Precio</th>
                    <th scope="col">Cantidad</th>
                </tr>
                <%foreach (Dominio.Cart item in carrito)
                    { %>
                <tr>
                    <td>
                        <img src="<%=item.ImagenPro %>" alt="No hay imagen" width="100" height="100" /></td>
                    <td><%=item.NombrePro %></td>
                    <td><%=string.Format("{0:C}",item.Precio) %></td>
                    <td><%=item.Cantidad%></td>

                </tr>
                <%}%>
            </table>

        </div>
        <div class="col-3">
        </div>


    </div>




</asp:Content>
