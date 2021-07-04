<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="Ecommerce.Carrito" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="Default.aspx">Navbar</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
        </div>
    </nav>
<div class="container">
     <div class="row pt-3">
        <div class="col-12 col-md-8  ">
             <table class="table table-hover table-striped">          
            <tr>
                <th scope="col"> </th>
                <th scope="col">Nombre</th>
                <th scope="col">Precio</th> 

                <th scope="col"></th>
            </tr>         
         <%foreach(Dominio.Producto item in carritoCompra)
          { %>              
               <tr> 
                   <td><img src="<%=item.Imagen %>" alt="No hay imagen" width="100" height="100"/></td>
                   
                   <td><%=item.Nombre %></td>
                   <td><%=string.Format("{0:C}",item.Precio) %></td>
                   <td><a class="btn btn-warning" href="Carrito.aspx?idCancelar=<%= item.Id %>" role="button">Cancelar</a></td> 
       
              </tr>             
        <%}%>
     </table>
        </div>
        <div class="col-12 col-md-4">
            <div class="container">
                <hr />
                <h3> El Precio total de tu compra es</h3>
                <hr />
                <asp:Label ID="lbtotal" runat="server" Text=""></asp:Label>
                <a href="Default.aspx" class ="btn btn-success btn lg" >Ver mas Articulos</a>
            </div>

        </div>      
    </div>


</div>
</body>
</html>
