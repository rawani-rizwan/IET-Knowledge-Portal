<%@ Page Language="VB" MasterPageFile="~/Student.master" AutoEventWireup="false" CodeFile="EditProfileStudent.aspx.vb" Inherits="EditProfileStudent" title="Edit Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <asp:Label ID="HeadingLabel" runat="server" BackColor="#507CD1" ForeColor="White"
        Style="left: 0px; vertical-align: middle; position: absolute; top: 0px; text-align: center"
        Text="Update Profile" Width="706px"></asp:Label>
    <asp:Label ID="UserIdLabel" runat="server" Style="left: 0px; position: absolute;
        top: 30px" Text="User Id:"></asp:Label>
    <asp:Label ID="UserId" runat="server" Style="left: 95px; position: absolute; top: 30px"
        Width="195px"></asp:Label>
    <asp:Label ID="EnrolmentNoLabel" runat="server"
        Style="left: 330px; vertical-align: middle; position: absolute; top: 30px; text-align: justify"
        Width="96px">Enrollment No:</asp:Label>
    <asp:Label ID="EnrollmentNo" runat="server" Style="left: 450px; position: absolute; top: 30px"
        Width="246px"></asp:Label>
    <asp:Label ID="ScholarNoLabel" runat="server" Style="left: 0px; position: absolute;
        top: 70px" Text="Scholar No:"></asp:Label>
    <asp:Label ID="ScholarNo" runat="server" Style="left: 95px; position: absolute; top: 70px"
        Width="195px"></asp:Label>
    <asp:Label ID="NameLabel" runat="server" Style="left: 330px; position: absolute; top: 70px"
        Text="Name:"></asp:Label>
    <asp:Label ID="Name" runat="server" Style="left: 450px; position: absolute; top: 70px"
        Width="243px"></asp:Label>
    <asp:Label ID="RollNoLabel" runat="server" Style="left: 0px;
        vertical-align: middle; position: absolute; top: 110px; text-align: justify">Roll No:</asp:Label>
    <asp:TextBox ID="RollNo" runat="server" BackColor="#FBF99B" Style="left: 95px; position: absolute;
        top: 110px" Width="144px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RollValidator" runat="server" ControlToValidate="RollNo"
        ErrorMessage="Roll No is required." Style="left: 250px; position: absolute; top: 110px"
        ToolTip="Roll No is required.">*</asp:RequiredFieldValidator>
    <asp:Label ID="YearLabel" runat="server" Style="left: 330px;
        vertical-align: middle; position: absolute; top: 110px; text-align: justify">Year:</asp:Label>
    <asp:DropDownList ID="Year" runat="server" BackColor="#FBF99B" Font-Names="Times New Roman"
        Style="left: 450px; position: absolute; top: 110px" Width="147px">
        <asp:ListItem>I</asp:ListItem>
        <asp:ListItem>II</asp:ListItem>
        <asp:ListItem>III</asp:ListItem>
        <asp:ListItem>IV</asp:ListItem>
    </asp:DropDownList>
    <asp:Label ID="EmailLabel" runat="server" Style="left: 0px;
        vertical-align: middle; position: absolute; top: 150px; text-align: justify" Width="55px">Email Id:</asp:Label>
    <asp:TextBox ID="Email" runat="server" BackColor="#FBF99B" Style="left: 95px; position: absolute;
        top: 150px" Width="144px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="EmailValidator" runat="server" ControlToValidate="Email"
        ErrorMessage="E-mail is required." Style="left: 250px; position: absolute; top: 150px"
        ToolTip="E-mail is required.">*</asp:RequiredFieldValidator>
    <asp:Label ID="BranchLabel" runat="server" Style="left: 330px;
        vertical-align: middle; position: absolute; top: 150px; text-align: justify">Branch:</asp:Label>
    <asp:DropDownList ID="Branch" runat="server" BackColor="#FBF99B" Style="left: 450px;
        position: absolute; top: 150px" Width="147px">
        <asp:ListItem>Computer Engg.</asp:ListItem>
        <asp:ListItem>E &amp; TC Engg.</asp:ListItem>
        <asp:ListItem>IT Engg.</asp:ListItem>
        <asp:ListItem>E &amp; I Engg.</asp:ListItem>
        <asp:ListItem>Mechanical Engg.</asp:ListItem>
        <asp:ListItem>Civil Engg.</asp:ListItem>
    </asp:DropDownList>
    <asp:Label ID="MobileLabel" runat="server" Style="left: 0px;
        vertical-align: middle; position: absolute; top: 190px; text-align: justify"
        Width="77px">Mobile No:</asp:Label>
    <asp:TextBox ID="Mobile" runat="server" BackColor="#FBF99B" Style="left: 95px; position: absolute;
        top: 190px" Width="144px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="MobileValidator" runat="server" ControlToValidate="Mobile"
        ErrorMessage="Mobile no is required." Style="left: 250px; position: absolute;
        top: 190px" ToolTip="Mobile no is required.">*</asp:RequiredFieldValidator>
    <asp:RangeValidator ID="MobileValidator1" runat="server" ControlToValidate="Mobile"
        ErrorMessage="Enter a 10 digit mobile no!" Font-Size="Smaller" MaximumValue="9999999999"
        MinimumValue="1000000000" Style="left: 95px; vertical-align: middle; position: absolute;
        top: 213px; text-align: justify" Type="Double" Width="153px"></asp:RangeValidator>
    <asp:RegularExpressionValidator ID="EmailValidator1" runat="server" ControlToValidate="Email"
        ErrorMessage="Enter a valid email address" Font-Size="Smaller" Style="left: 95px;
        vertical-align: middle; position: absolute; top: 173px; text-align: justify"
        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Width="151px">Enter a valid email address!</asp:RegularExpressionValidator>
    <asp:Label ID="AboutMeLabel" runat="server" Style="left: 0px; position: absolute;
        top: 258px" Text="About Me:"></asp:Label>
    <asp:TextBox ID="AboutMe" runat="server" BackColor="#FBF99B" Height="40px" Style="left: 95px;
        position: absolute; top: 244px" TextMode="MultiLine" Width="500px"></asp:TextBox>
    <asp:Label ID="InterestsLabel" runat="server" Style="left: 0px; position: absolute;
        top: 318px" Text="Interests:"></asp:Label>
    <asp:TextBox ID="Interests" runat="server" BackColor="#FBF99B" Height="40px" Style="left: 95px;
        position: absolute; top: 303px" TextMode="MultiLine" Width="500px"></asp:TextBox>
    <asp:Label ID="AchievementsLabel" runat="server" Style="left: 0px; position: absolute;
        top: 378px" Text="Achievements:"></asp:Label>
    <asp:TextBox ID="Achievements" runat="server" BackColor="#FBF99B" Height="40px" Style="left: 95px;
        position: absolute; top: 363px" TextMode="MultiLine" Width="500px"></asp:TextBox>
    <asp:Label ID="ProjectsLabel" runat="server" Style="left: 0px; position: absolute;
        top: 438px" Text="Projects:"></asp:Label>
    <asp:TextBox ID="Projects" runat="server" BackColor="#FBF99B" Height="40px" Style="left: 95px;
        position: absolute; top: 423px" TextMode="MultiLine" Width="500px"></asp:TextBox>
    <asp:Label ID="PublicationsLabel" runat="server" Style="left: 0px; position: absolute;
        top: 498px" Text="Publications:"></asp:Label>
    <asp:TextBox ID="Publications" runat="server" BackColor="#FBF99B" Height="40px" Style="left: 95px;
        position: absolute; top: 483px" TextMode="MultiLine" Width="500px"></asp:TextBox>
    <asp:Button ID="Update" runat="server" Style="left: 0px; position: absolute; top: 558px"
        Text="Update" />
    <asp:Button ID="Cancel" runat="server" Style="left: 95px; position: absolute; top: 558px"
        Text="Cancel" />
    <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>"
        SelectCommand="SELECT * FROM [Administrator]"></asp:SqlDataSource>
</asp:Content>

