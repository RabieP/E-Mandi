<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="AddProduct.aspx.cs" Inherits="Admin_AddProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
    <table style="width:100%;">
        <tr>
            <td colspan="2">
                <h2 class="title">
                    Add Product</h2>
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
                Product Id</td>
            <td>
                <asp:TextBox ID="prodid_txt" runat="server" CssClass="input" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Product Name</td>
            <td>
                <asp:TextBox ID="prod_txt" runat="server" CssClass="input" Width="285px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Upload Image</td>
            <td>
                <asp:FileUpload ID="prod_fu" runat="server" CssClass="input" Width="285px" />
            </td>
        </tr>
        <tr>
            <td>
                Description</td>
            <td>
                <asp:TextBox ID="proddesc_txt" runat="server" CssClass="input" Height="45px" 
                    TextMode="MultiLine" Width="285px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Category</td>
            <td>
                <asp:DropDownList ID="prodcatid_ddl" runat="server" AppendDataBoundItems="True" 
                    CssClass="input" DataSourceID="cat_sds" DataTextField="categoryname" 
                    DataValueField="categoryid">
                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                Price</td>
            <td>
                <asp:TextBox ID="prodprice_txt" runat="server" CssClass="input"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Weight</td>
            <td>
                <asp:DropDownList ID="wt_ddl" runat="server" CssClass="input">
                    <asp:ListItem>Select</asp:ListItem>
                    <asp:ListItem>100g</asp:ListItem>
                    <asp:ListItem>250g</asp:ListItem>
                    <asp:ListItem>500g</asp:ListItem>
                    <asp:ListItem>1kg</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                Total Quantity</td>
            <td>
                <asp:TextBox ID="prodqty_txt" runat="server" CssClass="input"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="add_btn" runat="server" CssClass="btn" Text="Add Product" 
                    onclick="add_btn_Click" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="msg_lbl" runat="server"></asp:Label>
                <asp:SqlDataSource ID="cat_sds" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT [categoryid], [categoryname] FROM [Category]">
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    </form>
</asp:Content>

