<%@ Page Language="VB" MasterPageFile="~/Admin.master" AutoEventWireup="false" CodeFile="AccountRequestsAdmin.aspx.vb" Inherits="AccountRequestsAdmin" title="Account Requests" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <asp:Label ID="HeadingLabel" runat="server" BackColor="#507CD1" ForeColor="White"
        Style="left: 0px; vertical-align: middle; position: absolute; top: 0px; text-align: center"
        Text="New Account Requests" Width="706px"></asp:Label>
    <asp:HyperLink ID="StudentRequests" runat="server" NavigateUrl="~/PendingStudentAccountRequests.aspx"
        Style="left: 13px; color: blue; position: absolute; top: 45px; text-decoration: underline">Account Requests for Student Account</asp:HyperLink>
    <asp:HyperLink ID="FacultyRequests" runat="server" Style="left: 13px; color: blue;
        position: absolute; top: 87px; text-decoration: underline" NavigateUrl="~/PendingFacultyAccountRequests.aspx">Account Requests for Faculty Account</asp:HyperLink>
</asp:Content>

