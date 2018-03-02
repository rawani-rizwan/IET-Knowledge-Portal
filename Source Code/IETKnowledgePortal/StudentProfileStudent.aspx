<%@ Page Language="VB" MasterPageFile="~/Student.master" AutoEventWireup="false" CodeFile="StudentProfileStudent.aspx.vb" Inherits="StudentProfileStudent" title="Student Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
<asp:Image ID="ProfilePicture" runat="server" Style="position: absolute; left: 550px; top: 40px;" Height="160px" Width="140px" ImageUrl="~/images/profile pictures/no_profile.jpg" />
    <asp:Label ID="HeadingLabel" runat="server" Text="Student Profile" Width="706px" style="vertical-align: middle; text-align: center" BackColor="#507CD1" ForeColor="White"></asp:Label>
    <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>"
        SelectCommand="SELECT * FROM [Student]"></asp:SqlDataSource>
    <table cellspacing="20">
    <tr>
    <td valign ="top">
    <asp:Label ID="UserIdLabel" runat="server" Text="User Id:" Width="100px" Font-Underline="False"></asp:Label> 
    </td>
    <td valign ="top">
    <asp:Label ID="UserId" runat="server" Width="380px"></asp:Label>
    </td>
    </tr>
    <tr>
    <td valign ="top">
    <asp:Label ID="EnrollmentNoLabel" runat="server" Text="Enrollment No:" Width="100px" Font-Underline="False"></asp:Label>
    </td>
    <td valign ="top">
    <asp:Label ID="EnrollmentNo" runat="server" Width="380px"></asp:Label>
    </td>
    </tr>
    <tr>
    <td valign ="top">
    <asp:Label ID="ScholarNoLabel" runat="server" Text="Scholar No:" Width="100px" Font-Underline="False"></asp:Label>
    </td>
    <td valign ="top">
    <asp:Label ID="ScholarNo" runat="server" Width="380px"></asp:Label>
    </td>
    </tr>
    <tr>
    <td valign ="top">
    <asp:Label ID="RollNoLabel" runat="server" Text="Roll No:" Width="100px" Font-Underline="False"></asp:Label>
    </td>
    <td valign ="top">
    <asp:Label ID="RollNo" runat="server" Width="380px"></asp:Label>
    </td>
    </tr>
    <tr>
    <td valign ="top">
    <asp:Label ID="NameLabel" runat="server" Text="Name:" Width="100px" Font-Underline="False"></asp:Label>
    </td>
    <td valign ="top">
    <asp:Label ID="Name" runat="server" Width="380px"></asp:Label>
    </td>
    </tr>
    <tr>
    <td valign ="top">
    <asp:Label ID="YearLabel" runat="server" Text="Year:" Width="100px" Font-Underline="False"></asp:Label>
    </td>
    <td valign ="top">
    <asp:Label ID="Year" runat="server" Width="380px"></asp:Label>
    </td>
    </tr>
    <tr>
    <td valign ="top">
    <asp:Label ID="BranchLabel" runat="server" Text="Branch:" Width="100px" Font-Underline="False"></asp:Label>
    </td>
    <td valign ="top">
    <asp:Label ID="Branch" runat="server" Width="380px"></asp:Label>
    </td>
    </tr>
    <tr>
    <td valign ="top">
    <asp:Label ID="EmailLabel" runat="server" Text="Email Id:" Width="100px" Font-Underline="False"></asp:Label>
    </td>
    <td valign ="top">
    <asp:Label ID="Email" runat="server" Width="380px"></asp:Label>
    </td>
    </tr>
    <tr>
    <td valign ="top"><asp:Label ID="MobileLabel" runat="server" Text="Mobile No:" Width="100px" Font-Underline="False"></asp:Label>
    </td>
    <td valign ="top">
    <asp:Label ID="Mobile" runat="server" Width="380px"></asp:Label>
    </td>
    </tr>
    <tr>
    <td valign ="top">
    <asp:Label ID="AboutMeLabel" runat="server" Text="About Me:" Width="100px" Font-Bold="False" Font-Underline="False"></asp:Label>
    </td>
    <td valign ="top">
    <asp:Label ID="AboutMe" runat="server" Width="380px"></asp:Label>
    </td>
    </tr>
    <tr>
    <td valign ="top">
    <asp:Label ID="InterestsLabel" runat="server" Text="Interests:" Width="100px" Font-Bold="False" Font-Underline="False"></asp:Label>
    </td>
    <td valign ="top">
    <asp:Label ID="Interests" runat="server" Width="380px"></asp:Label>
    </td>
    </tr>
    <tr>
    <td valign ="top">
    <asp:Label ID="AchievementsLabel" runat="server" Text="Achievements:" Width="100px" Font-Underline="False"></asp:Label>
    </td>
    <td valign ="top">
    <asp:Label ID="Achievements" runat="server" Width="380px"></asp:Label>
    </td>
    </tr>
    <tr>
    <td valign ="top">
    <asp:Label ID="ProjectsLabel" runat="server" Text="Projects:" Width="100px" Font-Underline="False"></asp:Label>
    </td>
    <td valign ="top">
    <asp:Label ID="Projects" runat="server" Width="380px"></asp:Label>
    </td>
    </tr>
    <tr>
    <td valign ="top">
    <asp:Label ID="PublicationsLabel" runat="server" Text="Publications:" Width="100px" Font-Underline="False"></asp:Label>
    </td>
    <td valign ="top">
    <asp:Label ID="Publications" runat="server" Width="380px"></asp:Label> 
    </td>
    </tr>
    </table>
    <br />
    &nbsp; &nbsp;&nbsp;&nbsp;<asp:Button ID="Back" runat="server" Text="Back" Width="71px" />
</asp:Content>

