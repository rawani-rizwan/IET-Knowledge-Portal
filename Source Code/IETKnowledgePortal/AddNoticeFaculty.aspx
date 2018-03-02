<%@ Page Language="VB" MasterPageFile="~/Faculty.master" AutoEventWireup="false" CodeFile="AddNoticeFaculty.aspx.vb" Inherits="AddNoticeFaculty" title="Add Notice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
<asp:Label ID="HeadingLabel" runat="server" BackColor="#507CD1" ForeColor="White"
        Style="left: 0px; vertical-align: middle; position: absolute; top: 0px; text-align: center"
        Width="706px">Notice Board</asp:Label>
    <asp:Label ID="SubjectLabel" runat="server" Style="left: 0px; position: absolute;
        top: 45px" Text="Subject:"></asp:Label>
    <asp:Label ID="NoticeLabel" runat="server" Style="left: 0px; position: absolute;
        top: 85px" Text="Notice:"></asp:Label>
    <asp:TextBox ID="Subject" runat="server" BackColor="#FBF99B" Style="left: 80px; position: absolute;
        top: 45px" Width="550px"></asp:TextBox>
    <asp:TextBox ID="Notice" runat="server" BackColor="#FBF99B" Height="147px" Style="left: 80px;
        position: absolute; top: 85px" TextMode="MultiLine" Width="550px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="Subjectvalidator" runat="server" ControlToValidate="Subject"
        ErrorMessage="*" Style="left: 635px; position: absolute; top: 45px"></asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="NoticeValidator" runat="server" ControlToValidate="Notice"
        ErrorMessage="*" Style="left: 635px; position: absolute; top: 85px"></asp:RequiredFieldValidator>
    <asp:Label ID="Visibility" runat="server" Style="left: 5px; vertical-align: middle;
        position: absolute; top: 270px; text-align: justify" Width="87px">Set Visibility:</asp:Label>
    <asp:Label ID="Faculty" runat="server" Style="left: 5px; position: absolute; top: 310px">Faculty:</asp:Label>
    <asp:Label ID="DepartmentLabel" runat="server" Style="left: 5px; vertical-align: middle;
        position: absolute; top: 340px; text-align: justify" Width="90px">Departments:</asp:Label>
    <asp:CheckBoxList ID="Department" runat="server" RepeatColumns="4" Style="left: 110px;
        position: absolute; top: 335px" Width="516px">
        <asp:ListItem>Computer Engg.</asp:ListItem>
        <asp:ListItem>E &amp; TC Engg.</asp:ListItem>
        <asp:ListItem>IT Engg.</asp:ListItem>
        <asp:ListItem>E &amp; I Engg.</asp:ListItem>
        <asp:ListItem>Mechanical Engg.</asp:ListItem>
        <asp:ListItem>Civil Engg.</asp:ListItem>
        <asp:ListItem>Applied Sciences</asp:ListItem>
    </asp:CheckBoxList>
    <asp:Label ID="Student" runat="server" Style="left: 5px; position: absolute; top: 420px">Students:</asp:Label>
    <asp:Label ID="YearLabel" runat="server" Style="left: 5px; vertical-align: middle;
        position: absolute; top: 450px; text-align: justify" Width="90px">Year:</asp:Label>
    <asp:CheckBoxList ID="Year" runat="server" RepeatColumns="4" Style="left: 110px;
        position: absolute; top: 445px" Width="516px">
        <asp:ListItem>I</asp:ListItem>
        <asp:ListItem>II</asp:ListItem>
        <asp:ListItem>III</asp:ListItem>
        <asp:ListItem>IV</asp:ListItem>
    </asp:CheckBoxList>
    <asp:Label ID="BranchesLabel" runat="server" Style="left: 5px; vertical-align: middle;
        position: absolute; top: 490px; text-align: justify" Width="90px">Branch:</asp:Label>
    <asp:CheckBoxList ID="Branch" runat="server" RepeatColumns="4" Style="left: 110px;
        position: absolute; top: 485px" Width="516px">
        <asp:ListItem>Computer Engg.</asp:ListItem>
        <asp:ListItem>E &amp; TC Engg.</asp:ListItem>
        <asp:ListItem>IT Engg.</asp:ListItem>
        <asp:ListItem>E &amp; I Engg.</asp:ListItem>
        <asp:ListItem>Mechanical Engg.</asp:ListItem>
        <asp:ListItem>Civil Engg.</asp:ListItem>
    </asp:CheckBoxList>
    <asp:Button ID="Add" runat="server" Style="left: 5px; position: absolute; top: 570px"
        Text="Add Notice" />
    <asp:Button ID="Cancel" runat="server" CausesValidation="False" Style="left: 115px;
        position: absolute; top: 570px" Text="Cancel" />
    <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>"
        SelectCommand="SELECT * FROM [Notices]"></asp:SqlDataSource>
</asp:Content>

