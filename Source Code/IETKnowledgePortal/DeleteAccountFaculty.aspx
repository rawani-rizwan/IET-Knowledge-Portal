<%@ Page Language="VB" MasterPageFile="~/Faculty.master" AutoEventWireup="false" CodeFile="DeleteAccountFaculty.aspx.vb" Inherits="DeleteAccountFaculty" title="Delete Account" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
<asp:Label ID="HeadingLabel" runat="server" BackColor="#507CD1" ForeColor="White"
        Style="left: 0px; vertical-align: middle; position: absolute; top: 0px; text-align: center"
        Text="Delete Account" Width="706px"></asp:Label>
    <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>"
        SelectCommand="SELECT * FROM [Administrator]"></asp:SqlDataSource>
    <asp:TextBox ID="Password" runat="server" BackColor="#FBF99B" Style="left: 180px;
        position: absolute; top: 30px" TextMode="Password" Width="144px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
        ErrorMessage="Password is required." Style="left: 330px; position: absolute;
        top: 30px" ToolTip="Password is required.">*</asp:RequiredFieldValidator>
    <asp:Button ID="Delete" runat="server" Style="left: 5px; position: absolute; top: 80px"
        Text="Delete Account" />
    <asp:Label ID="wrongpassword" runat="server" ForeColor="Red" Style="left: 201px;
        position: absolute; top: 56px" Text="Wrong Password!" Visible="False"></asp:Label>
    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" Style="left: 5px;
        vertical-align: middle; position: absolute; top: 30px; text-align: justify">Enter Password:</asp:Label>
</asp:Content>

