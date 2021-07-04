<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Ecommerce.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container text-center my-5">
        <div class="row ">
            <div class="col-lg-4">

            </div>
            <div class="col-lg-4 col-sm-12 ">
               <img src="img/user.png" width="200" alt="" />
                <div class="mb-4">
                    <label for="ususario" class="form-label">Usuario</label>
                    <input type="email" class="form-control" name="user" />
                </div>
                 <div class="mb-4">
                    <label for="Password" class="form-label">Password</label>
                    <input type="Password" class="form-control" name="Password" />
                </div>
                 <div class="d-grid">
                    <button type="submit" class="btn btn-primary">Iniciar sesion</button>
                </div>

                <div class="my3">
                    <span>No te nes cuenta?<a href="Registro.aspx">Registrate</a></span> 
                </div>
            </div>
            <div class="col-lg-4 col-sm-12">

            </div>
        </div>

    </div>






</asp:Content>
