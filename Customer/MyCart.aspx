<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/Customer.master" AutoEventWireup="true" CodeFile="MyCart.aspx.cs" Inherits="Customer_MyCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table style="width:100%;">
        <tr>
            <td colspan="2">
                <h2 class="title">
                    my cart</h2>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataSourceID="cart_sds" CellPadding="2" 
                    CellSpacing="2" Width="100%" EmptyDataText="Your Cart is Empty" 
                    HorizontalAlign="Center">
                    <Columns>
                        <asp:BoundField DataField="cartid" HeaderText="Cart Id" 
                            SortExpression="cartid" />
                        <asp:BoundField DataField="productid" HeaderText="Product Id" 
                            SortExpression="productid" />
                        <asp:BoundField DataField="productname" HeaderText="Product Name" 
                            SortExpression="productname" />
                        <asp:BoundField DataField="quantity" HeaderText="Quantity" 
                            SortExpression="quantity" />
                        <asp:BoundField DataField="unitprice" HeaderText="Price" 
                            SortExpression="unitprice" />
                        
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
                <asp:SqlDataSource ID="cart_sds" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT Product.productid, Product.productname, Cart.quantity, Product.unitprice, Cart.cartid FROM Cart INNER JOIN Customer ON Cart.cid = Customer.customerid INNER JOIN Product ON Cart.productid = Product.productid WHERE (Customer.customerid = @customeid)">
                    <SelectParameters>
                        <asp:SessionParameter  Name="customeid" SessionField="cusid" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            
        </tr>
        
    </table>
    
</asp:Content>


