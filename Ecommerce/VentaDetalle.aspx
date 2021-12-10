<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="VentaDetalle.aspx.cs" Inherits="Ecommerce.VentaDetalle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container text-center my-4">
         <h1> Detalle de la Venta</h1>

    </div>

       <div class="col m-5">
            <div class="container form-control " style="font-family: Bahnschrift;">
 
                <div class="row ">
                    <div class="col-4 ps-4">
                       <label class="btn-success"> Cliente</label>
                        <asp:Label ID="lbnombre" runat="server" Text="Label"></asp:Label><br>
                        <asp:Label ID="lbdireccion" runat="server" Text="Label"></asp:Label><br>
                        <asp:Label ID="lbtelefono" runat="server" Text="Label"></asp:Label><br>
                    </div>
                    <div class="col-3">
                        <asp:Label ID="lbdni" runat="server" Text=""></asp:Label><br>
                    </div>
                </div>

                 <div class="row">
                     <div class="col-6">
                       <asp:Label ID="lbtipopago" runat="server" Text=""></asp:Label><br>
                     </div>
                    <div class="col-6">
                        <asp:Label ID="lbfecha" runat="server" Text=""></asp:Label><br>
                    </div>

                 </div>
                <hr />
                <div class="container p-3">
                    <div class="col-12 modal-content">
                        <table class="table">
                            <tr class="alert-primary">
                                <th scope="col">Nombre</th>
                                <th scope="col">Precio Unitario</th>
                                <th scope="col">Cantidad</th>
                                <th scope="col">Subtotal</th>

                            </tr>
                            <%foreach (Dominio.Cart item in listacompra)

                                { %>
                            <tr>
                                <td><%=item.NombrePro %></td>
                                <td><%=string.Format("{0:C}",item.Precio) %></td>
                                <td><%=item.Cantidad%></td>
                                <td><%= string.Format("{0:C}",item.Cantidad*item.Precio) %> </td>
                            </tr>
                            <%}%>
                        </table>
                    </div>
                </div>
                <div class="text-end px-5 ">
                    <hr />
                    <asp:Label ID="lbtotal" runat="server" Text=""></asp:Label><br>
                    <hr />

                </div>
                <%if (ven.estado.Id != 5 && ven.estado.Id != 4)
                    {
                        %>
                <div class="col-6 py-4">
                    <label class="from-group">Estado</label>
                    <asp:DropDownList ID="ddestado" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>

                <asp:Button ID="btnestado" runat="server" OnClick="btnestado_Click"  OnClientClick="return confirm('quieres guardar los cambios?')" CssClass="btn btn-success" Text="Guardar cambios" />
       
                <%} %>

                          <%if (ven.estado.Nombre == "Cancelado")
                      { %>
                         <label class="alert-danger"> esta venta ha sido cancelada </label> 

                    <%} %>
                </div>
  </div>

  
</asp:Content>
