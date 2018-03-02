<%@ Page Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="PhotoGallery.aspx.vb" Inherits="PhotoGallery" title="Photo Gallery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <asp:Label ID="HeadingLabel" runat="server" BackColor="#507CD1" ForeColor="White"
        Style="left: 0px; vertical-align: middle; position: absolute; top: 0px; text-align: center"
        Text="Photo Gallery" Width="706px"></asp:Label>
    <asp:Image ID="Image1" runat="server" Height="140px" Style="left: 0px; position: absolute;
        top: 40px" Width="160px" DescriptionUrl="~/images/random images/2.jpg" ImageUrl="~/images/random images/2.jpg" /><asp:Image ID="Image2" runat="server" Height="140px" Style="left: 180px; position: absolute;
        top: 40px" Width="160px" ImageUrl="~/images/random images/4.jpg" />
    <asp:Image ID="Image3" runat="server" Height="140px" Style="left: 360px; position: absolute;
        top: 40px" Width="160px" ImageUrl="~/images/random images/5.jpg" />
    <asp:Image ID="Image4" runat="server" Height="140px" Style="left: 540px; position: absolute;
        top: 40px" Width="160px" ImageUrl="~/images/random images/6.jpg" />
    <asp:Image ID="Image5" runat="server" Height="140px" Style="left: 0px; position: absolute;
        top: 200px" Width="160px" ImageUrl="~/images/random images/7.jpg" />
    <asp:Image ID="Image6" runat="server" Height="140px" Style="left: 180px; position: absolute;
        top: 200px" Width="160px" ImageUrl="~/images/random images/9.jpg" />
    <asp:Image ID="Image7" runat="server" Height="140px" Style="left: 360px; position: absolute;
        top: 200px" Width="160px" ImageUrl="~/images/random images/10.jpg" />
    <asp:Image ID="Image8" runat="server" Height="140px" Style="left: 540px; position: absolute;
        top: 200px" Width="160px" ImageUrl="~/images/random images/11.jpg" />
   
</asp:Content>

