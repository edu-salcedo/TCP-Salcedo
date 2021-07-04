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

    <div class="container-fluid bg-warning text-center">

      <a href="Default.aspx"><span ><img src="img/logo.png" alt="" height ="80"/></span></a>
    </div>

    <form id="form1" runat="server">
        <div>
             <div class ="modal-dialog text-center">
             <div class ="col-sm-8 ">
             <div class ="modal-content p-5">
                 <div class="col-12 ">
                     <br />
                        <label class="from-group">Nombre de usuario:</label>
                        <div class="col-xs-11">
                        <asp:TextBox ID="txtUname" runat="server" Class="form-control" placeholder="Nombre de usuario"></asp:TextBox>
                        </div>
                                       
                        <label class="from-group">Contraseña:</label>
                        <div class="col-xs-11">
                        <asp:TextBox ID="txtPass" runat="server" TextMode="Password" Class="form-control" placeholder=" Contraseña"></asp:TextBox>
                        </div>
                      
                        <label class="from-group">Nombre:</label>
                        <div class="col-xs-11">
                        <asp:TextBox ID="txtName" runat="server" Class="form-control" placeholder="Ingrese nombre"></asp:TextBox>
                        </div>

                        <label class="from-group">Apellido:</label>
                        <div class="col-xs-11">
                        <asp:TextBox ID="txtApellido" runat="server" Class="form-control" placeholder="Apellido"></asp:TextBox>
                        </div>
                      
                        <label class="from-group">Email:</label>
                        <div class="col-xs-11">
                        <asp:TextBox ID="txtMail" runat="server" Class="form-control" placeholder="Correo"></asp:TextBox>
                        </div>
                      
                        <label class="from-group">DNI:</label>
                        <div class="col-xs-11">
                        <asp:TextBox ID="txtDNI" runat="server" Class="form-control" placeholder="DNI"></asp:TextBox>
                        </div>
                     <label class="from-group">Telefono:</label>
                        <div class="col-xs-11">
                        <asp:TextBox ID="txtfone" runat="server" Class="form-control" placeholder="Telefono"></asp:TextBox>
                        </div>
                     <label class="from-group"> Direccion:</label>
                        <div class="col-xs-11">
                        <asp:TextBox ID="txtAdress" runat="server" Class="form-control" placeholder="Direccion"></asp:TextBox>
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
