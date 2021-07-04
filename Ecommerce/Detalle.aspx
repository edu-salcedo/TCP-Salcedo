<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Detalle.aspx.cs" Inherits="Ecommerce.Detalle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container p-5 align-items-center ">
        <div class="row">
            <div class="col-12 col-md-6 ">
                <div class="card" style="width: 18rem;">
                    <img src="<%=Prodetalle.Imagen%>" alt="no hay imagen" style="width:400px; height:400px;"/>

                </div>

            </div>
            <div class="col-6 p-4">
                <div class="container">
                    <div class="card-body">
                        <h5 class="card-title"><%=Prodetalle.Nombre %></h5>
                        <h6 class="card-subtitle mb-2 text-muted"><%=Prodetalle.marca %></h6>
                        <h6 class="card-subtitle mb-2 text-muted"><%=Prodetalle.categoria %></h6>
                        <h6 class="card-subtitle mb-2 text-muted"><%=Prodetalle.Descripcion%></h6>
                        <a href="#" class="card-link">Another link</a>
                    </div>
                </div>
            </div>

        </div>
    </div>


</asp:Content>
