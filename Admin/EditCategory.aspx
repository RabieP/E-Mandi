<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="EditCategory.aspx.cs" Inherits="Admin_EditCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form2" runat="server">
    <table style="width:100%;">
        <tr>
            <td colspan="2">
              <h2 class="title">EdIT Category</h2></td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Category Id</td>
            <td>
                <asp:DropDownList ID="catid_ddl" runat="server" AppendDataBoundItems="True" 
                    CssClass="input" AutoPostBack="True" DataSourceID="catid_sds" 
                    DataTextField="categoryid" DataValueField="categoryid" 
                    onselectedindexchanged="catid_ddl_SelectedIndexChanged">
                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                Category Name</td>
            <td>
                <asp:TextBox ID="cat_txt" runat="server" CssClass="input" Width="285px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="edit_btn" runat="server" CssClass="btn" Text="Edit Category" 
                    onclick="edit_btn_Click" />
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
                <asp:SqlDataSource ID="catid_sds" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT [categoryid] FROM [Category]"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
    </form>
   
</asp:Content>

