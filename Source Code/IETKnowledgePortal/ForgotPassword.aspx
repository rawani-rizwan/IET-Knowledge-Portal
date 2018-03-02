<%@ Page Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="ForgotPassword.aspx.vb" Inherits="ForgotPassword" title="Password Recovery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <asp:Label ID="PasswordRecoveryLabel" runat="server" BackColor="#507CD1" ForeColor="White"
        Style="left: 0px; vertical-align: middle; position: absolute; top: 0px; text-align: center"
        Text="Password Recovery" Width="706px"></asp:Label>
    <asp:Label ID="AcountTypeLabel" runat="server" Style="left: 5px; vertical-align: middle;
        position: absolute; top: 35px; text-align: center" Text="Select Account Type:"></asp:Label>
    <asp:DropDownList ID="UserType" runat="server" Style="left: 150px; position: absolute;
        top: 35px" Width="149px">
        <asp:ListItem Selected="True">Student</asp:ListItem>
        <asp:ListItem>Faculty</asp:ListItem>
        <asp:ListItem>Administrator</asp:ListItem>
    </asp:DropDownList>
    <asp:Label ID="UserIdLabel" runat="server" Style="left: 310px; vertical-align: middle;
        position: absolute; top: 35px; text-align: center" Text="Enter User Id:"></asp:Label>
    <asp:TextBox ID="UserName" runat="server" Style="left: 405px; position: absolute;
        top: 35px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="UserIdValidator" runat="server" ControlToValidate="UserName"
        ErrorMessage="User Id is required" Style="left: 562px; position: absolute; top: 35px"
        Width="7px">*</asp:RequiredFieldValidator>
    <asp:Label ID="QuestionLabel" runat="server" Style="left: 5px; vertical-align: middle;
        position: absolute; top: 75px; text-align: center" Text="Security Question:"
        Visible="False"></asp:Label>
    <asp:Label ID="Question" runat="server" Style="left: 150px; vertical-align: middle;
        position: absolute; top: 75px; text-align: center" Text="Question" Visible="False"></asp:Label>
    <asp:Button ID="SubmitUserId" runat="server" Style="left: 594px; position: absolute;
        top: 35px" Text="Submit" />
    <asp:Label ID="AnswerLabel" runat="server" Style="left: 5px; vertical-align: middle;
        position: absolute; top: 115px; text-align: center" Text="Security Answer:" Visible="False"></asp:Label>
    <asp:TextBox ID="Answer" runat="server" Style="left: 150px; position: absolute; top: 115px"
        Visible="False" Width="142px"></asp:TextBox>
    <asp:Button ID="Submit" runat="server" Style="left: 5px; position: absolute; top: 216px"
        Text="Submit" Visible="False" />
    <asp:Label ID="InvalidUserLabel" runat="server" Style="left: 438px; vertical-align: middle;
        color: red; position: absolute; top: 61px; text-align: center" Text="Invalid User Id:"
        Visible="False"></asp:Label>
    <asp:Label ID="WrongAnswerLabel" runat="server" Style="left: 310px; vertical-align: middle;
        color: red; position: absolute; top: 115px; text-align: center" Text="Wrong Answer!"
        Visible="False"></asp:Label>
    <asp:Label ID="ImageLabel" runat="server" AssociatedControlID="Image" Height="48px"
        Style="left: 5px; vertical-align: middle; position: absolute; top: 155px; text-align: justify"
        Visible="False" Width="129px">Enter The Text Shown in The Image:</asp:Label>
    <asp:Image ID="Image" runat="server" Height="39px" ImageUrl="~/images/validationimage/validationimage.jpg"
        Style="left: 150px; position: absolute; top: 155px" Visible="False" Width="149px" />
    <asp:TextBox ID="ImageText" runat="server" BackColor="#FBF99B" Style="left: 309px;
        position: absolute; top: 164px" Visible="False" Width="144px"></asp:TextBox>
    <asp:Label ID="InvalidStringLabel" runat="server" Font-Size="Smaller" Height="9px"
        Style="left: 340px; vertical-align: middle; color: red; position: absolute; top: 189px;
        text-align: justify" Text="Invalid String!" Visible="False" Width="82px"></asp:Label>
    <asp:Button ID="RefreshImageButton" runat="server" CausesValidation="False" Height="22px"
        Style="left: 474px; position: absolute; top: 164px" Text="Refresh Image" Visible="False"
        Width="98px" />
    &nbsp;
    <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>"
        SelectCommand="SELECT * FROM [Student]"></asp:SqlDataSource>
    <asp:Label ID="imagestring" runat="server" Style="left: 604px; position: absolute;
        top: 182px" Visible="False"></asp:Label>
</asp:Content>

