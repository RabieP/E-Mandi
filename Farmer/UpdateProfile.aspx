<%@ Page Title="" Language="C#" MasterPageFile="~/Farmer/Farmer.master" AutoEventWireup="true" CodeFile="UpdateProfile.aspx.cs" Inherits="Farmer_UpdateProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
    <table style="width:100%;">
        <tr>
            <td colspan="2">
                <h2 class="title">
                    update profile</h2>
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
                Address</td>
            <td>
                <asp:TextBox ID="address_txt" runat="server" CssClass="input" Height="45px" 
                    TextMode="MultiLine" Width="285px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                City</td>
            <td>
                <asp:TextBox ID="city_txt" runat="server" CssClass="input"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                State</td>
            <td>
                <asp:TextBox ID="state_txt" runat="server" CssClass="input"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Pincode</td>
            <td>
                <asp:TextBox ID="pin_txt" runat="server" CssClass="input"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Email</td>
            <td>
                <asp:TextBox ID="email_txt" runat="server" CssClass="input"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Phone</td>
            <td>
                <asp:TextBox ID="phone_txt" runat="server" CssClass="input"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="update_btn" runat="server" CssClass="btn" Text="Update Profile" 
                    onclick="update_btn_Click" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="msg_lbl" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    </form>
</asp:Content>

