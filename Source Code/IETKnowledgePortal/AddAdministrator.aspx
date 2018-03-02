<%@ Page Language="VB" MasterPageFile="~/Admin.master" AutoEventWireup="false" CodeFile="AddAdministrator.aspx.vb" Inherits="AddAdministrator" title="Add Administrator" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <asp:Label ID="HeadingLabel" runat="server" BackColor="#507CD1" ForeColor="White"
        Style="left: 0px; vertical-align: middle; position: absolute; top: 0px; text-align: center"
        Text="Add Administrator" Width="706px"></asp:Label>
    <asp:Label ID="UserIdLabel" runat="server" Style="left: 5px; position: absolute;
        top: 30px" Text="User Id:"></asp:Label>
    <asp:Label ID="NameLabel" runat="server" AssociatedControlID="Name" Style="left: 5px;
        vertical-align: middle; position: absolute; top: 70px; text-align: justify">Full Name:</asp:Label>
    <asp:RequiredFieldValidator ID="NameValidator" runat="server" ControlToValidate="Name"
        ErrorMessage="Name is required." Style="left: 250px; position: absolute; top: 70px"
        ToolTip="Name is required.">*</asp:RequiredFieldValidator>
    <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email" Style="left: 5px;
        vertical-align: middle; position: absolute; top: 150px; text-align: justify" Width="59px">Email Id:</asp:Label>
    <asp:TextBox ID="Email" runat="server" BackColor="#FBF99B" Style="left: 95px; position: absolute;
        top: 150px" Width="144px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="EmailValidator" runat="server" ControlToValidate="Email"
        ErrorMessage="E-mail is required." Style="left: 250px; position: absolute; top: 150px"
        ToolTip="E-mail is required.">*</asp:RequiredFieldValidator>
    <asp:Label ID="DesignationLabel" runat="server" AssociatedControlID="Designation"
        Style="left: 5px; vertical-align: middle; position: absolute; top: 110px; text-align: justify">Designation:</asp:Label>
    <asp:TextBox ID="Designation" runat="server" BackColor="#FBF99B" Style="left: 95px;
        position: absolute; top: 110px" Width="144px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="DesignationRequired" runat="server" ControlToValidate="Designation"
        ErrorMessage="Designation is required." Style="left: 250px; position: absolute;
        top: 110px" ToolTip="Designation is required.">*</asp:RequiredFieldValidator>
    <asp:Label ID="MobileLabel" runat="server" AssociatedControlID="Mobile" Style="left: 5px;
        vertical-align: middle; position: absolute; top: 190px; text-align: justify"
        Width="72px">Mobile No:</asp:Label>
    <asp:TextBox ID="Mobile" runat="server" BackColor="#FBF99B" Style="left: 95px; position: absolute;
        top: 190px" Width="144px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="MobileValidator" runat="server" ControlToValidate="Mobile"
        ErrorMessage="Mobile no is required." Style="left: 250px; position: absolute;
        top: 190px" ToolTip="Mobile no is required.">*</asp:RequiredFieldValidator>
    <asp:RangeValidator ID="MobileValidator1" runat="server" ControlToValidate="Mobile"
        ErrorMessage="Enter a 10 digit mobile no." Font-Size="Smaller" MaximumValue="9999999999"
        MinimumValue="1000000000" Style="left: 275px; vertical-align: middle; position: absolute;
        top: 190px; text-align: justify" Type="Double" Width="153px"></asp:RangeValidator>
    <asp:RegularExpressionValidator ID="EmailValidator1" runat="server" ControlToValidate="Email"
        ErrorMessage="Enter a valid email address" Font-Size="Smaller" Style="left: 275px;
        vertical-align: middle; position: absolute; top: 150px; text-align: justify"
        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Width="151px">Enter a valid email address</asp:RegularExpressionValidator>
    <asp:TextBox ID="Name" runat="server" BackColor="#FBF99B" Style="left: 95px; position: absolute;
        top: 70px" Width="144px"></asp:TextBox>
    <asp:Button ID="Add" runat="server" Style="left: 5px; position: absolute; top: 230px"
        Text="Add Administrator" Width="129px" />
    <asp:TextBox ID="UserId" runat="server" BackColor="#FBF99B" Style="left: 95px; position: absolute;
        top: 30px" Width="144px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="UserValidator" runat="server" ControlToValidate="UserId"
        ErrorMessage="User Id is required." Style="left: 250px; position: absolute; top: 30px"
        ToolTip="User Id is required.">*</asp:RequiredFieldValidator>
    <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>"
        SelectCommand="SELECT * FROM [Administrator]"></asp:SqlDataSource>
</asp:Content>

