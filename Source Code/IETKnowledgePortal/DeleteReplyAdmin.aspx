<%@ Page Language="VB" MasterPageFile="~/Admin.master" AutoEventWireup="false" CodeFile="DeleteReplyAdmin.aspx.vb" Inherits="DeleteReplyAdmin" title="Delete Reply" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>"
        SelectCommand="SELECT * FROM [Replies]"></asp:SqlDataSource>
</asp:Content>

