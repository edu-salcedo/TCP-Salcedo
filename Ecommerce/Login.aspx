<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Ecommerce.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container text-center my-5 ">
        <div class="row ">
            <div class="col-lg-4">

            </div>
            <div class="col-lg-4 col-sm-12 ">
               <img src="img/user.png" width="200" alt="" />
             
                <div class="mb-4 text-center">
                     <asp:Label Text="Usuario" runat="server" CssClass="from-group" />
                    <asp:TextBox runat="server" ID="txtUser" CssClass="form-control" />
                    <asp:RequiredFieldValidator ErrorMessage="ingrese un usuario" CssClass="alert-danger"  ControlToValidate="txtUser" runat="server" />
                </div>
                 <div class="mb-4">
                     <asp:Label Text="Contrasena" runat="server" CssClass="from-group" />
                     <asp:TextBox runat="server" ID="txtPass" TextMode="Password" CssClass="form-control" />
                     <asp:RequiredFieldValidator ErrorMessage="ingrese una contraseña" CssClass="alert-danger d-flex"  ControlToValidate="txtPass" runat="server" />
                </div>

                <asp:Label ID="lbErrorIngresar" runat="server" CssClass="alert-danger" Text=""></asp:Label>
                <div class="d-grid">
                <asp:Button ID="btnIngresar" runat="server" OnClick="btnIngresar_Click1" Text="Ingresar" CssClass="btn btn-primary my2" />
                </div>
                <div class="my3">
                    <span>No te nes cuenta?<a href="Registro.aspx">Registrate</a></span> 
                </div>
            </div>
            <div class="col-lg-4 col-sm-12">
                 <button class="btn btn-primary" href="Catalogo.aspx" type="submit">Submit form</button>
            </div>
        </div>

    </div>


</asp:Content>
