<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="DispatchOrder.aspx.cs" Inherits="Admin_DispatchOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
    <table style="width:100%;">
        <tr>
            <td>
                <h2 class="title">
                    Disptach&nbsp; Orders</h2>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataSourceID="order_sds" CellPadding="2" 
                    CellSpacing="2" Width="100%" EmptyDataText="Your Cart is Empty" 
                    HorizontalAlign="Center" DataKeyNames="orderid" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="orderid" HeaderText="Order Id" 
                            SortExpression="orderid" InsertVisible="False" ReadOnly="True" />
                        <asp:BoundField DataField="firstname" HeaderText="First Name" 
                            SortExpression="firstname" />
                        <asp:BoundField DataField="lastname" HeaderText="Last Name" 
                            SortExpression="lastname" />
                         <asp:BoundField DataField="ordertotal" HeaderText="Order Total" 
                            SortExpression="ordertotal" />
                         <asp:CommandField ShowSelectButton="True" HeaderText="Update Order" SelectText="Dispatch Order" ButtonType="Button" />
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
            <td>
                <asp:SqlDataSource ID="order_sds" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    
                    
                    
                    SelectCommand="SELECT OrderMaster.orderid, Customer.firstname, Customer.lastname, OrderMaster.ordertotal FROM OrderMaster INNER JOIN Customer ON OrderMaster.customerid = Customer.customerid WHERE (OrderMaster.status = 'Paid')">
                    
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Label ID="msg_lbl" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    </form>
</asp:Content>

