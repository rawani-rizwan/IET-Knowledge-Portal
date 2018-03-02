<%@ Page Language="VB" MasterPageFile="~/Student.master" AutoEventWireup="false" CodeFile="DeleteDiscussionStudent.aspx.vb" Inherits="DeleteDiscussionStudent" title="Delete Discussion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>"
        SelectCommand="SELECT * FROM [Replies]"></asp:SqlDataSource>
</asp:Content>

