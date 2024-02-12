<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="AllUsers.aspx.cs" Inherits="Admin_AllUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<form id="form1" runat="server">
    <table style="width:100%;">
        <tr>
            <td>
                <h2 class="title">
                    Customer List</h2>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataKeyNames="customerid" 
                    DataSourceID="SqlDataSource1" Width="99%">
                    <Columns>
                        
                        <asp:BoundField DataField="customerid" HeaderText="Customer Id" ReadOnly="True" 
                            SortExpression="customerid" >
                         </asp:BoundField>
                        <asp:BoundField DataField="firstname" HeaderText="First Name" 
                            SortExpression="firstname" />

                        <asp:BoundField DataField="lastname" HeaderText="Last Name" 
                            SortExpression="lastname" />
                        <asp:BoundField DataField="address" HeaderText="Address" 
                            SortExpression="address" />
                        <asp:BoundField DataField="city" HeaderText="City" 
                            SortExpression="city" />
                        
                         <asp:BoundField DataField="phone" HeaderText="Phone" SortExpression="phone" />
                         <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                        
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
                    
                    SelectCommand="SELECT [customerid], [firstname], [lastname], [address], [city], [phone], [email] FROM [Customer]">
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

