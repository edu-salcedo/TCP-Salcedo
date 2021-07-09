<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="Ecommerce.Error" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Error</title>
        <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <style>
        .contenedor{
            background-color:burlywood;
            text-align:center;
            border-radius:10px;
            font-size:30px;
            font-family:'Goudy Old Style';

        }
    </style>


    <form id="form1" runat="server">
        <div class="container p-5"> 
            <div class="container m-5 p-lg-5">
               <div class="contenedor">
                <h1 >  algo salio mal pero </h1>
                 <h1>estamos trabajando en ello</h1>
               <a href="Default.aspx">Pagina Principal</a>
               </div>
            </div>

        </div>
    </form>
     <script src="Scripts/bootstrap.bundle.min.js"></script>
</body>
</html>
