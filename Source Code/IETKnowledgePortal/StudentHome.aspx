<%@ Page Language="VB" MasterPageFile="~/Student.master" AutoEventWireup="false" CodeFile="StudentHome.aspx.vb" Inherits="StudentHome" title="Student - Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <asp:Label ID="HeadingLabel" runat="server" BackColor="#507CD1" ForeColor="White"
        Style="left: 0px; vertical-align: middle; position: absolute; top: 0px; text-align: center" Width="706px"></asp:Label>
    <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>"
        SelectCommand="SELECT * FROM [Student]"></asp:SqlDataSource>
    <asp:HyperLink ID="KnowledgeSharing" runat="server" NavigateUrl="~/KnowledgeSharingStudent.aspx"
        Style="left: 13px; color: blue; position: absolute; top: 45px; text-decoration: underline">Knowledge Sharing Section</asp:HyperLink>
    <asp:HyperLink ID="PortalMembers" runat="server" NavigateUrl="~/PortalMembersStudent.aspx"
        Style="left: 13px; color: blue; position: absolute; top: 85px; text-decoration: underline">Portal Members</asp:HyperLink>
    <asp:HyperLink ID="DiscussionForum" runat="server" Style="left: 13px; color: blue;
        position: absolute; top: 125px; text-decoration: underline" NavigateUrl="~/DiscussionForumStudent.aspx">Discussion Forum</asp:HyperLink>
    <asp:HyperLink ID="NoticeBoard" runat="server" NavigateUrl="~/NoticeBoardStudent.aspx"
        Style="left: 13px; color: blue; position: absolute; top: 165px; text-decoration: underline">Notice Board</asp:HyperLink>
   
    <asp:HyperLink ID="AccountSettings" runat="server" NavigateUrl="~/AccountSettingsStudent.aspx"
        Style="left: 13px; color: blue; position: absolute; top: 205px; text-decoration: underline">Account Settings</asp:HyperLink>
   
</asp:Content>

