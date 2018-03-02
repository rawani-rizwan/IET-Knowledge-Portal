<%@ Page Language="VB" MasterPageFile="~/Admin.master" AutoEventWireup="false" CodeFile="FileDetailsAdmin.aspx.vb" Inherits="FileDetailsAdmin" title="File Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <asp:Label ID="HeadingLabel" runat="server" Text="File Details" Width="706px" style="vertical-align: middle; text-align: center" BackColor="#507CD1" ForeColor="White"></asp:Label>
    <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>"
        SelectCommand="SELECT * FROM [Files]"></asp:SqlDataSource>
    <table cellspacing="20">
    <tr>
    <td valign ="top">
    <asp:Label ID="FileNameLabel" runat="server" Text="File Name:" Width="100px" Font-Underline="False"></asp:Label> 
    </td>
    <td valign ="top">
    <asp:Label ID="FileName" runat="server" Width="480px"></asp:Label>
    </td>
    </tr>
    <tr>
    <td valign ="top">
    <asp:Label ID="TitleLabel" runat="server" Text="Title:" Width="100px" Font-Underline="False"></asp:Label>
    </td>
    <td valign ="top">
    <asp:Label ID="TitleText" runat="server" Width="480px"></asp:Label>
    </td>
    </tr>
    <tr>
    <td valign ="top">
    <asp:Label ID="CategoryLabel" runat="server" Text="Category:" Width="100px" Font-Underline="False"></asp:Label>
    </td>
    <td valign ="top">
    <asp:Label ID="Category" runat="server" Width="480px"></asp:Label>
    </td>
    </tr>
    <tr>
    <td valign ="top">
    <asp:Label ID="UploadedByLabel" runat="server" Text="Uploaded By:" Width="100px" Font-Underline="False"></asp:Label>
    </td>
    <td valign ="top">
    <asp:Label ID="UploadedBy" runat="server" Width="480px"></asp:Label>
    </td>
    </tr>
    <tr>
    <td valign ="top">
    <asp:Label ID="DateUploadedLabel" runat="server" Text="Date Uploaded:" Width="100px" Font-Underline="False"></asp:Label>
    </td>
    <td valign ="top">
    <asp:Label ID="DateUploaded" runat="server" Width="480px"></asp:Label>
    </td>
    </tr>
    <tr>
    <td valign ="top">
    <asp:Label ID="AuthorLabel" runat="server" Text="Author:" Width="100px" Font-Underline="False"></asp:Label>
    </td>
    <td valign ="top">
    <asp:Label ID="Author" runat="server" Width="480px"></asp:Label>
    </td>
    </tr>
    <tr>
    <td valign ="top">
    <asp:Label ID="PublisherLabel" runat="server" Text="Publisher:" Width="100px" Font-Underline="False"></asp:Label>
    </td>
    <td valign ="top">
    <asp:Label ID="Publisher" runat="server" Width="480px"></asp:Label>
    </td>
    </tr>
    <tr>
    <td valign ="top">
    <asp:Label ID="DescriptionLabel" runat="server" Text="Description:" Width="100px" Font-Underline="False"></asp:Label>
    </td>
    <td valign ="top">
    <asp:Label ID="Description" runat="server" Width="480px"></asp:Label>
    </td>
    </tr>
    </table>
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:HyperLink ID="ViewFile" runat="server" Font-Underline="True" ForeColor="Blue" Target="_blank">View File</asp:HyperLink>
    &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
    <asp:Button ID="Download" runat="server" Text="Download" />
    &nbsp; &nbsp;&nbsp;&nbsp;<asp:Button ID="Delete" runat="server" Text="Delete File" />
    &nbsp; &nbsp; &nbsp;
    <asp:Button ID="Back" runat="server" Text="Back" Width="71px" />
    <asp:Label ID="filepath" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="FileId" runat="server" Visible="False"></asp:Label>
</asp:Content>

