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
                        <a href="#" class="card-link btn btn-info">añadir al carrito
                        </a>
                    </div>
                </div>
            </div>

        </div>
    </div>


    <h3>Productos que te pueden interesar</h3>

    <div class="row mx-5">
    
        <%foreach (Dominio.Producto item in listaProducto)
          {%>
             <div class="col-lg col-3 col-md col-6 col-sm col-12 mb-3">
                        <div class="card text-center h-100" style="width: 13rem;">
                            <img src="<%=item.Imagen%>" alt="no hay imagen" />
                            <div class="card-body flex-column">
                                <h3 class="card-title"><b><%= item.Nombre %> </b></h3>
                                <h5 class="card-title"><%= item.marca %></h5>
                                <h5 class="card-title"><%= string.Format("{0:C}", item.Precio) %></h5>
                            </div>
                            <div class="d-grid gap-2 col-9 mx-auto">
                                <a href="Detalle.aspx?idArticulo=<%=item.Id.ToString() %>" class="btn btn-info">Detalle</a>
                                <%--no debe tener espacios  el href si no te manda error de objeto no instanciado--%>
                                <br />
                            </div>
                        </div>
                    </div>

        <%} %>
    </div>


</asp:Content>
