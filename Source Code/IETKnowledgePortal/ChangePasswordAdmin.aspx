<%@ Page Language="VB" MasterPageFile="~/Admin.master" AutoEventWireup="false" CodeFile="ChangePasswordAdmin.aspx.vb" Inherits="ChangePasswordAdmin" title="Change Password" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <asp:Label ID="HeadingLabel" runat="server" BackColor="#507CD1" ForeColor="White"
        Style="left: 0px; vertical-align: middle; position: absolute; top: 0px; text-align: center"
        Text="Change Password" Width="706px"></asp:Label>
    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" Style="left: 5px;
        vertical-align: middle; position: absolute; top: 80px; text-align: justify">New Password:</asp:Label>
    <asp:TextBox ID="Password" runat="server" BackColor="#FBF99B" Style="left: 180px;
        position: absolute; top: 80px" TextMode="Password" Width="144px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
        ErrorMessage="Password is required." Style="left: 330px; position: absolute;
        top: 80px" ToolTip="Password is required.">*</asp:RequiredFieldValidator>
    <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword"
        Style="left: 5px; vertical-align: middle; position: absolute; top: 120px; text-align: justify">Confirm New Password:</asp:Label>
    <asp:TextBox ID="ConfirmPassword" runat="server" BackColor="#FBF99B" Style="left: 180px;
        position: absolute; top: 120px" TextMode="Password" Width="144px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword"
        ErrorMessage="Confirm Password is required." Style="left: 330px; position: absolute;
        top: 120px" ToolTip="Confirm Password is required.">*</asp:RequiredFieldValidator>
    <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password"
        ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match."
        Font-Size="Smaller" Height="2px" Style="left: 350px; vertical-align: middle;
        position: absolute; top: 120px; text-align: justify" Width="295px"></asp:CompareValidator>
    <asp:Label ID="OldPasswordLabel" runat="server" Style="left: 5px; position: absolute;
        top: 40px" Text="Current Password"></asp:Label>
    <asp:TextBox ID="CurrentPassword" runat="server" BackColor="#FBF99B" Style="left: 180px;
        position: absolute; top: 40px" Width="144px" TextMode="Password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="CurrentPassword"
        ErrorMessage="Password is required." Style="left: 330px; position: absolute;
        top: 40px" ToolTip="Password is required.">*</asp:RequiredFieldValidator>
    <asp:Button ID="Update" runat="server" Style="left: 5px; position: absolute; top: 160px"
        Text="Update" />
    <asp:Button ID="Cancel" runat="server" CausesValidation="False" Style="left: 180px;
        position: absolute; top: 160px" Text="Cancel" />
    <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>"
        SelectCommand="SELECT * FROM [Administrator]"></asp:SqlDataSource>
    <asp:Label ID="WrongPassword" runat="server" Font-Size="Small" ForeColor="Red" Style="left: 360px;
        position: absolute; top: 40px" Text="Wrong Password!" Visible="False"></asp:Label>
</asp:Content>

