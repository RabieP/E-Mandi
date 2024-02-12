<%@ Page Title="" Language="C#" MasterPageFile="~/Farmer/Farmer.master" AutoEventWireup="true" CodeFile="EditProduct.aspx.cs" Inherits="Admin_EditProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
    <table style="width:100%;">
        <tr>
            <td colspan="2">
                <h2 class="title">
                    Edit Product</h2>
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
                <asp:TextBox ID="prodid_txt" runat="server" CssClass="input" Width="285px"></asp:TextBox>
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
                Quantity in Hand</td>
            <td>
                <asp:TextBox ID="prodqty_txt" runat="server" CssClass="input"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="edit_btn" runat="server" CssClass="btn" Text="Edit Product" 
                    onclick="edit_btn_Click" />
&nbsp;<asp:Button ID="delete_btn" runat="server" CssClass="btn" Text="Delete Product" 
                    onclick="delete_btn_Click" />
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
                <asp:SqlDataSource ID="prod_sds" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    
                    SelectCommand="SELECT DISTINCT productid FROM Product WHERE (added_by = @added_by)">
                    <SelectParameters>
                        <asp:SessionParameter Name="added_by" SessionField="farmid" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    </form>
</asp:Content>

