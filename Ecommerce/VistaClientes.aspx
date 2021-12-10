<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="VistaClientes.aspx.cs" Inherits="Ecommerce.VistaClientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="container py-5">
            <div class="container text-center fs-3" style="font-family:Algerian;">
                 <p> tus compras</p>
              </div>
            <div class="col-12 modal-content">
                <table class="table">
                    <tr class="alert-primary">
   
                        <th scope="col">Numero de compra</th>
                        <th scope="col">Importe </th>
                        <th scope="col">Fecha </th>
                        <th scope="col"></th>
                        <th scope="col"> estado</th>


                    </tr>
                    <%foreach (Dominio.Venta item in listacompra)
    
                        { %>
                    <tr>
                        
                        <td><%=item.Id %></td>
                        <td><%= string.Format("{0:C}",item.Importe) %> </td>
                        <td><%=item.FechaVenta%></td>
                        <td> <a href="DetalleCompra.aspx?idven=<%=item.Id%>" class=""> mas info</a></td>
                        <%if (item.estado.Nombre == "recibido")
                            {%>
                               <td class="text-success"><b><%=item.estado.Nombre%></b></td>
                        <%}
                       else
                       if (item.estado.Nombre == "Entregado")
                            {%>
                               <td class="text-danger"><b><%=item.estado.Nombre%></b></td>
                        <%}
                         else
                        {%>
                        <td><%=item.estado.Nombre%></td>
                        <%} %>
                    </tr>
                    <%}%>
                </table>
                </div>
          </div>


</asp:Content>
