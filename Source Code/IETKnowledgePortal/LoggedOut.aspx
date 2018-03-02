<%@ Page Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="LoggedOut.aspx.vb" Inherits="LoggedOut" title="Logged Out" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <asp:Label ID="HeadingLabel" runat="server" BackColor="#507CD1" ForeColor="White"
        Style="left: 0px; vertical-align: middle; position: absolute; top: 0px; text-align: center"
        Text="Logged Out" Width="706px"></asp:Label>
    <asp:Label ID="Label1" runat="server" Style="left: 0px; font-family: Calibri; position: absolute;
        top: 30px; text-align: justify" Text="You have been logged out successfully."
        Width="706px"></asp:Label>
</asp:Content>

