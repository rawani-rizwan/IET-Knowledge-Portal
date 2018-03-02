<%@ Page Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="SignUp.aspx.vb" Inherits="SignUp" title="Sign Up" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <asp:Label ID="SignUpLabel" runat="server" BackColor="#507CD1" ForeColor="White"
        Style="left: 0px; vertical-align: middle; position: absolute; top: 0px; text-align: center"
        Text="Sign Up Request" Width="706px"></asp:Label>
    <asp:HyperLink ID="StudentSignUp" runat="server" NavigateUrl="~/StudentSignUp.aspx"
        Style="left: 13px; color: blue; position: absolute; top: 45px; text-decoration: underline">Request for a new Student Account</asp:HyperLink>
    <asp:HyperLink ID="Faculty" runat="server" Style="left: 14px; color: blue; position: absolute;
        top: 87px; text-decoration: underline" NavigateUrl="~/FacultySignUp.aspx">Request for a new Faculty Account</asp:HyperLink>
    
</asp:Content>

