<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetalleCompra.aspx.cs" Inherits="Ecommerce.DetalleCompra" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>EdCOmerce</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,400;1,500&display=swap" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
        <div class="row py-5 bg-secondary">
            <div class="col-lg-3 col-md-2 col-sm-1">
                <div class="text-center titulo">
              </div>

            </div>

            <div class="col-lg-6 col-md-8 col-sm-12">
            <div class="container form-control " style="font-family: Bahnschrift;">
                <hr />

                <div class="text-center">

                    <h3>Detalle de tu compra</h3>
                    <hr />
                </div>
              <%if (usuario.tipo == 1)
                  {%>
                <div class="row ">
                    <div class="col-4 ps-4">
                        <asp:Label ID="lbnombre" runat="server" Text="Label"></asp:Label><br>
                        <asp:Label ID="lbdireccion" runat="server" Text="Label"></asp:Label><br>
                        <asp:Label ID="lbtelefono" runat="server" Text="Label"></asp:Label><br>
                    </div>
                    <div class="col-3">
                        <asp:Label ID="lbdni" runat="server" Text=""></asp:Label><br>
                    </div>
                </div>
                <%}%>
                 <div class="row">
                     <div class="col-6">
                       <asp:Label ID="lbtipopago" runat="server" Text=""></asp:Label><br>
                     </div>
                    <div class="col-6">
                        <asp:Label ID="lbfecha" runat="server" Text=""></asp:Label><br>
                    </div>

                 </div>
                <hr />
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
                    <hr />
                    <asp:Label ID="lbtotal" runat="server" Text=""></asp:Label><br>
                    <hr />

                </div>

            </div>
            <div class="text-center  my-5">
                <a href="Catalogo.aspx" class="btn btn-primary">Seguir navegando</a>
                <a href="VistaClientes.aspx" class="btn btn-primary mx-3">Todas mis Compras</a>
            </div>

         </div>
            <div class="col-lg-3 col-md-2 col-sm-1">
                <div class="text-center titulo">
              </div>

            </div>
        </div>
    </form>
</body>
</html>
