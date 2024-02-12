<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true" CodeFile="CustomerLogin.aspx.cs" Inherits="CustomerLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
<table style="width:100%;">
    <tr>
        <td colspan="2">
            <h2 class="title">
                Customer Login</h2>
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
            User Id</td>
        <td>
            <asp:TextBox ID="uid_txt" runat="server" CssClass="input"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="uid_txt" ErrorMessage="Enter User Id" Font-Size="10pt" 
                ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            Password</td>
        <td>
            <asp:TextBox ID="pwd_txt" runat="server" CssClass="input" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="pwd_txt" ErrorMessage="Enter Password" Font-Size="10pt" 
                ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
                &nbsp;</td>
        <td>
            <asp:Button ID="login_btn" runat="server" CssClass="btn" Text="Login" 
                onclick="login_btn_Click" />
        </td>
    </tr>
    <tr>
        <td>
                &nbsp;</td>
        <td>
            <asp:Label ID="msg_lbl" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" 
                NavigateUrl="~/CustRegister.aspx">New Customer? Register. Its Free</asp:HyperLink>
        </td>
    </tr>
</table>

</asp:Content>

