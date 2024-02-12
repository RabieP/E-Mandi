<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/Customer.master" AutoEventWireup="true" CodeFile="CancelOrder.aspx.cs" Inherits="Customer_CancelOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table style="width:100%;">
        <tr>
            <td colspan="2">
                <h2 class="title">
                    Cancel Order</h2>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Order Id</td>
            <td>
                <asp:DropDownList ID="ordid_ddl" runat="server" AppendDataBoundItems="True" 
                    CssClass="input" AutoPostBack="True" DataSourceID="ord_sds" 
                    DataTextField="orderid" DataValueField="orderid" 
                    onselectedindexchanged="ordid_ddl_SelectedIndexChanged">
                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                Order Date</td>
            <td>
                <asp:TextBox ID="orddate_txt" runat="server" CssClass="input"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Order Amount</td>
            <td>
                <asp:TextBox ID="ordamt_txt" runat="server" CssClass="input"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="cancel_btn" runat="server" CssClass="btn" Text="Cancel Order" 
                    onclick="cancel_btn_Click" />
&nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="msg_lbl" runat="server"></asp:Label>
                <asp:SqlDataSource ID="ord_sds" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    
                    
                    SelectCommand="SELECT [orderid], [orderdate] FROM [OrderMaster] WHERE ([customerid] = @customerid)">
                    <SelectParameters>
                        <asp:SessionParameter Name="customerid" SessionField="cusid" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>

</asp:Content>


