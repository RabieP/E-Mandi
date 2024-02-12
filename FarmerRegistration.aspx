<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true" CodeFile="FarmerRegistration.aspx.cs" Inherits="FarmerRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table style="width:100%;">
        <tr>
            <td colspan="2">
                <h2 class="title">
                    Farmer registration</h2>
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
                Farmer Id</td>
            <td>
                <asp:TextBox ID="farmid_txt" runat="server" CssClass="input" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Aadhar Card No.</td>
            <td>
                <asp:TextBox ID="aadharcardno_txt" runat="server" CssClass="input" 
                    Width="285px" MaxLength="12"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                First Name</td>
            <td>
                <asp:TextBox ID="fname_txt" runat="server" CssClass="input" Width="285px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Last Name</td>
            <td>
                <asp:TextBox ID="lname_txt" runat="server" CssClass="input" Width="285px"></asp:TextBox>
            </td>
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
                Username</td>
            <td>
                <asp:TextBox ID="uname_txt" runat="server" CssClass="input"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Password</td>
            <td>
                <asp:TextBox ID="pass_txt" runat="server" CssClass="input" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Reenter Password</td>
            <td>
                <asp:TextBox ID="cpass_txt" runat="server" CssClass="input" TextMode="Password"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="pass_txt" ControlToValidate="cpass_txt" 
                    ErrorMessage="Passwords do not match" ForeColor="Red"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="add_btn" runat="server" CssClass="btn" Text="Register" 
                    onclick="add_btn_Click" />
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
    
  
</asp:Content>

