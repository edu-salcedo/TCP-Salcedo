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

      <div class="container mt-4">
          <div class="row text-center">
              <div class="col-lg-4 col-md-6 col-sm-12">
                 <img src="https://images.fravega.com/s250/e1845d91c77f353b58d9af2c87af4b39.png"style="height:15rem; width:15rem;" alt="...">
                  
                  <h1>Televisores</h1>
                  </div>
                <div class="col-lg-4 col-md-6 col-sm-12">
                    <img src="https://images.fravega.com/s250/0bd4ff058e0ec5e7e2c27810a7bccc78.png"style="height:15rem; width:15rem;" alt="...">
                    
                    <h1>Lavaropas</h1>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-12" >
                   <img src="https://images.fravega.com/s250/d0d1523c0007261e84635068a4bbad63.png"style="height:15rem; width:15rem;" alt="...">
                  
                    <h1>Celulares</h1>
                    
                </div>
          </div>
      </div>
      <br />    

</asp:Content>
