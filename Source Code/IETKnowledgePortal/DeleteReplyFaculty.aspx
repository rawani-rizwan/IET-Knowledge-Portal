<%@ Page Language="VB" MasterPageFile="~/Faculty.master" AutoEventWireup="false" CodeFile="DeleteReplyFaculty.aspx.vb" Inherits="DeleteReplyFaculty" title="Delete Reply" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>"
        SelectCommand="SELECT * FROM [Replies]"></asp:SqlDataSource>
</asp:Content>

