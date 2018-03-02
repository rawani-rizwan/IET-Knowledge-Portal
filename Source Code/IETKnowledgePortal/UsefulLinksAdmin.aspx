<%@ Page Language="VB" MasterPageFile="~/Admin.master" AutoEventWireup="false" CodeFile="UsefulLinksAdmin.aspx.vb" Inherits="UsefulLinksAdmin" title="Useful Links" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <asp:Label ID="HeadingLabel" runat="server" BackColor="#507CD1" ForeColor="White"
        Style="left: 0px; vertical-align: middle; position: absolute; top: 0px; text-align: center"
        Width="706px">Useful Links</asp:Label>
  
    <asp:Label ID="suggested" runat="server" Style="left: 13px; position: absolute; top: 45px"
        Text="Suggested Readings:"></asp:Label>
    <asp:HyperLink ID="ViewSuggested" runat="server" Style="left: 150px; color: blue;
        position: absolute; top: 45px; text-decoration: underline" NavigateUrl="~/ViewSuggestedReadingsAdmin.aspx">View</asp:HyperLink>
    <asp:Label ID="Separator1" runat="server" Style="left: 182px; vertical-align: middle;
        position: absolute; top: 45px; text-align: center" Text="|" Width="19px"></asp:Label>
    <asp:HyperLink ID="AddSuggested" runat="server" Style="left: 200px; color: blue;
        position: absolute; top: 45px; text-decoration: underline" NavigateUrl="~/AddSuggestedReadingAdmin.aspx">Add</asp:HyperLink>
   
    <asp:Label ID="Other" runat="server" Style="left: 13px; position: absolute; top: 85px"
        Text="Other Links:"></asp:Label>
    <asp:HyperLink ID="ViewOther" runat="server" Style="left: 150px; color: blue; position: absolute;
        top: 85px; text-decoration: underline" NavigateUrl="~/ViewOtherLinksAdmin.aspx">View</asp:HyperLink>
    <asp:Label ID="Separator2" runat="server" Style="left: 182px; vertical-align: middle;
        position: absolute; top: 85px; text-align: center" Text="|" Width="19px"></asp:Label>
    <asp:HyperLink ID="AddOther" runat="server" Style="left: 200px; color: blue; position: absolute;
        top: 85px; text-decoration: underline" NavigateUrl="~/AddOtherLinkAdmin.aspx">Add</asp:HyperLink>
    <asp:HyperLink ID="mysuggestions" runat="server" NavigateUrl="~/MySuggestionsAdmin.aspx"
        Style="left: 13px; color: blue; position: absolute; top: 125px; text-decoration: underline"
        Width="128px">View Links Suggested By Me</asp:HyperLink>
    
</asp:Content>

