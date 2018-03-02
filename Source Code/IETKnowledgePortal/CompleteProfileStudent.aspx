<%@ Page Language="VB" MasterPageFile="~/Student.master" AutoEventWireup="false" CodeFile="CompleteProfileStudent.aspx.vb" Inherits="CompleteProfileStudent" title="Complete Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <asp:Label ID="HeadingLabel" runat="server" BackColor="#507CD1" ForeColor="White"
        Style="left: 0px; vertical-align: middle; position: absolute; top: 0px; text-align: center"
        Text="Complete Profile" Width="706px"></asp:Label>
    <asp:Label ID="Label1" runat="server" Style="left: 0px; position: absolute; top: 30px"
        Text="Welcome to IET Knowledge Portal. As this is the first time you logged in to your account, we request you to complete your profile before continuing."></asp:Label>
    <asp:Label ID="AboutMeLabel" runat="server" Style="left: 5px; position: absolute;
        top: 95px" Text="About Me:"></asp:Label>
    <asp:TextBox ID="AboutMe" runat="server" Height="40px" Style="left: 120px; position: absolute;
        top: 80px" TextMode="MultiLine" Width="510px" BackColor="#FBF99B"></asp:TextBox>
    <asp:Label ID="InterestsLabel" runat="server" Style="left: 5px; position: absolute;
        top: 155px" Text="Interests:"></asp:Label>
    <asp:TextBox ID="Interests" runat="server" Height="40px" Style="left: 120px; position: absolute;
        top: 140px" TextMode="MultiLine" Width="510px" BackColor="#FBF99B"></asp:TextBox>
    <asp:Label ID="AchievementsLabel" runat="server" Style="left: 5px; position: absolute;
        top: 215px" Text="Achievements:"></asp:Label>
    <asp:TextBox ID="Achievements" runat="server" Height="40px" Style="left: 120px; position: absolute;
        top: 200px" TextMode="MultiLine" Width="510px" BackColor="#FBF99B"></asp:TextBox>
    <asp:Label ID="ProjectsLabel" runat="server" Style="left: 5px; position: absolute;
        top: 275px" Text="Projects:"></asp:Label>
    <asp:TextBox ID="Projects" runat="server" Height="40px" Style="left: 120px; position: absolute;
        top: 260px" TextMode="MultiLine" Width="510px" BackColor="#FBF99B"></asp:TextBox>
    <asp:Label ID="PublicationsLabel" runat="server" Style="left: 5px; position: absolute;
        top: 335px" Text="Publications:"></asp:Label>
    <asp:TextBox ID="Publications" runat="server" Height="40px" Style="left: 120px; position: absolute;
        top: 320px" TextMode="MultiLine" Width="510px" BackColor="#FBF99B"></asp:TextBox>
    <asp:Button ID="Proceed" runat="server" Text="Proceed" style="left: 0px; position: absolute; top: 380px"  />
    <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>"
        SelectCommand="SELECT * FROM [Student]"></asp:SqlDataSource>
</asp:Content>

