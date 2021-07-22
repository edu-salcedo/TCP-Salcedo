﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Ventas.aspx.cs" Inherits="Ecommerce.Ventas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container py-5">
        <div class="row pt-3">
            <div class="col-12 col-md-8  ">
                <table class="table table-hover">
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
