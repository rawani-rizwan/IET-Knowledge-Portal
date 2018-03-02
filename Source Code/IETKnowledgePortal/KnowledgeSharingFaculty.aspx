<%@ Page Language="VB" MasterPageFile="~/Faculty.master" AutoEventWireup="false" CodeFile="KnowledgeSharingFaculty.aspx.vb" Inherits="KnowledgeSharingFaculty" title="Knowledge Sharing Section" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <asp:Label ID="HeadingLabel" runat="server" BackColor="#507CD1" ForeColor="White"
        Style="left: 0px; vertical-align: middle; position: absolute; top: 0px; text-align: center"
        Width="706px">Knowledge Sharing Section</asp:Label>
    <asp:HyperLink ID="Upload" runat="server" NavigateUrl="~/UploadFaculty.aspx" Style="left: 13px;
        color: blue; position: absolute; top: 45px; text-decoration: underline">Upload</asp:HyperLink>
    <asp:HyperLink ID="Downloads" runat="server" NavigateUrl="~/DownloadsFaculty.aspx"
        Style="left: 13px; color: blue; position: absolute; top: 85px; text-decoration: underline">Downloads</asp:HyperLink>
    <asp:HyperLink ID="UsefulLinks" runat="server" Style="left: 13px; color: blue; position: absolute;
        top: 125px; text-decoration: underline" NavigateUrl="~/UsefulLinksFaculty.aspx">Useful Links</asp:HyperLink>
</asp:Content>

