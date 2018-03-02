<%@ Page Language="VB" MasterPageFile="~/Faculty.master" AutoEventWireup="false" CodeFile="ShowNoticeFaculty.aspx.vb" Inherits="ShowNoticeFaculty" title="View Notice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
<asp:Label ID="HeadingLabel" runat="server" Text="Notice Board" Width="706px" style="vertical-align: middle; text-align: center" BackColor="#507CD1" ForeColor="White"></asp:Label>
    <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>"
        SelectCommand="SELECT * FROM [Notices]"></asp:SqlDataSource>
    <table cellspacing="20">
    <tr>
    <td valign ="top">
    <asp:Label ID="DateLabel" runat="server" Text="Date:" Width="60px" Font-Underline="False"></asp:Label> 
    </td>
    <td valign ="top">
    <asp:Label ID="DatePosted" runat="server" Width="500px"></asp:Label>
    </td>
    </tr>
    <tr>
    <td valign ="top">
    <asp:Label ID="SubjectLabel" runat="server" Text="Subject:" Width="60px" Font-Underline="False"></asp:Label>
    </td>
    <td valign ="top">
    <asp:Label ID="Subject" runat="server" Width="500px"></asp:Label>
    </td>
    </tr>
    
    </table>
    <br />
    &nbsp; &nbsp; &nbsp;<asp:Label ID="Notice" runat="server" Width="585px"></asp:Label>
    
    <br />
    <br />
    <br />
    &nbsp; &nbsp;&nbsp;
    <asp:Button ID="Delete" runat="server" Text="Delete Notice" Visible="False" />
    &nbsp; &nbsp; &nbsp;
    <asp:Button ID="Back" runat="server" Text="Back" Width="71px" />&nbsp;
    <asp:Label ID="NoticeId" runat="server" Visible="False"></asp:Label>
</asp:Content>

