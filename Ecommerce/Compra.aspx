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
         .letra{
           color:saddlebrown;
           font-size:1.2rem;
           
        }
        

    </style>

    <div class="container-fluid p-3 ">
        <div class="row ">
            <div class="col-lg-4 col-md-12 mx-3 mx-4  ">

                <div class="titulo2">
                    <p>Tus Datos</p>
                </div>

                <div class="col my-3">
                    <label class="letra">Nombre : </label>
                    <asp:Label ID="lbnombre" runat="server" Text="Label"></asp:Label>
                    <asp:Label ID="lbapellido" runat="server" Text="Label"></asp:Label>
                </div>

                <div class="col">
                    <label class="letra">DNI : </label>
                    <asp:Label ID="lbdni" runat="server" Text="Label"></asp:Label>
                </div>

                <div class="col my-3">
                    <label class="letra">Direccion : </label>
                    <asp:Label ID="lbdireccion" runat="server" Text="Label"></asp:Label>
                </div>

                <div class="col">
                    <label class="letra">Telefono : </label>
                    <asp:Label ID="lbtelefono" runat="server" Text="Label"></asp:Label>
                </div>
                <div class="col my-3">
                    <label class="letra">Correo : </label>
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


                            <div class="col-6 py-4">
                                <label class="from-group">Tipo Pago</label>
                                <asp:DropDownList ID="ddPago" runat="server" CssClass="form-control"></asp:DropDownList>
                            </div>

                            <div class="col text-center p-4">
                                <asp:Button ID="btnComprar" runat="server" OnClick="btnComprar_Click" OnClientClick="return confirm('esta seguro de realizar la compra?')" Text="Comprar" CssClass="btn btn-success" />
                            </div>
                      

            </div>

        </div>
    </div>


</asp:Content>
