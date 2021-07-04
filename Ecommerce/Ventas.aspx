<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Ventas.aspx.cs" Inherits="Ecommerce.Ventas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row pt-3">
            <div class="col-12 col-md-8  ">
                <table class="table table-hover">
                    <tr>
                        <th scope="col">Nombre</th>
                        <th scope="col">Precio</th>
                        <th scope="col">fecha</th>
                        <th scope="col"></th>
                    </tr>
                    <%foreach (Dominio.Producto item in lista)
                        { %>
                    <tr>
                        <td><%=item.Nombre %></td>
                        <td><%=string.Format("{0:C}",item.Precio) %></td>
                        <td><%=item.stock %></td>
                         <td><a href="Ventas.aspx.aspx" class="btn btn-primary btn lg">ver mas info</a></td>
                
                    </tr>
                    <%}%>
                </table>
            </div>
            <div class="col-12 col-md-4">
                <div class="container">
                    <hr />
                    <h3>aqui se vera la informacion a detalle de la venta </h3>
                    <hr />
                    
   
                </div>

            </div>
        </div>

</div>
</asp:Content>
