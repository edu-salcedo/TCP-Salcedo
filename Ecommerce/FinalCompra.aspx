<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="FinalCompra.aspx.cs" Inherits="Ecommerce.FinalCompra1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


     <style>
        .titulo{
        
            font-size:2.5rem;
            font-family:Bahnschrift;
            color:brown;
        }
    </style>
    <div class="container  alert-secondary">
        <div class="text-center titulo">
           <p >Felicitaciones ha realizado la compra con exito</p>
        </div>

    </div>
    <div class="container form-control ">
        <hr/>

        <div class="text-center">
              
            <h3>Detalle de tu compra</h3>
            <hr />
        </div>

        <div class="row ">
            <div class="col-6 ps-4">
                 <asp:Label ID="lbnombre" runat="server" Text="Label"></asp:Label><br>     
                 <asp:Label ID="lbdireccion" runat="server" Text="Label"></asp:Label><br>
                 <asp:Label ID="lbtelefono" runat="server" Text="Label"></asp:Label><br>                

            </div>
            <div class="col-2">
                 <asp:Label ID="lbdni" runat="server" Text="fecha"></asp:Label><br>
            </div>
            <div class="col-4">
                 <asp:Label ID="lbfecha" runat="server" Text="dni"></asp:Label><br>
            </div>
        </div>
        <hr/>
        <asp:Label ID="lbtipopago" runat="server" Text="Label"></asp:Label><br>
        <hr/>
        <div class="container p-3">
            <div class="col-12 modal-content">
                <table class="table">
                    <tr class="alert-primary">
                        <th scope="col">Nombre</th>
                        <th scope="col">Precio Unitario</th>
                        <th scope="col">Cantidad</th>
                        <th scope="col">Subtotal</th>

                    </tr>
                    <%foreach (Dominio.Cart item in listacompra)
    
                        { %>
                    <tr>
                        <td><%=item.NombrePro %></td>
                        <td><%=string.Format("{0:C}",item.Precio) %></td>
                        <td><%=item.Cantidad%></td>
                        <td><%= string.Format("{0:C}",item.Cantidad*item.Precio) %> </td>
                    </tr>
                    <%}%>
                </table>
                </div>
          </div>
          <div class="text-end px-5 ">                
             <hr/>
                  <asp:Label ID="lbtotal" runat="server" Text=""></asp:Label><br>
             <hr/>

          </div>

</div>
        <div class="text-center m-4">
           <a href="Catalogo.aspx" class="btn btn-primary">Seguir navegando</a>
        </div>


</asp:Content>
