<%@ Page Language="VB" MasterPageFile="~/Student.master" AutoEventWireup="false" CodeFile="DiscussionForumStudent.aspx.vb" Inherits="DiscussionForumStudent" title="Discussion Forum" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
 <asp:Label ID="HeadingLabel" runat="server" BackColor="#507CD1" ForeColor="White"
        Style="vertical-align: middle; text-align: center" Text="Discussion Forum" Width="706px"></asp:Label>
   <br />
   <br />
   <table>
   <tr >
   <td valign ="top">
   <asp:Image ID="ProfilePicture" runat="server" Height="120px" Width="100px" />
   </td>
   <td valign ="top">
   <table>
   <tr>
   <td valign ="top" >
   <asp:Label ID="StartLabel" runat="server" Text="Start a New Discussion Thread" Font-Underline="True"></asp:Label>
   </td>
   </tr>
   <tr>
   <td valign ="top">
   <asp:TextBox ID="Discussion" runat="server" BackColor="#FBF99B" TextMode="MultiLine"
        Width="520px" Height="90px"></asp:TextBox>
   </td>
   </tr>
   </table>
   </td>
   <td >
    <asp:Button ID="PostTopic" runat="server" Text="Post" Width="50px" />
   </td>
   </tr>
   </table>
   <br />
   <asp:Label ID="DiscussionHeading" runat="server" Text="Active Discussion Threads" Font-Bold="False" Font-Underline="True"></asp:Label>
   <br />
   <br />
   <asp:Literal ID="Literal1" runat="server"></asp:Literal>
   <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>" SelectCommand="SELECT * FROM [Discussion_Threads]"></asp:SqlDataSource>
   <asp:SqlDataSource ID="SDS1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>"
        SelectCommand="SELECT * FROM [Administrator]"></asp:SqlDataSource>
   <asp:Label ID="PosterId" runat="server" Visible="False"></asp:Label>
   <asp:Label ID="PosterName" runat="server" Visible="False"></asp:Label>
   <asp:Label ID="PosterPosition" runat="server" Visible="False"></asp:Label>
</asp:Content>

