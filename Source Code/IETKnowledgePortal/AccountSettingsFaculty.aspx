<%@ Page Language="VB" MasterPageFile="~/Faculty.master" AutoEventWireup="false" CodeFile="AccountSettingsFaculty.aspx.vb" Inherits="AccountSettingsFaculty" title="Account Settings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
 <asp:Label ID="HeadingLabel" runat="server" BackColor="#507CD1" ForeColor="White"
        Style="left: 0px; vertical-align: middle; position: absolute; top: 0px; text-align: center"
        Text="Account Settings" Width="706px"></asp:Label>
    <asp:HyperLink ID="EditProfile" runat="server" NavigateUrl="~/EditProfileFaculty.aspx"
        Style="left: 13px; color: blue; position: absolute; top: 45px; text-decoration: underline">Update Profile</asp:HyperLink>
    <asp:HyperLink ID="ChangeProfilePicture" runat="server" NavigateUrl="~/ChangeFacultyProfilePicture.aspx"
        Style="left: 13px; color: blue; position: absolute; top: 125px; text-decoration: underline">Change Profile Picture</asp:HyperLink>
    <asp:HyperLink ID="ChangePassword" runat="server" NavigateUrl="~/ChangePasswordFaculty.aspx"
        Style="left: 13px; color: blue; position: absolute; top: 85px; text-decoration: underline">Change Password</asp:HyperLink>
    <asp:HyperLink ID="ChangeSecurityInformation" runat="server" NavigateUrl="~/UpdateSecurityInfoFaculty.aspx"
        Style="left: 13px; color: blue; position: absolute; top: 165px; text-decoration: underline">Update Security Information</asp:HyperLink>
    <asp:HyperLink ID="DeleteAccount" runat="server" NavigateUrl="~/DeleteAccountFaculty.aspx"
        Style="left: 13px; color: blue; position: absolute; top: 205px; text-decoration: underline">Delete My Account</asp:HyperLink>
</asp:Content>

