<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="FinalCompra.aspx.cs" Inherits="Ecommerce.FinalCompra1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .titulo{
            text-justify:auto;
            font-size:3rem;
            font-family:Bahnschrift;
            color:brown;
        }
    </style>

    <div class="container ">
        <div class="titulo">
           <p >Felicitaciones ha realizado la compra con exito</p>
        </div>
        <div class="container">

            <h3>este es el detalle de tu compra</h3>
            <div class="col-12 modal-content">
                <table class="table">
                    <tr>
                        <th scope="col">Nombre</th>
                        <th scope="col">Precio Unitario</th>
                        <th scope="col">Cantidad</th>
                    </tr>
                    <%foreach (Dominio.Cart item in listacompra)
                        { %>
                    <tr>
                        <td><%=item.NombrePro %></td>
                        <td><%=string.Format("{0:C}",item.Precio) %></td>
                        <td><%=item.Cantidad%></td>

                    </tr>
                    <%}%>
                </table>
            </div>
        </div>

        <div>
           <a href="Catalogo.aspx" class="btn btn-primary">Seguir navegando</a>
        </div>
    </div>

</asp:Content>
