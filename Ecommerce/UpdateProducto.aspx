<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UpdateProducto.aspx.cs" Inherits="Ecommerce.UpdateProducto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />

 
    <div class="container ">
        <div class="row">
            <div class="col-8">
                <div class="col-md-8">
                    <label for="validationServer01" class="form-label">Nombre</label>
                    <input type="text" class="form-control is-valid" id="validationServer01" value="" required>
                </div>
                <div class="col-md-8">
                    <label for="validationServer02" class="form-label">Descripcion</label>
                    <input type="text" class="form-control is-valid" id="validationServer02" value="" required>
                </div>
                <div class="col-md-8">
                    <label for="validationServer01" class="form-label">Marca</label>
                    <input type="text" class="form-control is-valid" id="validationServer03" value="" required>
                </div>
                <div class="col-md-8">
                    <label for="validationServer02" class="form-label">Categoria</label>
                    <input type="text" class="form-control is-valid" id="validationServer04" value="ingrese categoria" required>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Campo requerido" ControlToValidate="txtNombre"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="RegularExpressionValidator"></asp:RegularExpressionValidator>
                </div>
                <div class="col-12">
                    <br />
                    <button class="btn btn-primary" type="submit">Submit form </button>

                </div>
            </div>

             <div>
     
            <div class="col-4 text-center">
                <div class="container border-1 bg-secondary ">
                    <h1>Aqui va ha ir la aimagen</h1>
                    <h1>del producto</h1>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
