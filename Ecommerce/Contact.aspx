<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Ecommerce.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row mb-5">

        <div class="col-4">
        </div>
        <div class="col-4">

            <div class="mb-3 px-5">
                <label for="exampleFormControlInput3" class="form-label">Nombre</label>
                <input type="email" class="form-control" id="exampleFormControlInput3" placeholder="name">
            </div>
            <div class="mb-3 px-5">
                <label for="exampleFormControlInput1" class="form-label">Email address</label>
                <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
            </div>
            <div class="mb-3 px-5">
                <label for="exampleFormControlInput2" class="form-label">telefono</label>
                <input type="email" class="form-control" id="exampleFormControlInput2" placeholder="telefono">
            </div>
            <div class="mb-3 px-5">
                <label for="exampleFormControlTextarea1" class="form-label">Consulta</label>
                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
            </div>
            <div class="text-center">

              <a  href="Contact.aspx" class="btn btn-info">enviar</a>
            </div>
        </div>

        <div class="col-4">
        </div>
    </div>

</asp:Content>
