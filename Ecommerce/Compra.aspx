<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Compra.aspx.cs" Inherits="Ecommerce.Compra" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="text-center"> 
      <h2>resumen de tu compra</h2> 
    </div> 

<div class="container pt-5">
    <div class="row p-2">
        <div class="col-12 col-md-8 me-5">
            <table class="table table-hover">
                <tr>
                    <th scope="col">Nombre</th>
                    <th scope="col">Precio</th>
                    <th scope="col">Cantidad</th>
                </tr>
                <%foreach (Dominio.Cart item in carrito)
                    { %>
                <tr>
          <%--          <td>
                        <img src="<%=item.ImagenPro %>" alt="No hay imagen" width="100" height="100" /></td>--%>
                    <td><%=item.NombrePro %></td>
                    <td><%=string.Format("{0:C}",item.Precio) %></td>
                    <td><%=item.Cantidad%></td>

                </tr>
                <%}%>
            </table>

        </div>
             <div class="col-12 col-md-3 pb-5 ms-4"> 
                 <h4>tus datos</h4>
                   <div class="col">
                       <label class="from-group">Nombre:</label>
                       <asp:TextBox ID="Texnombre" runat="server" Class="form-control"></asp:TextBox>
                   </div>
                   <div class="col">
                       <label class="from-group">Apellido:</label>
                       <asp:TextBox ID="Texapellido" runat="server" Class="form-control"></asp:TextBox>
                   </div>
                   <div class="col">
                       <label class="from-group">Mail:</label>
                       <asp:TextBox ID="TexMail" runat="server" Class="form-control"></asp:TextBox>
                   </div>
                   <div class="col">
                       <label class="from-group">Telefono:</label>
                       <asp:TextBox ID="Textelefono" runat="server" Class="form-control"></asp:TextBox>

                   </div>
                   <div class="col">
                       <label class="from-group">Direccion:</label>
                       <asp:TextBox ID="TexDireccion" runat="server" Class="form-control"></asp:TextBox>
                   </div>

                      <asp:Button ID="btnComprar" runat="server" OnClick="btnComprar_Click" Text="Comprar" CssClass="btn btn-success" />
               </div>
    </div>
</div>



</asp:Content>
