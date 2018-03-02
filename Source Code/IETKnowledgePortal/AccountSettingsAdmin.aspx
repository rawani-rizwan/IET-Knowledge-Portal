<%@ Page Language="VB" MasterPageFile="~/Admin.master" AutoEventWireup="false" CodeFile="AccountSettingsAdmin.aspx.vb" Inherits="AccountSettingsAdmin" title="Account Settings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <asp:Label ID="HeadingLabel" runat="server" BackColor="#507CD1" ForeColor="White"
        Style="left: 0px; vertical-align: middle; position: absolute; top: 0px; text-align: center"
        Text="Account Settings" Width="706px"></asp:Label>
    <asp:HyperLink ID="EditProfile" runat="server" NavigateUrl="~/EditProfileAdmin.aspx"
        Style="left: 13px; color: blue; position: absolute; top: 45px; text-decoration: underline">Update Profile</asp:HyperLink>
    <asp:HyperLink ID="ChangeProfilePicture" runat="server" NavigateUrl="~/ChangeAdminProfilePicture.aspx"
        Style="left: 13px; color: blue; position: absolute; top: 125px; text-decoration: underline">Change Profile Picture</asp:HyperLink>
    <asp:HyperLink ID="ChangePassword" runat="server" Style="left: 13px; color: blue;
        position: absolute; top: 85px; text-decoration: underline" NavigateUrl="~/ChangePasswordAdmin.aspx">Change Password</asp:HyperLink>
    <asp:HyperLink ID="ChangeSecurityInformation" runat="server" Style="left: 13px; color: blue;
        position: absolute; top: 165px; text-decoration: underline" NavigateUrl="~/UpdateSecurityInfoAdmin.aspx">Update Security Information</asp:HyperLink>
    <asp:HyperLink ID="DeleteAccount" runat="server" NavigateUrl="~/DeleteAccountAdmin.aspx"
        Style="left: 13px; color: blue; position: absolute; top: 205px; text-decoration: underline">Delete My Account</asp:HyperLink>
    <asp:Label ID="Label1" runat="server" Style="left: 150px; position: absolute; top: 205px"
        Text="(Your account can only be deleted if other administrator accounts exist)"></asp:Label>
</asp:Content>

