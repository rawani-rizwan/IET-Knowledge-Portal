<%@ Page Language="VB" MasterPageFile="~/Admin.master" AutoEventWireup="false" CodeFile="AdminHome.aspx.vb" Inherits="AdminHome" title="Admin - Home" %>
<%-- Add content controls here --%>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="Content">
    <asp:Label ID="HeadingLabel" runat="server" BackColor="#507CD1" ForeColor="White"
        Style="left: 0px; vertical-align: middle; position: absolute; top: 0px; text-align: center" Width="706px"></asp:Label>
    <asp:HyperLink ID="AccountRequests" runat="server" NavigateUrl="~/AccountRequestsAdmin.aspx"
        Style="left: 13px; color: blue; position: absolute; top: 45px; text-decoration: underline">New Account Requests</asp:HyperLink>
    <asp:HyperLink ID="PortalMembers" runat="server" NavigateUrl="~/PortalMembersAdmin.aspx"
        Style="left: 13px; color: blue; position: absolute; top: 165px; text-decoration: underline">Portal Members</asp:HyperLink>
    <asp:HyperLink ID="AddAdministrator" runat="server" NavigateUrl="~/AddAdministrator.aspx"
        Style="left: 13px; color: blue; position: absolute; top: 85px; text-decoration: underline">Add Administrator</asp:HyperLink>
    <asp:HyperLink ID="NoticeBoard" runat="server" NavigateUrl="~/NoticeBoardAdmin.aspx"
        Style="left: 13px; color: blue; position: absolute; top: 245px; text-decoration: underline">Notice Board</asp:HyperLink>
    <asp:HyperLink ID="DiscussionForum" runat="server" Style="left: 13px; color: blue;
        position: absolute; top: 205px; text-decoration: underline" NavigateUrl="~/DiscussionForumAdmin.aspx">Discussion Forum</asp:HyperLink>
    <asp:HyperLink ID="KnowledgeSharing" runat="server" NavigateUrl="~/KnowledgeSharingAdmin.aspx"
        Style="left: 13px; color: blue; position: absolute; top: 125px; text-decoration: underline">Knowledge Sharing Section</asp:HyperLink>
    <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>"
        SelectCommand="SELECT * FROM [Administrator]"></asp:SqlDataSource>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/AccountSettingsAdmin.aspx"
        Style="left: 13px; color: blue; position: absolute; top: 285px; text-decoration: underline">Account Settings</asp:HyperLink>
</asp:Content>
