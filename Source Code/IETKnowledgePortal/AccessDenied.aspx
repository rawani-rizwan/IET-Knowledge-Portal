<%@ Page Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="AccessDenied.aspx.vb" Inherits="AccessDenied" title="Access Denied" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <asp:Label ID="HeadingLabel" runat="server" BackColor="#507CD1" ForeColor="White"
        Style="left: 0px; vertical-align: middle; position: absolute; top: 0px; text-align: center"
        Text="Access Denied" Width="706px"></asp:Label>
    <asp:Label ID="Label1" runat="server" Style="left: 0px; font-family: Calibri; position: absolute;
        top: 30px; text-align: justify" Text="You need to Log In to access the requested page."
        Width="706px"></asp:Label>
</asp:Content>

