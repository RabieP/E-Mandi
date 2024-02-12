<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="AddCategory.aspx.cs" Inherits="Admin_AddCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
    <table style="width:100%;">
        <tr>
            <td colspan="2">
              <h2 class="title">Add Category</h2></td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Category</td>
            <td>
                <asp:TextBox ID="cat_txt" runat="server" CssClass="input"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Upload Image</td>
            <td>
                <asp:FileUpload ID="cat_fu" runat="server" CssClass="input" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="add_btn" runat="server" CssClass="btn" Text="Add Category" 
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
    </form>
</asp:Content>

