<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/Customer.master" AutoEventWireup="true" CodeFile="BrowseProducts.aspx.cs" Inherits="Customer_BrowseProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
        <tr>
            <td>
                <h2 class="title">
                    Browse Products</h2>
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
                    RepeatColumns="3" Width="99%" onitemdatabound="DataList2_ItemDataBound">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemTemplate>
                        
                       <asp:Label ID="productnameLabel" runat="server" Text='<%# Eval("productname") %>' Font-Bold="True" BackColor="#194A59" ForeColor="White" Width="100%" Height="22" Font-Size="13" />
                        <br/>

                        <asp:HyperLink ID="lnkDetails" NavigateUrl='<%# string.Format("ProductDetail.aspx?pid={0}",Eval("productid")) %>' runat="server" >
                             <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("pimage") %>' Height="170px" Width="200px"/>
                        </asp:HyperLink>
                        
                        <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("pimage") %>' Height="170px" Width="200px"/><br />
                        <asp:HyperLink ID="lnkCart" NavigateUrl='<%# string.Format("AddToCart.aspx?pid={0}",Eval("productid")) %>' runat="server" Text = "Add To Cart" style="background-color: #194A59; padding: 2px; margin: 2px; font-weight: bold; color: white">
                             
                        </asp:HyperLink>
                      <br />

                        <asp:Label ID="pqtyLabel" runat="server" Text='<%# Eval("pqty") %>' style="padding: 2px; margin: 2px; font-weight: bold; font-size:16px; color:Orange"></asp:Label>
                        <br />
                        <br /> </ItemTemplate>
                </asp:DataList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:SqlDataSource ID="prod_sds" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT [productid], [productname], [pimage], [pqty] FROM [Product]">
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

