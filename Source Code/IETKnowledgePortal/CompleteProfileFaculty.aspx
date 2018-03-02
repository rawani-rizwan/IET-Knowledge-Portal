<%@ Page Language="VB" MasterPageFile="~/Faculty.master" AutoEventWireup="false" CodeFile="CompleteProfileFaculty.aspx.vb" Inherits="CompleteProfileFaculty" title="Complete Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    &nbsp;
    <asp:Label ID="HeadingLabel" runat="server" BackColor="#507CD1" ForeColor="White"
        Style="left: 0px; vertical-align: middle; position: absolute; top: 0px; text-align: center"
        Text="Complete Profile" Width="706px"></asp:Label>
    <asp:Label ID="Label1" runat="server" Style="left: 0px; position: absolute; top: 30px"
        Text="Welcome to IET Knowledge Portal. As this is the first time you logged in to your account, we request you to complete your profile before continuing."></asp:Label>
    <asp:Label ID="AboutMeLabel" runat="server" Style="left: 5px; position: absolute;
        top: 95px" Text="About Me:"></asp:Label>
    <asp:TextBox ID="AboutMe" runat="server" BackColor="#FBF99B" Height="40px" Style="left: 120px;
        position: absolute; top: 80px" TextMode="MultiLine" Width="510px"></asp:TextBox>
    <asp:Label ID="QualificationsLabel" runat="server" Style="left: 5px; position: absolute;
        top: 155px" Text="Qualifications:"></asp:Label>
    <asp:TextBox ID="Qualifications" runat="server" BackColor="#FBF99B" Height="40px"
        Style="left: 120px; position: absolute; top: 140px" TextMode="MultiLine" Width="510px"></asp:TextBox>
    <asp:Label ID="InterestsLabel" runat="server" Style="left: 5px; position: absolute;
        top: 215px" Text="Interests:"></asp:Label>
    <asp:TextBox ID="Interests" runat="server" BackColor="#FBF99B" Height="40px" Style="left: 120px;
        position: absolute; top: 200px" TextMode="MultiLine" Width="510px"></asp:TextBox>
    <asp:Label ID="SubjectsTaughtLabel" runat="server" Style="left: 5px; position: absolute;
        top: 275px" Text="Subjects Taught:"></asp:Label>
    <asp:TextBox ID="SubjectsTaught" runat="server" BackColor="#FBF99B" Height="40px"
        Style="left: 120px; position: absolute; top: 260px" TextMode="MultiLine" Width="510px"></asp:TextBox>
    <asp:Label ID="AchievementsLabel" runat="server" Style="left: 5px; position: absolute;
        top: 335px" Text="Achievements:"></asp:Label>
    <asp:TextBox ID="Achievements" runat="server" BackColor="#FBF99B" Height="40px" Style="left: 120px;
        position: absolute; top: 320px" TextMode="MultiLine" Width="510px"></asp:TextBox>
    <asp:Label ID="ProjectsLabel" runat="server" Style="left: 5px; position: absolute;
        top: 395px" Text="Projects:"></asp:Label>
    <asp:TextBox ID="Projects" runat="server" BackColor="#FBF99B" Height="40px" Style="left: 120px;
        position: absolute; top: 380px" TextMode="MultiLine" Width="510px"></asp:TextBox>
    <asp:Label ID="PublicationsLabel" runat="server" Style="left: 5px; position: absolute;
        top: 455px" Text="Publications:"></asp:Label>
    <asp:TextBox ID="Publications" runat="server" BackColor="#FBF99B" Height="40px" Style="left: 120px;
        position: absolute; top: 440px" TextMode="MultiLine" Width="510px"></asp:TextBox>
    <asp:Button ID="Proceed" runat="server" Style="left: 0px; position: absolute; top: 560px"
        Text="Proceed" />
    <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>"
        SelectCommand="SELECT * FROM [Student]"></asp:SqlDataSource>
   
    
    <asp:Label ID="TeachingStyleLabel" runat="server" Style="left: 5px; position: absolute;
        top: 515px" Text="Teaching Style:"></asp:Label>
    <asp:TextBox ID="TeachingStyle" runat="server" BackColor="#FBF99B" Height="40px"
        Style="left: 120px; position: absolute; top: 500px" TextMode="MultiLine" Width="510px"></asp:TextBox>
</asp:Content>

