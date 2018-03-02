<%@ Page Language="VB" MasterPageFile="~/Admin.master" AutoEventWireup="false" CodeFile="UpdateSecurityInfoAdmin.aspx.vb" Inherits="UpdateSecurityInfoAdmin" title="Update Security Information" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <asp:Label ID="HeadingLabel" runat="server" BackColor="#507CD1" ForeColor="White"
        Style="left: 0px; vertical-align: middle; position: absolute; top: 0px; text-align: center"
        Text="Update Security Information" Width="706px"></asp:Label>
    <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question" Style="left: 5px;
        vertical-align: middle; position: absolute; top: 40px; text-align: justify">Security Question:</asp:Label>
    <asp:TextBox ID="Question" runat="server" BackColor="#FBF99B" Style="left: 140px;
        position: absolute; top: 40px" Width="144px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question"
        ErrorMessage="Security question is required." Style="left: 290px; position: absolute;
        top: 40px" ToolTip="Security question is required.">*</asp:RequiredFieldValidator>
    <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer" Style="left: 5px;
        vertical-align: middle; position: absolute; top: 80px; text-align: justify">Security Answer:</asp:Label>
    <asp:TextBox ID="Answer" runat="server" BackColor="#FBF99B" Style="left: 140px; position: absolute;
        top: 80px" Width="144px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer"
        ErrorMessage="Security answer is required." Style="left: 290px; position: absolute;
        top: 80px" ToolTip="Security answer is required.">*</asp:RequiredFieldValidator>
    <asp:Button ID="Update" runat="server" Style="left: 5px; position: absolute; top: 130px"
        Text="Update" />
    <asp:Button ID="Cancel" runat="server" CausesValidation="False" Style="left: 140px;
        position: absolute; top: 130px" Text="Cancel" />
    <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>"
        SelectCommand="SELECT * FROM [Administrator]"></asp:SqlDataSource>
</asp:Content>

