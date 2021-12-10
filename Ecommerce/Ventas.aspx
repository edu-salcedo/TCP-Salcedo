<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Ventas.aspx.cs" Inherits="Ecommerce.Ventas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container py-5">
        <div class="row pt-3">
            <div class="col-12 ">
                <table class="table table-hover border p-5">
                    <tr>
                        <th scope="col">Numero de compra</th>
                        <th scope="col"> Metodo de pago</th>
                        <th scope="col">Importe </th>
                        <th scope="col">Fecha </th>
                    </tr>
                    <%foreach (Dominio.Venta item in listaVentas)
                        { %>
                    <tr>
                        <td><%=item.Id %></td>
                        <td><%=item.metodoPago%></td>
                        <td><%= string.Format("{0:C}",item.Importe) %> </td>
                        <td><%=item.FechaVenta%></td>
                         <td> <a href="VentaDetalle.aspx?idven=<%=item.Id%>" class=""> mas info</a></td>
                    </tr>
                    <%}%>
                </table>
            </div>
        </div>

</div>
</asp:Content>
