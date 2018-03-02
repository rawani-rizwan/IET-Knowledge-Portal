<%@ Page Language="VB" MasterPageFile="~/Admin.master" AutoEventWireup="false" CodeFile="PortalMembersAdmin.aspx.vb" Inherits="PortalMembersAdmin" title="Portal Members" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <asp:Label ID="HeadingLabel" runat="server" BackColor="#507CD1" ForeColor="White"
        Style="left: 0px; vertical-align: middle; position: absolute; top: 0px; text-align: center"
        Width="706px">Portal Members</asp:Label>
    <asp:HyperLink ID="AdministratorAccounts" runat="server" NavigateUrl="~/AdministratorAccountsAdmin.aspx"
        Style="left: 13px; color: blue; position: absolute; top: 45px; text-decoration: underline">Administrator Accounts</asp:HyperLink>
    <asp:HyperLink ID="StudentAccounts" runat="server" NavigateUrl="~/StudentAccountsAdmin.aspx"
        Style="left: 13px; color: blue; position: absolute; top: 125px; text-decoration: underline">Student Accounts</asp:HyperLink>
    <asp:HyperLink ID="FacultyAccounts" runat="server" Style="left: 13px; color: blue;
        position: absolute; top: 85px; text-decoration: underline" NavigateUrl="~/FacultyAccountsAdmin.aspx">Faculty Accounts</asp:HyperLink>
</asp:Content>

