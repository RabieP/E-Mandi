<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="AllProducts.aspx.cs" Inherits="Admin_AllProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
    <table style="width:100%;">
        <tr>
            <td>
                <h2 class="title">
                    Product List</h2>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataKeyNames="productid" 
                    DataSourceID="SqlDataSource1" Width="99%" EmptyDataText="No Product Found">
                    <Columns>
                        
                         <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <asp:Image ID="imgg" ImageUrl='<%#Eval("pimage") %>' runat="server" Height="70" Width="70"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="productid" HeaderText="Pid" ReadOnly="True" 
                            SortExpression="productid" ItemStyle-Width="15%" >
                            <ItemStyle Width="15%"></ItemStyle>
                         </asp:BoundField>
                        <asp:BoundField DataField="productname" HeaderText="Product" 
                            SortExpression="productname" />

                        <asp:BoundField DataField="description" HeaderText="Description" 
                            SortExpression="description" />
                        <asp:BoundField DataField="categoryname" HeaderText="Category" 
                            SortExpression="categoryname" />
                        <asp:BoundField DataField="unitprice" HeaderText="Price" 
                            SortExpression="unitprice" />
                        <asp:TemplateField HeaderText="Edit">
                                <ItemTemplate>
                                          <a href='EditProduct.aspx?pid=<%#Eval("productid")%>' style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: bold">Edit</a>
                                 </ItemTemplate>
                            </asp:TemplateField>
                    </Columns>
                    <HeaderStyle BackColor="#194A59" ForeColor="White" Height="35px" />
                    <PagerStyle Font-Bold="True" ForeColor="#194A59" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT Product.pimage, Product.productid, Product.productname, Product.description, Product.unitprice, Category.categoryname FROM Product INNER JOIN Category ON Product.categoryid = Category.categoryid">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="height: 19px">
            </td>
        </tr>
    </table>
    </form>
</asp:Content>

