<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="Ecommerce.Carrito" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Style/CarroStyle.css" rel="stylesheet" />
    <link href="Style/UserStyle.css" rel="stylesheet" />
</head>
<body>

    <div class="container-fluid bg-dark">
        <div class="container">
            <nav class="navbar navbar-expand-md navbar-dark">
                <a class="navbar-brand" href="Default.aspx"><span>
                    <img src="img/logo.png" alt="" height="60" />ALLFinder</span></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mx-auto ">
                        <li>
                            <a class="nav-link mx-5" href="Catalogo.aspx"><span>Productos</span></a>
                        </li>
                        <li>
                            <a class="nav-link mx-5" href="Contact.aspx">Contactanos</a>
                        </li>
                        <li>
                            <a class="nav-link mx-5" href="Login.aspx">Iniciar Sesióm</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
    <div class="container mt-5">
        <div class="row mt-3">
            <div class="col-12 col-md-8  ">
                <table class="table table-hover table-striped">
                    <tr>
                        <th scope="col"></th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Precio</th>
                        <th scope="col">Cantidad </th>
                        <th scope="col"></th>
                        <th scope="col"></th>
                    </tr>
                    <%foreach (Dominio.Cart item in carrito)
                        { %>
                    <tr>
                        <td> <img src="<%=item.ImagenPro %>" alt="No hay imagen" width="100" height="100" /></td>
                        <td><%=item.NombrePro %></td>
                        <td><%=string.Format("{0:C}",item.Precio) %></td>
                        <td><%=item.Cantidad %></td>
                        <td>
                            <a class="btn btn-primary" href="Carrito.aspx?idmenos=<%= item.IdProducto %>" role="button">-</a>
                            <a class="btn btn-primary" href="Carrito.aspx?idmas=<%= item.IdProducto %>" role="button">+</a>
                        </td>
                        <td><a class="btn btn-warning" href="Carrito.aspx?idCancelar=<%= item.IdProducto %>" role="button">Cancelar</a></td>

                    </tr>
                    <%}%>
                </table>
            </div>
            <div class="col-12 col-md-4 bg-light">
                <div class="container ">
                    <br />
                    <h3>Resumen de tu orden</h3>
                    <br />
                    <asp:Label ID="Label1" runat="server" Text="Subtotal    "></asp:Label>
                    <asp:Label ID="lbtotal" runat="server" Text=""></asp:Label>
                </div>
                <div class="text-center mt-5">
                    <a href="Compra.aspx" class="btn btn-primary btn lg">Comprar</a>
                </div>
            </div>
        </div>
    </div>

    <div class="container text-center">
        <a href="Catalogo.aspx" class="btn btn-success btn lg">Ver mas Articulos</a>
    </div>
</body>
</html>
