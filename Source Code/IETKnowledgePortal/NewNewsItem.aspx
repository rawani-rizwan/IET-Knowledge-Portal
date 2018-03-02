<%@ Page Language="VB" MasterPageFile="~/Admin.master" AutoEventWireup="false" CodeFile="NewNewsItem.aspx.vb" Inherits="NewNewsItem" title="Add News Item" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <asp:Label ID="HeadingLabel" runat="server" BackColor="#507CD1" ForeColor="White"
        Style="left: 0px; vertical-align: middle; position: absolute; top: 0px; text-align: center"
        Text="Update News Gallery" Width="706px"></asp:Label>
    <asp:Label ID="NewsTextLabel" runat="server" Style="left: 0px; position: absolute;
        top: 30px" Text="News Text"></asp:Label>
    <asp:Label ID="NewsLinkLabel" runat="server" Style="left: 0px; position: absolute;
        top: 80px" Text="News Link:"></asp:Label>
    <asp:TextBox ID="NewsText" runat="server" Style="left: 100px; position: absolute;
        top: 30px" Width="581px" BackColor="#FBF99B"></asp:TextBox>
    <asp:TextBox ID="NewsLink" runat="server" BackColor="#FBF99B" Style="left: 100px;
        position: absolute; top: 80px" Width="581px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="NewsText"
        ErrorMessage="*" Style="left: 690px; position: absolute; top: 30px"></asp:RequiredFieldValidator>
    <asp:Label ID="PriorityLabel" runat="server" Style="left: 0px; position: absolute;
        top: 130px" Text="Priority:"></asp:Label>
    <asp:TextBox ID="Priority" runat="server" BackColor="#FBF99B" Style="left: 100px;
        position: absolute; top: 130px" Width="72px"></asp:TextBox>
    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="Priority"
        ErrorMessage="Enter a positive integer (3 digits max)!" MaximumValue="999" MinimumValue="1"
        Style="left: 200px; position: absolute; top: 130px" Type="Integer"></asp:RangeValidator>
    <asp:Button ID="Add" runat="server" Style="left: 0px; position: absolute; top: 180px"
        Text="Add" Width="70px" />
    <asp:Button ID="Done" runat="server" CausesValidation="False" Style="left: 100px;
        position: absolute; top: 180px" Text="Done" Width="70px" />
    <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>"
        SelectCommand="SELECT * FROM [News_Gallery]"></asp:SqlDataSource>
    <asp:Label ID="RecordAdded" runat="server" Style="left: 0px; position: absolute;
        top: 230px" Text="Record Added Successfully!" Visible="False"></asp:Label>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Priority"
        ErrorMessage="*" Style="left: 179px; position: absolute; top: 130px"></asp:RequiredFieldValidator>
</asp:Content>

