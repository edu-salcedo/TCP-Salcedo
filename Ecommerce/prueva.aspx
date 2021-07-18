<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="prueva.aspx.cs" Inherits="Ecommerce.prueva" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>EdCOmerce</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,400;1,500&display=swap" rel="stylesheet">
    <link href="Style/Styles.css" rel="stylesheet" />
    <link href="Style/SiteStyle.css" rel="stylesheet" />
</head>
<body>

     <style>
        .titulo{
        
            font-size:2.5rem;
            font-family:Bahnschrift;
            color:brown;
        }
    </style>
    <div class="container  alert-secondary">
        <div class="text-center titulo">
           <p >Felicitaciones ha realizado la compra con exito</p>
        </div>

    </div>
    <div class="container form-control ">
        <hr/>

        <div class="row ">
            <div class="col-6 ps-4">
                 <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label><br>     
                 <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label><br>
                 <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label><br>

            </div>
            <div class="col-3">
                 <asp:Label ID="Label7" runat="server" Text="dni"></asp:Label><br>
            </div>
            <div class="col-3">
                 <asp:Label ID="Label8" runat="server" Text="fecha"></asp:Label><br>
            </div>
        </div>
        <hr/>
        <asp:Label ID="Label4" runat="server" Text="Metodo de pago"></asp:Label><br>
        <hr/>
        <div class="container p-3">
            <div class="col-12 modal-content">
                <table class="table">
                    <tr class="alert-primary">
                        <th scope="col">Nombre</th>
                        <th scope="col">Precio Unitario</th>
                        <th scope="col">Cantidad</th>
                        <th scope="col">Subtotal</th>
                    </tr>
                    <%for (int i=0;i<3;i++)
    
                        { %>
                    <tr>
                        <td> hola</td>
                        <td>hola2</td>
                        <td>hola3</td>
                        <td>300</td>
                    </tr>
                    <%}%>
                </table>
                </div>
          </div>
          <div class="text-end px-5 ">                
              <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label><br>
           
             <hr/>
                  <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label><br>
             <hr/>

          </div>

</div>
        <div class="text-center m-4">
           <a href="Catalogo.aspx" class="btn btn-primary">Seguir navegando</a>
        </div>




    <script src="Scripts/bootstrap.bundle.min.js"></script>
</body>
</html>
