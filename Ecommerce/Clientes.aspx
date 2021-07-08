<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="Ecommerce.Clinetes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row pt-3">
            <div class="col-12 col-md-8  p-4">
                <table class="table table-hover">
                    <tr>
                        <th scope="col">Usuario</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Email</th>
                        <th scope="col"></th>
                    </tr>
                    <%foreach (Dominio.User item in listaUsuario)
                        { %>
                    <tr>
                        <td><%=item.Usuario %></td>
                        <td><%=item.Nombre %></td>
                        <td><%=item.mail %></td>
                        <td><a href="Clientes.aspx?idCli=<%=item.id.ToString() %>" class="btn btn-primary btn lg">mas info</a></td>
                       
                    </tr>
                    <%}%>
                </table>
            </div>

            <%if (iduser > 0)
                {%>
               <div class="col-12 col-md-4"> 
                   <div class="col">
                       <label class="from-group">Nombre de usuario:</label>
                       <asp:TextBox ID="texUname" runat="server" Class="form-control"></asp:TextBox>
                   </div>
                   <div class="col">
                       <label class="from-group">Nombre:</label>
                       <asp:TextBox ID="Texnombre" runat="server" Class="form-control"></asp:TextBox>
                   </div>
                   <div class="col">
                       <label class="from-group">Apellido:</label>
                       <asp:TextBox ID="Texapellido" runat="server" Class="form-control"></asp:TextBox>
                   </div>
                   <div class="col">
                       <label class="from-group">Mail:</label>
                       <asp:TextBox ID="TexMail" runat="server" Class="form-control"></asp:TextBox>
                   </div>
                   <div class="col">
                       <label class="from-group">Telefono:</label>
                       <asp:TextBox ID="Textelefono" runat="server" Class="form-control"></asp:TextBox>

                   </div>
                   <div class="col">
                       <label class="from-group">Direccion:</label>
                       <asp:TextBox ID="TexDireccion" runat="server" Class="form-control"></asp:TextBox>
                   </div>
               </div>
            <%}
                else
                {
                %>
                  <div class="col-12 col-md-4">
                      <div class="container">
                          <hr />
                          <h3>aqui se vera la informacion detallada del cliete seleccionado </h3>
                          <hr />
                      </div>
               
                  </div>
              <%} %>
        </div>

    </div>
</asp:Content>
