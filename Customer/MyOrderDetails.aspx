<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/Customer.master" AutoEventWireup="true" CodeFile="MyOrderDetails.aspx.cs" Inherits="Customer_MyOrderDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                    DataKeyNames="orderid" DataSourceID="order_sds" Height="50px" Width="90%" 
                    CellPadding="1" CellSpacing="1" HorizontalAlign="Center" 
                    Caption="Order Summary" EmptyDataText="No Order Exists">
                    <FieldHeaderStyle BackColor="#1A596A" Font-Bold="True" Font-Size="12pt" 
                        ForeColor="White" Width="40%" />
                    <Fields>
                        <asp:BoundField DataField="orderid" HeaderText="Order Id" InsertVisible="False" 
                            ReadOnly="True" SortExpression="orderid" />
                        <asp:BoundField DataField="orderdate" HeaderText="Order Date" 
                            SortExpression="orderdate" />
                        <asp:BoundField DataField="ordertotal" HeaderText="Order Total" 
                            SortExpression="ordertotal" />
                        <asp:BoundField DataField="status" HeaderText="Order Status" 
                            SortExpression="status" />
                    </Fields>
                    <RowStyle BackColor="#DDF1F7" />
                </asp:DetailsView>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:SqlDataSource ID="order_sds" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    
                    
                    SelectCommand="SELECT orderid, orderdate, ordertotal, status FROM OrderMaster WHERE (customerid = @customerid) AND (orderid = @orderid)">
                    <SelectParameters>
                        <asp:SessionParameter  Name="customerid" SessionField="cusid" Type="String" />
                        <asp:QueryStringParameter Name="orderid" QueryStringField="OID" />
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
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataSourceID="orderdetails_sds" CellPadding="2" 
                    CellSpacing="2" Width="100%" EmptyDataText="Your Cart is Empty" 
                    HorizontalAlign="Center">
                    <Columns>
                        
                        <asp:BoundField DataField="productid" HeaderText="Product Id" 
                            SortExpression="productid" />
                       
                        <asp:BoundField DataField="productname" HeaderText="Product Name" 
                            SortExpression="productname" />
                        <asp:BoundField DataField="quantity" HeaderText="Quantity" 
                            SortExpression="quantity" />
                        
                        <asp:BoundField DataField="unitprice" HeaderText="Unit Price" 
                            SortExpression="unitprice"  />
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
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:SqlDataSource ID="orderdetails_sds" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT OrderDetails.productid, Product.productname, OrderDetails.quantity, OrderDetails.unitprice FROM OrderDetails INNER JOIN OrderMaster ON OrderDetails.orderid = OrderMaster.orderid INNER JOIN Product ON OrderDetails.productid = Product.productid WHERE (OrderDetails.orderid = @orderid) AND (OrderMaster.customerid = @customerid)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="orderid" QueryStringField="OID" />
                        <asp:SessionParameter Name="customerid" SessionField="cusid" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>

</asp:Content>

