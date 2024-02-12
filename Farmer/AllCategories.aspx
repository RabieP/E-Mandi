<%@ Page Title="" Language="C#" MasterPageFile="~/Farmer/Farmer.master" AutoEventWireup="true" CodeFile="AllCategories.aspx.cs" Inherits="Admin_AllCategories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
    <table style="width:100%;">
        <tr>
            <td>
                <h2 class="title">
                    category List</h2>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataKeyNames="categoryid" 
                    DataSourceID="SqlDataSource1" Width="59%">
                    <Columns>
                        
                        <asp:TemplateField HeaderText="Image" ItemStyle-Width="11%">
                            <ItemTemplate>
                                <asp:Image ID="imgg" ImageUrl='<%#Eval("cimg") %>' runat="server" Height="70" Width="70"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="categoryid" HeaderText="Category Id" 
                            SortExpression="categoryid" InsertVisible="False" ReadOnly="True" ItemStyle-Width="25%" ItemStyle-HorizontalAlign="Center"/>

                        <asp:BoundField DataField="categoryname" HeaderText="Category Name" 
                            SortExpression="categoryname" />
                        
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
                    
                    SelectCommand="SELECT [cimg], [categoryid], [categoryname] FROM [Category]">
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

