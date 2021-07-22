<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetalleCompra.aspx.cs" Inherits="Ecommerce.DetalleCompra" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <asp:ContentPlaceHolder ID="head" runat="server">
    </asp:ContentPlaceHolder>
    <title>EdCOmerce</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,400;1,500&display=swap" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <div class="container  alert-secondary my-5">
        <div class="text-center titulo">
           <p >Felicitaciones ha realizado la compra con exito</p>
        </div>

    </div>
    <div class="container form-control "style="font-family:Bahnschrift;">
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
        <div class="text-center my-5">
           <a href="Catalogo.aspx" class="btn btn-primary">Seguir navegando</a>
        </div>


        </div>
    </form>
</body>
</html>
