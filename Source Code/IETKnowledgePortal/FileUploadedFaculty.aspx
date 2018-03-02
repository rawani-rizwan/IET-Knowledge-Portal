<%@ Page Language="VB" MasterPageFile="~/Faculty.master" AutoEventWireup="false" CodeFile="FileUploadedFaculty.aspx.vb" Inherits="FileUploadedFaculty" title="File Upload" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
<asp:Label ID="HeadingLabel" runat="server" BackColor="#507CD1" ForeColor="White"
        Style="left: 0px; vertical-align: middle; position: absolute; top: 0px; text-align: center"
        Width="706px">Upload File</asp:Label>
    <asp:Label ID="Uploaded" runat="server" Style="position: absolute; top: 30px" Text="File Uploaded Successfully."></asp:Label>
    <asp:HyperLink ID="UploadAnother" runat="server" NavigateUrl="~/UploadFaculty.aspx"
        Style="left: 0px; color: blue; position: absolute; top: 60px; text-decoration: underline">Upload Another File</asp:HyperLink>
</asp:Content>

