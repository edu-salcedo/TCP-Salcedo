<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="Ecommerce.Registro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Style/UserStyle.css" rel="stylesheet" />
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Navbar</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" href="Default.aspx">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Catalogo.aspx">Productos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="Carrito.aspx" tabindex="-1" aria-disabled="true">Carrito</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>



    <form id="form1" runat="server">
        <div>
            <div class="modal-dialog text-center">
                <div class="col-sm-8 ">
                    <div class="modal-content p-5">
                        <div class="col-12 ">
                            <br />

                            <label class="from-group">Nombre de usuario:</label>
                            <div class="col-xs-11">
                                <asp:TextBox ID="txtUname" runat="server" Class="form-control" placeholder="Nombre de usuario"></asp:TextBox>
                                <asp:RequiredFieldValidator ErrorMessage="Campo requerido" ForeColor="Red" ControlToValidate="txtUname" runat="server" />
                                <asp:Label ID="lbError" runat="server" Text="" CssClass="d-flex align-items-center text-danger"></asp:Label>
                            </div>

                            <label class="from-group">Contraseña:</label>
                            <div class="col-xs-11">
                                <asp:TextBox ID="txtPass" runat="server" TextMode="Password" Class="form-control" placeholder=" Contraseña"></asp:TextBox>
                                <asp:RequiredFieldValidator ErrorMessage="Campo requerido" ForeColor="Red" ControlToValidate="txtPass" runat="server" />
                            </div>

                            <label class="from-group">Nombre:</label>
                            <div class="col-xs-11">
                                <asp:TextBox ID="txtName" runat="server" Class="form-control" placeholder="Ingrese nombre"></asp:TextBox>
                                <asp:RequiredFieldValidator ErrorMessage="Campo requerido" ForeColor="Red" ControlToValidate="txtName" runat="server" />
                            </div>

                            <label class="from-group">Apellido:</label>
                            <div class="col-xs-11">
                                <asp:TextBox ID="txtApellido" runat="server" Class="form-control" placeholder="Apellido"></asp:TextBox>
                                <asp:RequiredFieldValidator ErrorMessage="Campo requerido" ForeColor="Red" ControlToValidate="txtApellido" runat="server" />
                            </div>

                            <label class="from-group">Email:</label>
                            <div class="col-xs-11">
                                <asp:TextBox ID="txtMail" runat="server" Class="form-control" placeholder="Correo"></asp:TextBox>
                                <asp:RequiredFieldValidator ErrorMessage="Campo requerido" ForeColor="Red" ControlToValidate="txtMail" runat="server" />
                                <asp:Label ID="lberrormail" runat="server" Text="" CssClass="d-flex align-items-center text-danger"></asp:Label>
                            </div>

                            <label class="from-group">DNI:</label>
                            <div class="col-xs-11">
                                <asp:TextBox ID="txtDNI" runat="server" Class="form-control" placeholder="DNI"></asp:TextBox>
                                <asp:RequiredFieldValidator ErrorMessage="Campo requerido" ForeColor="Red" ControlToValidate="txtDNI" runat="server" />
                            </div>
                            <label class="from-group">Telefono:</label>
                            <div class="col-xs-11">
                                <asp:TextBox ID="txtfone" runat="server" Class="form-control" placeholder="Telefono"></asp:TextBox>
                                <asp:RequiredFieldValidator ErrorMessage="Campo requerido" ForeColor="Red" ControlToValidate="txtfone" runat="server" />
                            </div>
                            <label class="from-group">Direccion:</label>
                            <div class="col-xs-11">
                                <asp:TextBox ID="txtAdress" runat="server" Class="form-control" placeholder="Direccion"></asp:TextBox>
                                <asp:RequiredFieldValidator ErrorMessage="Campo requerido" ForeColor="Red" ControlToValidate="txtAdress" runat="server" />
                            </div>

                            <label class="from-group"></label>
                            <div class="col-xs-11">
                                <asp:Button ID="btnregistrar" CssClass="btn btn-dark" OnClick="btnregistrar_Click" runat="server" Text="Registrarse" />
                                <hr />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
</body>
</html>
