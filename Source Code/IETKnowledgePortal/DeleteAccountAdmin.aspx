<%@ Page Language="VB" MasterPageFile="~/Admin.master" AutoEventWireup="false" CodeFile="DeleteAccountAdmin.aspx.vb" Inherits="DeleteAccountAdmin" title="Delete Account" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <asp:Label ID="HeadingLabel" runat="server" BackColor="#507CD1" ForeColor="White"
        Style="left: 0px; vertical-align: middle; position: absolute; top: 0px; text-align: center"
        Text="Delete Account" Width="706px"></asp:Label>
    <asp:Label ID="cantdelete" runat="server" Style="position: absolute; top: 30px" Text="Your account can not be deleted as there are no other administrator accounts."
        Visible="False"></asp:Label>
    <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>"
        SelectCommand="SELECT * FROM [Administrator]"></asp:SqlDataSource>
    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" Style="left: 5px;
        vertical-align: middle; position: absolute; top: 30px; text-align: justify" Visible="False">Enter Password:</asp:Label>
    <asp:TextBox ID="Password" runat="server" BackColor="#FBF99B" Style="left: 180px;
        position: absolute; top: 30px" TextMode="Password" Visible="False" Width="144px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
        ErrorMessage="Password is required." Style="left: 330px; position: absolute;
        top: 30px" ToolTip="Password is required." Visible="False">*</asp:RequiredFieldValidator>
    <asp:Button ID="Delete" runat="server" Style="left: 5px; position: absolute; top: 80px"
        Text="Delete Account" Visible="False" />
    <asp:Label ID="wrongpassword" runat="server" ForeColor="Red" Style="left: 201px;
        position: absolute; top: 56px" Text="Wrong Password!" Visible="False"></asp:Label>
</asp:Content>

