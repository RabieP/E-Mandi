<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true" CodeFile="HomePaget.aspx.cs" Inherits="HomePaget" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
    <table style="width:100%;">
        <tr>
            <td colspan="2">
                <h2 class="title">
                welcome To E-Mandi</h2>
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
                <asp:Image ID="Image2" runat="server" Height="300px" 
                ImageUrl="~/images/tomato-png-16717.png" Width="300px" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <p style="text-align: justify; font-size: medium; line-height: 25px;">E-Mandi – online vegetable store 
                    Did you ever imagine that the freshest of fruits and vegetables could be handpicked and delivered to your home, all at the click of a button? India’s first comprehensive online megastore, 
                    E-Mandi, brings a top quality fruits and vegetbles to over million happy customers. Online 
                    vegetable shopping has never been easier. Need things fresh? Whether it’s fruits and vegetables, 
                    we have this covered as well! </p></td>
        </tr>
    </table>

</asp:Content>

