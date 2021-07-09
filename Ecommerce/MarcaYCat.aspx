<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="MarcaYCat.aspx.cs" Inherits="Ecommerce.MarcaYCat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container">


        <div class="row mt-5">
            <div class="col col-lg-4 col-md-6 col-sm-12 col border border-secondary border-2">
                 <div class="text-center">
                <h2>Categorias</h2>
                </div>
                <table class="table table-hover">
                    <%foreach (Dominio.Categoria item in liscat)
                        { %>
                    <tr>
                        <td><%=item.Nombre %></td>
                        <td><a class="btn btn-danger" href="MarcaYCat.aspx?idCancelar=<%= item.Id %>" role="button">Eliminar</a></td>
                        <td><a href="MarcaYCat.aspx?idcat=<%= item.Id %>" class="btn btn-primary btn lg">editar</a></td>
                    </tr>
                    <%}%>
                </table>
            </div>

            <div class="col col-lg-4 col-md-6 col-sm-12 col border border-secondary border-2 p-2">
                <div class="text-center">
                <h2>Marcas</h2>

                </div>
                <table class="table table-hover">
                    <%foreach (Dominio.Marca item in lismarca)
                        { %>
                    <tr>
                        <td><%=item.Nombre %></td>
                        <td><a class="btn btn-danger" href="MarcaYCat.aspx?idCancelar=<%= item.Id %>" role="button">Eliminar</a></td>
                        <td><a href="MarcaYCat.aspx?idMarca=<%= item.Id %>" class="btn btn-primary btn lg">editar</a></td>
                    </tr>
                    <%}%>
                </table>

            </div>

            <div class="col col-lg-4 col-md-6 col-sm-12 ">

                <%if (idcat > 0)
                    {%>
                    <div class="col">
                        <label class="from-group">Nombre:</label>
                        <asp:TextBox ID="texnom" runat="server" Class="form-control"></asp:TextBox>
                    </div>

                        <asp:UpdatePanel runat="server">
                        <ContentTemplate>

                            <asp:Label Text="Url:" runat="server" CssClass="label" />
                            <asp:TextBox runat="server" ID="TexImagen" CssClass="form-control" AutoPostBack="true" OnTextChanged="TexImagen_TextChanged" />
                            <div class="container">
                                <img src="<%=imagen%>" alt="" width="70%" />
                              </div>

                        </ContentTemplate>
                    </asp:UpdatePanel>

                <%}
                    else
                    {
                        if (idmarca > 0)
                        {%>
              
                    <div class="col">
                        <label class="from-group">Nombre:</label>
                        <asp:TextBox ID="texmarca" runat="server" Class="form-control"></asp:TextBox>
                    </div>

                <%}
                    else
                    {
                %>

                    <div class="container">
                    </div>
                <%}
                    }%>
                 <div class="container  text-center">
                    <br />
                    <asp:Button ID="BtnGuardar" runat="server" OnClick="BtnGuardar_Click" type="submit" CssClass="btn btn-info" Text="Guardar" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>
