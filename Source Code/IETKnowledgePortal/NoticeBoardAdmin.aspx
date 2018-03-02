<%@ Page Language="VB" MasterPageFile="~/Admin.master" AutoEventWireup="false" CodeFile="NoticeBoardAdmin.aspx.vb" Inherits="NoticeBoardAdmin" title="Notice Board" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <asp:Label ID="HeadingLabel" runat="server" BackColor="#507CD1" ForeColor="White"
        Style="left: 0px; vertical-align: middle; position: absolute; top: 0px; text-align: center"
        Width="706px">Notice Board</asp:Label>
    <asp:HyperLink ID="UpdateNewsGallary" runat="server" NavigateUrl="~/UpdateNewsGallery.aspx"
        Style="left: 13px; color: blue; position: absolute; top: 45px; text-decoration: underline">Update News Gallary</asp:HyperLink>
    <asp:HyperLink ID="NewNotice" runat="server" Style="left: 13px; color: blue; position: absolute;
        top: 125px; text-decoration: underline" NavigateUrl="~/AddNoticeAdmin.aspx">New Notice</asp:HyperLink>
    <asp:HyperLink ID="ViewNotices" runat="server" Style="left: 13px; color: blue; position: absolute;
        top: 85px; text-decoration: underline" NavigateUrl="~/ViewNoticesAdmin.aspx">View Notices</asp:HyperLink>
</asp:Content>

