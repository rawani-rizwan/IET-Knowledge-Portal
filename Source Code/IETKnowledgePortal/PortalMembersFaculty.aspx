<%@ Page Language="VB" MasterPageFile="~/Faculty.master" AutoEventWireup="false" CodeFile="PortalMembersFaculty.aspx.vb" Inherits="PortalMembersFaculty" title="Portal Members" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
<asp:Label ID="HeadingLabel" runat="server" BackColor="#507CD1" ForeColor="White"
        Style="left: 0px; vertical-align: middle; position: absolute; top: 0px; text-align: center"
        Width="706px">Portal Members</asp:Label>
    <asp:HyperLink ID="AdministratorAccounts" runat="server" NavigateUrl="~/AdministratorAccountsFaculty.aspx"
        Style="left: 13px; color: blue; position: absolute; top: 45px; text-decoration: underline">Administrator Accounts</asp:HyperLink>
    <asp:HyperLink ID="StudentAccounts" runat="server" NavigateUrl="~/StudentAccountsFaculty.aspx"
        Style="left: 13px; color: blue; position: absolute; top: 125px; text-decoration: underline">Student Accounts</asp:HyperLink>
    <asp:HyperLink ID="FacultyAccounts" runat="server" Style="left: 13px; color: blue;
        position: absolute; top: 85px; text-decoration: underline" NavigateUrl="~/FacultyAccountsFaculty.aspx">Faculty Accounts</asp:HyperLink>
</asp:Content>

