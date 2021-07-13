<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Ecommerce.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active" data-bs-interval="3000">
                <img src="img/motoBanner.jpg" class="d-block w-100" alt="...">
            </div>

            <div class="carousel-item" data-bs-interval="3000">
                <img src="img/SonyBanner.jpg" class="d-block w-100" alt="...">
            </div>

            <div class="carousel-item" data-bs-interval="3000">
                <img src="img/GalaxyBanner.jpg" class="d-block w-100 " alt="...">
            </div>
        </div>

        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>



    <br />


    <div style="margin: 10px 40px">
        <div class="container-fluid text-center">
            <h1> categorias destacadas </h1>
        </div>
        <div class="row pl-3">
            <%   int cont = 0;
                foreach (Dominio.Categoria item in listcat)
                {
                    if (cont < 3)
                    {%>
                  <div class="col-lg-4 col-md-6 text-center">
                      <div class="card text-center h-100" style="width: 18rem;">
                          <a class="navbar-brand" href="Catalogo.aspx?nomcat=<%=item.Nombre %>"><span>
                            <img src="<%=item.Imagen%>" alt="no hay imagen"/></span></a>
                           <h3 class="card-title"><b><%= item.Nombre %> </b></h3>
                      </div>
                  </div>
                    <% 
                        cont++;
                    }
                } %>
        </div>
    </div>

</asp:Content>
