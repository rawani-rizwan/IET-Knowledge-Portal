<%@ Page Language="VB" MasterPageFile="~/Admin.master" AutoEventWireup="false" CodeFile="AddSuggestedReadingAdmin.aspx.vb" Inherits="AddSuggestedReadingAdmin" title="Add Suggested Reading" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <asp:Label ID="HeadingLabel" runat="server" BackColor="#507CD1" ForeColor="White"
        Style="left: 0px; vertical-align: middle; position: absolute; top: 0px; text-align: center"
        Width="706px">Add Suggested Reading</asp:Label>
    <asp:Label ID="TitleLabel" runat="server" Style="left: 0px; position: absolute; top: 45px"
        Text="Title/Description:"></asp:Label>
    <asp:Label ID="LinkLabel" runat="server" Style="left: 0px; position: absolute; top: 85px"
        Text="Link:"></asp:Label>
    <asp:TextBox ID="TitleText" runat="server" BackColor="#FBF99B" Style="left: 120px;
        position: absolute; top: 45px" Width="550px"></asp:TextBox>
    <asp:TextBox ID="Link" runat="server" BackColor="#FBF99B" Style="left: 120px; position: absolute;
        top: 85px" Width="550px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="Titlevalidator" runat="server" ControlToValidate="TitleText"
        ErrorMessage="*" Style="left: 675px; position: absolute; top: 45px"></asp:RequiredFieldValidator>
    <asp:Button ID="Add" runat="server" Style="left: 0px; position: absolute; top: 125px"
        Text="Add" Width="70px" />
    <asp:Button ID="Done" runat="server" CausesValidation="False" Style="left: 120px;
        position: absolute; top: 125px" Text="Done" Width="70px" />
    <asp:Label ID="RecordAdded" runat="server" Style="left: 0px; position: absolute;
        top: 165px" Text="Link Added Successfully!" Visible="False"></asp:Label>
    <asp:RequiredFieldValidator ID="LinkValidator" runat="server" ControlToValidate="Link"
        ErrorMessage="*" Style="left: 675px; position: absolute; top: 85px"></asp:RequiredFieldValidator>
    <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>"
        SelectCommand="SELECT * FROM [Links]"></asp:SqlDataSource>
</asp:Content>

