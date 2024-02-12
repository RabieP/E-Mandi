<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/Customer.master" AutoEventWireup="true" CodeFile="MakePayment.aspx.cs" Inherits="Customer_MakePayment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table style="width:100%;">
<tr>
            <td colspan="2">
                <h2 class="title">
                    Make Payment</h2>
            </td>
        </tr>
<tr>
            <td colspan="2">
                &nbsp;</td>
        </tr>
                    <tr>
                        <td>Order No.</td>
                        <td>
                            <asp:Label ID="lblOrderNo" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Payment Date</td>
                        <td>
                            <asp:TextBox ID="txtPDate" CssClass="input" runat="server" 
                                Enabled="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Payment Type</td>
                        <td>
                             &nbsp;<asp:DropDownList ID="ddlPaymentType" runat="server" CssClass="input" 
                                 Height="25" AutoPostBack="True" 
                                 onselectedindexchanged="ddlPaymentType_SelectedIndexChanged">
                                <asp:ListItem Text="--Select Payment Type--" Value=""></asp:ListItem>
                                <asp:ListItem Text="Credit Card" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Debit Card" Value="2"></asp:ListItem>
                                 <asp:ListItem Text="COD" Value="3"></asp:ListItem>
                            </asp:DropDownList>
                             <br />

                             <asp:RequiredFieldValidator ID="rfvPaymentType" runat="server" 
                                 ControlToValidate="ddlPaymentType" Display="Dynamic" 
                                 ErrorMessage="Please select payment type" ForeColor="Red" />
                        </td>
                    </tr>
                    <tr>
                        <td>Card No.</td>
                        <td>
                            <asp:TextBox ID="txtCardNumber" CssClass="input" runat="server" 
                                MaxLength="16"></asp:TextBox>
                            <br />

                            <asp:RequiredFieldValidator ID="rfvCardNumber" runat="server" 
                                ControlToValidate="txtCardNumber" Display="Dynamic" 
                                ErrorMessage="Please enter 16 digit card number" ForeColor="Red" />
                        </td>
                    </tr>
                    <tr>
                        <td>Name On Card</td>
                        <td>
                            <asp:TextBox ID="txtNameOnCard" CssClass="input" runat="server"></asp:TextBox>
                            <br />

                            <asp:RequiredFieldValidator ID="rfvNameOnCard" runat="server" 
                                ControlToValidate="txtNameOnCard" Display="Dynamic" 
                                ErrorMessage="Please enter your name printed card number" ForeColor="Red" />
                        </td>
                    </tr>
                    <tr>
                        <td>CVV</td>
                        <td>
                            <asp:TextBox ID="txtCVV" CssClass="input" runat="server"></asp:TextBox>
                            <br />

                            <asp:RequiredFieldValidator ID="rfvCVV" runat="server" 
                                ControlToValidate="txtCVV" Display="Dynamic" 
                                ErrorMessage="Please enter 3 digit CVV number printed on card" 
                                ForeColor="Red" />
                        </td>
                    </tr>
                    <tr>
                        <td>Expiry Date</td>
                        <td>
                           <asp:TextBox 
                                ID="txtExpiryMonth" CssClass="input" runat="server"></asp:TextBox>
                            <br />

                            <asp:RequiredFieldValidator ID="rfvExpiryMonth" runat="server" 
                                ControlToValidate="txtExpiryMonth" Display="Dynamic" 
                                ErrorMessage="Please enter expiry month and year printed on card. (dd/yyyy)" 
                                ForeColor="Red" />
                        </td>
                    </tr>
                    <tr>
                        <td>Total Amount</td>
                        <td>
                            <asp:TextBox ID="txtAmount" CssClass="input" 
                                runat="server" Enabled="False"></asp:TextBox>
                            <br />

                            </td>
                    </tr>
                    <tr><td align="center" colspan="2"><div class="btns">
                    <asp:Button ID="btnSave" CssClass="btn" runat="server" 
                        Text="Make Payment" OnClick="BtnSave_Click" />
                </div></td>
                    </tr>
                    <tr align="center"><td colspan="2"><asp:Label ID="lblmessage" runat="server" ForeColor="Red" Text=""></asp:Label></td></tr>
                    <tr align="center"><td colspan="2">
                        &nbsp;</td></tr>
                    </table>
</asp:Content>

