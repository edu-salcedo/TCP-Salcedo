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
    <link href="Style/SiteStyle.css" rel="stylesheet" />

</head>
<body>


    <nav class="navbar navbar-expand-lg navbar-dark bg-dark ">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <a class="navbar-brand" href="Default.aspx"><span>
                <img src="img/logo.png" alt="" height="50" />ALLFinder</span></a>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
                    <li class="nav-item me-auto">
                        <a class="nav-link" href="Catalogo.aspx">Catalogo</a>
                    </li>
                    <li class="nav-item mx-4 ">
                        <a class="nav-link" href="Contact.aspx">Contact</a>
                    </li>

                    <li>
                         <a class="nav-link"  id="misdatos" href="UpdateUser.aspx" runat="server">Mis Datos</a>
                    </li>
                </ul>
                 <a class="navbar-brand" id="Micompra" href="VistaClientes.aspx" runat="server">Mis Compras</a>

            </div>
        </div>
    </nav>



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


                        <div class="text-center mt-5">
                            <h1 class="font-italic">estado de tu compra</h1>
                        </div>
                    </div>

                    <%if (ven.estado.Nombre == "En preparacion")
                        { %>
                    <div class="fa1">

                        <div class="cuadrado">
                        </div>
                    </div>

                    <%} %>
                     <%if (ven.estado.Nombre == "En Camino")
                        { %>
                    <div class="fa2">

                        <div class="cuadrado">
                        </div>
                    </div>

                    <%} %>
                     <%if (ven.estado.Nombre == "Entregado")
                        { %>
                    <div class="fa3">

                        <div class="cuadrado">
                        </div>
                    </div>

                    <%} %>


                    <%if (ven.estado.Nombre == "recibido")
                        { %>
                           <div class="text-center">
                             <h1 class="text-success">Recibido</h1>
                          </div>
                    <%}
                     else if (ven.estado.Nombre == "Cancelado")
                        { %>
                           <div class="text-center">
                             <h1 class="text-danger">esta compra fue Cancelada</h1>
                          </div>
                    <%}
                     else
                     {%>
                         <div class="row text-center">
                            <div class="col">
                                <h1>en preparacion</h1>
                            </div>
                            <div class="col">
                                <h1>en camino</h1>
                            </div>
                            <div class="col">
                                <h1>entregado</h1>
                            </div>
                        </div>
                    <%} %>

                    <%if (ven.estado.Nombre != "Entregado" && ven.estado.Nombre != "Cancelado" && ven.estado.Nombre!="recibido")
                        { %>
                    <asp:Button ID="btnCancelar" runat="server" OnClick="btnCancelar_Click" OnClientClick="return confirm('seguro que quiere cancelar su compra?')" Text="Cancelar compra" CssClass="btn btn-danger my" />

                    <%} %>

                    <% if (ven.estado.Nombre == "Entregado")
                        { %>
                    <div class="m-3">
                        <label class="alert-dark mx-2">nos dijeron que recibiste la compra </label>
                        <a class="btn btn-success" href="VistaClientes.aspx?Aceptarcompra=<%=ven.Id %>" onclick="return confirm('seguro que recibio su compra?')" role="button">si recibi la compra</a>
                        <a class="btn btn-danger" href="VistaClientes.aspx?Cancelarcompra=<%=ven.Id %>" onclick="return confirm('seguro que no recibio la compra?')" role="button">no recibi la compra</a>
                    </div>
                    <%} %>
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
