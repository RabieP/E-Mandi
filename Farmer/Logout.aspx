<%@ Page Title="" Language="C#" MasterPageFile="~/Farmer/Farmer.master" AutoEventWireup="true" CodeFile="Logout.aspx.cs" Inherits="Admin_Logout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
    <table style="width:100%;">
        <tr>
            <td colspan="2">
              <h2 class="title">Logout</h2></td>
        </tr>
        <tr>
            <td style="width: 231px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 231px">
                <strong><span style="font-size: large">Click Here </span></strong>
                <asp:Image ID="Image1" runat="server" Height="60px" ImageAlign="Middle" 
                    ImageUrl="~/images/arrow.png" Width="60px" />
            </td>
            <td>
                <asp:ImageButton ID="ImageButton1" runat="server" Height="170px" 
                    ImageAlign="Middle" ImageUrl="~/images/logout.png" Width="170px" 
                    onclick="ImageButton1_Click" />
            </td>
        </tr>
    </table>
    </form>
</asp:Content>

