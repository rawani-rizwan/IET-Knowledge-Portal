<%@ Page Language="VB" MasterPageFile="~/Student.master" AutoEventWireup="false" CodeFile="ViewDiscussionStudent.aspx.vb" Inherits="ViewDiscussionStudent" title="Discussion Forum" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
 <asp:Label ID="HeadingLabel" runat="server" BackColor="#507CD1" ForeColor="White"
        Style="vertical-align: middle; text-align: center" Text="Discussion Forum" Width="706px"></asp:Label>
    <br /> <br />
    <asp:Literal ID="TopicLiteral" runat="server"></asp:Literal><br />
    <asp:Label ID="Replies" runat="server" Font-Underline="True" Text="Replies:"></asp:Label><br /><br />
    <asp:Literal ID="ReplyLiteral" runat="server"></asp:Literal><br />
    <table >
        <tr>
            <td valign="top">
                <asp:Image ID="ProfilePicture" runat="server" Height="120px" Width="100px" />
            </td>
            <td valign="top">
                <table>
                    <tr>
                        <td valign="top">
                            <asp:Label ID="ReplyLabel" runat="server" Text="Post a Reply" Font-Underline="True"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <asp:TextBox ID="Reply" runat="server" BackColor="#FBF99B" Height="90px" TextMode="MultiLine"
                                Width="520px"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                <asp:Button ID="PostReply" runat="server" Text="Reply" Width="50px" />
            </td>
        </tr>
    </table>
    <br /><br />
    <asp:Button ID="Back" runat="server" Text="Back" />
    <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>"
        SelectCommand="SELECT * FROM [Discussion_Threads]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SDS1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>"
        SelectCommand="SELECT * FROM [Discussion_Threads]"></asp:SqlDataSource>
    <asp:Label ID="TopicId" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="PosterId" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="PosterName" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="PosterPosition" runat="server" Visible="False"></asp:Label>&nbsp;
    <asp:Label ID="Flag" runat="server" Visible="False">0</asp:Label>
</asp:Content>

