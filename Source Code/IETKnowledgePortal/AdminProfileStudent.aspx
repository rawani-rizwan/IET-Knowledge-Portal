<%@ Page Language="VB" MasterPageFile="~/Student.master" AutoEventWireup="false" CodeFile="AdminProfileStudent.aspx.vb" Inherits="AdminProfileStudent" title="Administrator Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <asp:Label ID="HeadingLabel" runat="server" BackColor="#507CD1" ForeColor="White"
        Style="left: 0px; vertical-align: middle; position: absolute; top: 0px; text-align: center"
        Text="Administrator Profile" Width="706px"></asp:Label>
    <asp:Label ID="UserIdLabel" runat="server" Style="left: 5px; position: absolute;
        top: 30px" Text="User Id:"></asp:Label>
    <asp:Label ID="UserId" runat="server" Style="left: 95px; position: absolute; top: 30px" Width="435px"></asp:Label>
    <asp:Label ID="NameLabel" runat="server" Style="left: 5px; vertical-align: middle;
        position: absolute; top: 70px; text-align: justify">Full Name:</asp:Label>
    <asp:Label ID="EmailLabel" runat="server" Style="left: 5px; vertical-align: middle;
        position: absolute; top: 150px; text-align: justify">Email Id:</asp:Label>
    <asp:Label ID="DesignationLabel" runat="server" Style="left: 5px; vertical-align: middle;
        position: absolute; top: 110px; text-align: justify">Designation:</asp:Label>
    <asp:Label ID="MobileLabel" runat="server" Style="left: 5px; vertical-align: middle;
        position: absolute; top: 190px; text-align: justify">Mobile No:</asp:Label>
    <asp:Button ID="Back" runat="server" CausesValidation="False" Style="left: 5px; position: absolute;
        top: 230px" Text="Back" />
    <asp:Label ID="Name" runat="server" Style="left: 95px; position: absolute; top: 70px" Width="435px"></asp:Label>
    <asp:Label ID="Designation" runat="server" Style="left: 95px; position: absolute;
        top: 110px" Width="435px"></asp:Label>
    <asp:Label ID="Email" runat="server" Style="left: 95px; position: absolute; top: 150px" Width="435px"></asp:Label>
    <asp:Label ID="Mobile" runat="server" Style="left: 95px; position: absolute; top: 190px" Width="435px"></asp:Label>
    <asp:Image ID="ProfilePicture" runat="server" Height="160px" ImageUrl="~/images/profile pictures/no_profile.jpg"
        Style="left: 550px; position: absolute; top: 30px" Width="140px" />
    <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>"
        SelectCommand="SELECT * FROM [Administrator]"></asp:SqlDataSource>
</asp:Content>

