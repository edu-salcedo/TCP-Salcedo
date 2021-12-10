<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UpdateProducto.aspx.cs" Inherits="Ecommerce.UpdateProducto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <br />


    <div class="container ">
        <div class="row">
            <div class="col-8">
                <div class="col-md-8">
                    <asp:Label Text="Nombre:" runat="server" CssClass="label" />
                    <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
                    <asp:RequiredFieldValidator ErrorMessage="Campo requerido" ForeColor="Red" ControlToValidate="txtNombre" runat="server" />
                    <%--<asp:RegularExpressionValidator ErrorMessage="ingresar solo letras" ForeColor="Red" ControlToValidate="txtNombre" runat="server" ValidationExpression="^[a-zA-Z ]*$" />--%>
                </div>

                <div class="col-md-8">
                    <asp:Label Text="Descripción:" runat="server" class="from-group" />
                    <asp:TextBox runat="server" ID="txtDescripcion" CssClass="form-control" />
                    <asp:RequiredFieldValidator ErrorMessage="Campo requerido" ForeColor="Red" ControlToValidate="txtDescripcion" runat="server" />
                   
                </div>

                <div class="col-md-8">
                    <label class="from-group">Marca</label>
                    <asp:DropDownList ID="ddMarca" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>

                <div class="col-md-8 mt-3">
                    <label class="from-group">Categoria</label>
                    <asp:DropDownList ID="ddCat" runat="server" CssClass="form-control"></asp:DropDownList>

                </div>


                <div class="col-md-8 mt-3">
                    <asp:Label Text="Precio:" runat="server" CssClass="from-group" />
                    <asp:TextBox runat="server" ID="txtPrecio" CssClass="form-control" />
                    <asp:RequiredFieldValidator ErrorMessage="Campo requerido" ForeColor="Red" ControlToValidate="txtPrecio" runat="server" />
                    <asp:RegularExpressionValidator ErrorMessage="este campo solo acepta numeros" ForeColor="Red" ControlToValidate="txtPrecio" runat="server" ValidationExpression="^[0-9]{0,10}$" />

                </div>

                <div class="col-md-8">
                    <asp:Label Text="Stock:" runat="server" CssClass="from-group" />
                    <asp:TextBox runat="server" ID="txtStock" CssClass="form-control" />
                    <asp:RequiredFieldValidator ErrorMessage="Campo requerido" ForeColor="Red" ControlToValidate="txtStock" runat="server" />
                    <asp:RegularExpressionValidator ErrorMessage="este campo solo acepta numeros" ForeColor="Red" ControlToValidate="txtStock" runat="server" ValidationExpression="^[0-9]{0,10}$" />
                </div>
                <%--fin col8  --%>
            </div>

            <div class="col-4">
                <div>
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>

                            <asp:Label Text="Url:" runat="server" CssClass="label" />
                            <asp:TextBox runat="server" ID="txtUrl" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtUrl_TextChanged" />
                            <div class="container">
                                <img src="<%=imagen%>" alt="" width="90%" />
                              </div>

                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:Label ID="lbstring" runat="server" CssClass="alert alert-danger" Visible="false" Text=""></asp:Label>
                </div>
                <div class="container  text-center">
                    <br />
                    <asp:Button ID="Button1" runat="server" OnClick="btnGuardar_Click" OnClientClick="return confirm('Desea editar el articulo?')" type="submit" CssClass="btn btn-info" Text="Guardar" />
                      <a href="Productos.aspx" class="btn btn-success"><i class="bi bi-cart4"></i>Volver</a>
                                         
                </div>

            </div>

        </div>
    </div>
</asp:Content>







