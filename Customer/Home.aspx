<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/Customer.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Customer_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
    <tr>
        <td colspan="2">
            <h2 class="title">
                welcome</h2>
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
            <asp:Image ID="Image1" runat="server" Height="300px" 
                ImageUrl="~/images/vegetable.png" Width="300px" />
        </td>
        <td>
            <asp:Label ID="welc_lbl" runat="server" Font-Bold="True" Font-Size="14pt"></asp:Label>
        </td>
    </tr>
</table>
   
</asp:Content>

