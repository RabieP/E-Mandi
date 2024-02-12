<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/Customer.master" AutoEventWireup="true" CodeFile="ProductDetail.aspx.cs" Inherits="Customer_ProductDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
        <tr>
            <td colspan="2">
                <h2 class="title">
                    Product Details</h2>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                    DataKeyNames="productid" DataSourceID="prod_sds" Height="50px" Width="90%" 
                    CellPadding="1" CellSpacing="1" HorizontalAlign="Center">
                    <FieldHeaderStyle BackColor="#1A596A" Font-Bold="True" Font-Size="12pt" 
                        ForeColor="White" Width="40%" />
                    <Fields>
                        <asp:BoundField DataField="productid" HeaderText="Product Id" ReadOnly="True" 
                            SortExpression="productid" />
                        <asp:TemplateField HeaderText="Product Image">
                            <ItemTemplate>
                                <asp:Image ID="cimg1" runat="server" ImageUrl='<%# Eval("pimage") %>' Height="300px" Width="350px"/></a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="productname" HeaderText="Product Name" 
                            SortExpression="productname" />
                         <asp:BoundField DataField="description" HeaderText="Description" 
                            SortExpression="description" />
                        <asp:BoundField DataField="categoryname" HeaderText="categoryname" 
                            SortExpression="categoryname" /> 
                        <asp:BoundField DataField="unitprice" HeaderText="unitprice" 
                            SortExpression="unitprice" />
                       <asp:BoundField DataField="wttype" HeaderText="Weight" 
                            SortExpression="wttype" />
                        
                       </Fields>
                    <RowStyle BackColor="#DDF1F7" />
                </asp:DetailsView>
            </td>
        </tr>
        <tr>
            <td align="right" style="width: 264px">
                Enter Quantity</td>
            <td>
                <asp:TextBox ID="qty_txt" runat="server" CssClass="input"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:Button ID="addtocart_btn" runat="server" CssClass="btn" Text="Add To Cart" 
                    onclick="addtocart_btn_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:SqlDataSource ID="prod_sds" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    
                    SelectCommand="SELECT Product.productid, Product.productname, Product.unitprice, Product.description, Product.pimage, Product.wttype, Category.categoryname FROM Product INNER JOIN Category ON Product.categoryid = Category.categoryid WHERE (Product.productid = @productid)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="productid" QueryStringField="pid" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

