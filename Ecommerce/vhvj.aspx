<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="vhvj.aspx.cs" Inherits="Ecommerce.FinalCompra" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="container">
                <div class="container">
                    <h3>Felicitaciones ha realizado la compra con exito</h3>
                    <div class="container">

                        <h3>este es el detalle de tu compra</h3>


                        <div class="col-12">
                            <table class="table table-hover">
                                <tr>
                                    <th scope="col">Nombre</th>
                                    <th scope="col">Precio</th>
                                    <th scope="col">Cantidad</th>
                                </tr>
                                <%foreach (Dominio.Cart item in listacompra)
                                    { %>
                                <tr>
                                    <td>
                                        <img src="<%=item.ImagenPro %>" alt="No hay imagen" width="100" height="100" /></td>
                                    <td><%=item.NombrePro %></td>
                                    <td><%=string.Format("{0:C}",item.Precio) %></td>
                                    <td><%=item.Cantidad%></td>

                                </tr>
                                <%}%>
                            </table>

                        </div>


                    </div>
                    <a href="Catalogo.aspx" class="btn btn-primary">Seguir navegando</a>
                </div>

            </div>
        </div>
    </form>
</body>
</html>
