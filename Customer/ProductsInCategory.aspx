<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/Customer.master" AutoEventWireup="true" CodeFile="ProductsInCategory.aspx.cs" Inherits="Customer_ProductsInCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table style="width:100%;">
        <tr>
            <td>
                <h2 class="title">
                    Category wise Products </h2>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:DataList ID="DataList2" runat="server" CellPadding="1" CellSpacing="1" 
                    DataKeyField="productid" DataSourceID="prod_sds" HorizontalAlign="Center" 
                    RepeatColumns="4" Width="99%">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemTemplate>
                        
                        <asp:Label ID="productnameLabel" runat="server" Text='<%# Eval("productname") %>' Font-Bold="True" BackColor="#194A59" ForeColor="White" Width="150" Height="22" Font-Size="13" />
                        
                       <a href='ProductDetail.aspx?pid=<%#Eval("productid") %>'>
                        <asp:Image ID="cimg1" runat="server" ImageUrl='<%# Eval("pimage") %>' Height="150px" Width="150px"/></a><br />
                        <a href='AddToCart.aspx?pid=<%#Eval("productid") %>' style="background-color: #194A59; padding: 2px; margin: 2px; font-weight: bold; color: white">Add To Cart </a>
          </ItemTemplate>
                </asp:DataList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:SqlDataSource ID="prod_sds" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    
                    SelectCommand="SELECT [productid], [productname], [pimage] FROM [Product] WHERE ([categoryid] = @categoryid)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="categoryid" QueryStringField="cid" 
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

