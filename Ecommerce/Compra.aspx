<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Compra.aspx.cs" Inherits="Ecommerce.Compra" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <style>
        .titulo {
            font-size: 3rem;
            text-align: center;
            font-family: 'Times New Roman', Times, serif;
            margin-bottom: 2rem;
        }

        .titulo2 {
            font-size: 2rem;
            text-align: center;
            font-family: 'Times New Roman', Times, serif;
            background-color: cadetblue;
            border-radius: 3px;
        }
    </style>

    <div class="container-fluid pt-3">
        <div class="row ">
            <div class="col-lg-4 col-md-12 mx-3 px-4 ">

                <div class="titulo2">
                    <p>Tus Datos</p>
                </div>

                <div class="col">
                    <asp:Label ID="lbnombre" runat="server" Text="Label"></asp:Label>
                    <asp:Label ID="lbapellido" runat="server" Text="Label"></asp:Label>
                </div>

                <div class="col">
                    <asp:Label ID="lbdni" runat="server" Text="Label"></asp:Label>
                </div>

                <div class="col">
                    <asp:Label ID="lbdireccion" runat="server" Text="Label"></asp:Label>
                </div>

                <div class="col">
                    <asp:Label ID="lbtelefono" runat="server" Text="Label"></asp:Label>
                </div>
                <div class="col">
                    <asp:Label ID="lbmail" runat="server" Text="Label"></asp:Label>
                </div>

                <div class="text-center py-3 ">
                    <a href="UpdateUser.aspx?iduser=<%=usuario.id%>" class="btn btn-warning">Editar Datos</a>
                </div>


            </div>


            <div class="col-lg-7 col-md-12 mx-3 px-4 ">
                <div class="titulo">
                    <p>Resumen de tu compra</p>
                </div>
                <table class="table table-hover">
                    <tr>
                        <th scope="col">Nombre</th>
                        <th scope="col">Precio</th>
                        <th scope="col">Cantidad</th>
                    </tr>
                    <%foreach (Dominio.Cart item in carrito)
                        { %>
                    <tr>
                        <%--      <td>
                      <img src="<%=item.ImagenPro %>" alt="No hay imagen" width="100" height="100" /></td>--%>
                        <td><%=item.NombrePro %></td>
                        <td><%=string.Format("{0:C}",item.Precio) %></td>
                        <td><%=item.Cantidad%></td>

                    </tr>
                    <%}%>
                </table>


            </div>
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="row">
                        <div class="col-lg-6 col-md-12 my-3">
                            <div>
                                <p class="text-center" style="font-size: 1.5rem;">metodos de pago</p>
                                <a class="navbar-brand" href="Compra.aspx?tipopago=1"><span>
                                    <img src="img/mercadopago.png" alt="no hay imagen" style="width: 6rem;" /></span></a>

                                <a class="navbar-brand" href="Compra.aspx?tipopago=2"><span>
                                    <img src="img/mastercard.png" alt="no hay imagen" style="width: 6rem;" /></span></a>

                                <a class="navbar-brand" href="Compra.aspx?tipopago=3"><span>
                                    <img src="img/visa.png" alt="no hay imagen" style="width: 6rem;" /></span></a>


                                <a class="navbar-brand" href="Compra.aspx?tipopago=4"><span>
                                    <img src="img/rapipago.png" alt="no hay imagen" style="width: 6rem;" /></span></a>

                            </div>
                        </div>

                        <div class="col-lg-6 col-md-12 my-5">
                            <div class="row">

                            <div class="col-6">
                                 <asp:Label ID="lbMetodopago" runat="server" Text="Metodo de pago : "></asp:Label>
                            </div>

                            <div class="col-6">
                                <asp:Button ID="btnComprar" runat="server" OnClick="btnComprar_Click" Text="Comprar" CssClass="btn btn-success" />
                            </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>


</asp:Content>
