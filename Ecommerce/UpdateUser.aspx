<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UpdateUser.aspx.cs" Inherits="Ecommerce.UpdateUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="modal-dialog">

            <div class="container modal-content px-5"> 
                   <div class="col pt-5">
                       <label class="from-group">Nombre de usuario:</label>
                       <asp:TextBox ID="texUname" runat="server" Class="form-control"></asp:TextBox>
                   </div>
                   <div class="col">
                       <label class="from-group">Nombre:</label>
                       <asp:TextBox ID="Texnombre" runat="server" Class="form-control"></asp:TextBox>
                   </div>
                   <div class="col">
                       <label class="from-group">Apellido:</label>
                       <asp:TextBox ID="Texapellido" runat="server" Class="form-control"></asp:TextBox>
                   </div>
                   <div class="col">
                       <label class="from-group">DNI</label>
                       <asp:TextBox ID="Textdni" runat="server" Class="form-control"></asp:TextBox>
                   </div>
                   <div class="col">
                       <label class="from-group">Mail:</label>
                       <asp:TextBox ID="TexMail" runat="server" Class="form-control"></asp:TextBox>
                   </div>
                   <div class="col">
                       <label class="from-group">Telefono:</label>
                       <asp:TextBox ID="Textelefono" runat="server" Class="form-control"></asp:TextBox>
                   </div>
                   <div class="col pb-5">
                       <label class="from-group">Direccion:</label>
                       <asp:TextBox ID="TexDireccion" runat="server" Class="form-control"></asp:TextBox>
                   </div>
                      <asp:Button ID="btnGuardar" class="btn btn-success" OnClick="btnGuardar_Click" runat="server" Text="Guardar cambios" />
                        <br />
               </div>
    </div>
</asp:Content>
