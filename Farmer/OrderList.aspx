<%@ Page Title="" Language="C#" MasterPageFile="~/Farmer/Farmer.master" AutoEventWireup="true" CodeFile="OrderList.aspx.cs" Inherits="Farmer_OrderList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <form id="form1" runat="server">
<table style="width:100%;">
        <tr>
            <td colspan="2">
                <h2 class="title">
                    My Orders</h2>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataSourceID="order_sds" CellPadding="2" 
                    CellSpacing="2" Width="100%" EmptyDataText="Your Cart is Empty" 
                    HorizontalAlign="Center" DataKeyNames="orderid">
                    <Columns>
                        
                        <asp:BoundField DataField="orderid" HeaderText="Order Id" 
                            SortExpression="orderid" InsertVisible="False" ReadOnly="True" />
                       
                        <asp:BoundField DataField="orderdetailid" HeaderText="Order Detils Id" 
                            SortExpression="orderdetailid" InsertVisible="False" ReadOnly="True" />
                        <asp:BoundField DataField="productid" HeaderText="Product Id" 
                            SortExpression="productid" />
                        
                        <asp:BoundField DataField="productname" HeaderText="Product Name" 
                            SortExpression="productname"  />
                        <asp:BoundField DataField="orderdate" HeaderText="Order Date" 
                            SortExpression="orderdate" />
                        <asp:BoundField DataField="ordertotal" HeaderText="Order Total" 
                            SortExpression="ordertotal" />
                    </Columns>
                    <HeaderStyle BackColor="#1A596A" Font-Bold="True" ForeColor="White" 
                        Height="30px" />
                    <PagerSettings Mode="NumericFirstLast" />
                    <PagerStyle Font-Bold="True" Font-Size="12pt" HorizontalAlign="Center" 
                        VerticalAlign="Middle" />
                    <RowStyle BackColor="#DDF1F7" HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:SqlDataSource ID="order_sds" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    
                    
                    SelectCommand="SELECT OrderMaster.orderid, OrderDetails.orderdetailid, OrderDetails.productid, Product.productname, OrderMaster.orderdate, OrderMaster.ordertotal FROM OrderMaster INNER JOIN OrderDetails ON OrderMaster.orderid = OrderDetails.orderid INNER JOIN Product ON OrderDetails.productid = Product.productid INNER JOIN Farmer ON Product.added_by = Farmer.farmerid WHERE (Farmer.farmerid = @farmerid)">
                    <SelectParameters>
                        <asp:SessionParameter  Name="farmerid" SessionField="farmid" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td align="right" style="width: 483px">
                &nbsp;</td>
            <td align="left">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
        </tr>
    </table>
    </form>
</asp:Content>

