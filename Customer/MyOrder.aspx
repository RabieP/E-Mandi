<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/Customer.master" AutoEventWireup="true" CodeFile="MyOrder.aspx.cs" Inherits="Customer_MyOrder" %>

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
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataSourceID="order_sds" CellPadding="2" 
                    CellSpacing="2" Width="100%" EmptyDataText="Your Cart is Empty" 
                    HorizontalAlign="Center" DataKeyNames="orderid">
                    <Columns>
                        <asp:HyperLinkField DataNavigateUrlFields="orderid" 
                                DataNavigateUrlFormatString="MyOrderDetails.aspx?OID={0}" HeaderText="View" 
                                Text="View" />
                        
                        <asp:BoundField DataField="orderid" HeaderText="Order Id" 
                            SortExpression="orderid" InsertVisible="False" ReadOnly="True" />
                       
                        <asp:BoundField DataField="orderdate" HeaderText="Order Date" 
                            SortExpression="orderdate" />
                        <asp:BoundField DataField="ordertotal" HeaderText="Total Amount" 
                            SortExpression="ordertotal" />
                        
                        <asp:BoundField DataField="status" HeaderText="Status" 
                            SortExpression="status"  />
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
                    
                    SelectCommand="SELECT [orderid], [orderdate], [ordertotal], [status] FROM [OrderMaster] WHERE ([customerid] = @customerid)">
                    <SelectParameters>
                        <asp:SessionParameter  Name="customerid" SessionField="cusid" Type="String" />
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

</asp:Content>

