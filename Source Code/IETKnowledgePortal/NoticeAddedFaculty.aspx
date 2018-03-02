<%@ Page Language="VB" MasterPageFile="~/Faculty.master" AutoEventWireup="false" CodeFile="NoticeAddedFaculty.aspx.vb" Inherits="NoticeAddedFaculty" title="Notice Added" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
<asp:Label ID="HeadingLabel" runat="server" BackColor="#507CD1" ForeColor="White"
        Style="left: 0px; vertical-align: middle; position: absolute; top: 0px; text-align: center"
        Width="706px">Notice Board</asp:Label>
    <asp:Label ID="Uploaded" runat="server" Style="position: absolute; top: 30px" Text="Notice Added Successfully."></asp:Label>
    <asp:HyperLink ID="AddAnother" runat="server" NavigateUrl="~/AddNoticeFaculty.aspx"
        Style="left: 0px; color: blue; position: absolute; top: 60px; text-decoration: underline">Add Another Notice</asp:HyperLink>
</asp:Content>

