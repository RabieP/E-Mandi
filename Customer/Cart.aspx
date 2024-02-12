<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/Customer.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Customer_Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table style="width:100%;">
        <tr>
            <td colspan="2">
                <h2 class="title">
                    cart</h2>
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
                            <asp:TemplateField HeaderText="Quantity">
                                <ItemTemplate>
                                    <asp:TextBox runat="server" ID="txtqty" Text='<%#Eval("quantity")%>' Width="50px"></asp:TextBox>
                                    <asp:HiddenField runat="server" ID="txtcartid" Value='<%#Eval("cartid")%>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        
                        <asp:BoundField DataField="unitprice" HeaderText="Price" SortExpression="unitprice"  />
                         <asp:TemplateField HeaderText="Delete">
                                <ItemTemplate>
                                    <a href='DeleteCart.aspx?cartid=<%#Eval("cartid")%>'><asp:Image runat="server" ID="btnBuy" ImageUrl="~/images/delete.gif" /></a>
                                 </ItemTemplate>
                            </asp:TemplateField>
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
        <tr>
            <td align="right" style="width: 483px">
                Total Price: &nbsp;&nbsp;</td>
            <td align="left">
                <asp:Label ID="lblTotal" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label></td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:Button ID="btnUpdate" runat="server" onclick="btnUpdate_Click" 
                    Text="Update" CssClass="btn" />
                <asp:Button ID="btncheckout" runat="server" onclick="btncheckout_Click" 
                    Text="Checkout" CssClass="btn" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
        </tr>
    </table>

</asp:Content>


