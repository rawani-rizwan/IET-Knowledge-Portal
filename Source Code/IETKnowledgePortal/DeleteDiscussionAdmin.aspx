<%@ Page Language="VB" MasterPageFile="~/Admin.master" AutoEventWireup="false" CodeFile="DeleteDiscussionAdmin.aspx.vb" Inherits="DeleteDiscussionAdmin" title="Delete Discussion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>"
        SelectCommand="SELECT * FROM [Replies]"></asp:SqlDataSource>
</asp:Content>

