<%@ Page Language="VB" MasterPageFile="~/Student.master" AutoEventWireup="false" CodeFile="NoticeBoardStudent.aspx.vb" Inherits="NoticeBoardStudent" title="Notice Board" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <asp:Label ID="HeadingLabel" runat="server" BackColor="#507CD1" ForeColor="White"
        Style="left: 0px; vertical-align: middle; position: absolute; top: 0px; text-align: center"
        Width="706px">Notice Board</asp:Label>
    <asp:HyperLink ID="NewNotice" runat="server" Style="left: 13px; color: blue; position: absolute;
        top: 85px; text-decoration: underline" NavigateUrl="~/AddNoticeStudent.aspx">New Notice</asp:HyperLink>
    <asp:HyperLink ID="ViewNotices" runat="server" Style="left: 13px; color: blue; position: absolute;
        top: 45px; text-decoration: underline" NavigateUrl="~/ViewNoticesStudent.aspx">View Notices</asp:HyperLink>
</asp:Content>

