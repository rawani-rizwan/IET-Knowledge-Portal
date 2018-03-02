<%@ Page Language="VB" MasterPageFile="~/Student.master" AutoEventWireup="false" CodeFile="KnowledgeSharingStudent.aspx.vb" Inherits="KnowledgeSharingStudent" title="Knowledge Sharing Section" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <asp:Label ID="HeadingLabel" runat="server" BackColor="#507CD1" ForeColor="White"
        Style="left: 0px; vertical-align: middle; position: absolute; top: 0px; text-align: center"
        Width="706px">Knowledge Sharing Section</asp:Label>
    <asp:HyperLink ID="Upload" runat="server" NavigateUrl="~/UploadStudent.aspx" Style="left: 13px;
        color: blue; position: absolute; top: 45px; text-decoration: underline">Upload</asp:HyperLink>
    <asp:HyperLink ID="Downloads" runat="server" NavigateUrl="~/DownloadsStudent.aspx"
        Style="left: 13px; color: blue; position: absolute; top: 85px; text-decoration: underline">Downloads</asp:HyperLink>
    <asp:HyperLink ID="UsefulLinks" runat="server" Style="left: 13px; color: blue; position: absolute;
        top: 125px; text-decoration: underline" NavigateUrl="~/UsefulLinksStudent.aspx">Useful Links</asp:HyperLink>
</asp:Content>

