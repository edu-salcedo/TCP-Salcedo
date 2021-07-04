<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="Ecommerce.Clinetes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="container">
        <div class="row pt-3">
            <div class="col-12 col-md-8  ">
                <table class="table table-hover">
                    <tr>
                        <th scope="col">Nombre</th>
                        <th scope="col">direccion</th>
                        <th scope="col">compras realizadas</th>
                        <th scope="col"></th>
                    </tr>
                    <%foreach (Dominio.Producto item in lista)
                        { %>
                    <tr>
                        <td><%=item.Nombre %></td>
                        <td><%=item.Descripcion %></td>
                        <td><%=item.stock %></td>
                         <td><a href="Clientes.aspx" class="btn btn-primary btn lg">mas info</a></td>
                
                    </tr>
                    <%}%>
                </table>
            </div>
            <div class="col-12 col-md-4">
                <div class="container">
                    <hr />
                    <h3>aqui se vera la informacion detallada del cliete seleccionado </h3>
                    <hr />
                </div>

            </div>
        </div>

</div>
</asp:Content>
