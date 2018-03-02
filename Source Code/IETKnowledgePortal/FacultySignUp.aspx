<%@ Page Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="FacultySignUp.aspx.vb" Inherits="FacultySignUp" title="Sign Up" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <asp:Label ID="SignUpLabel" runat="server" BackColor="#507CD1" ForeColor="White"
        Style="left: 0px; vertical-align: middle; position: absolute; top: 0px; text-align: center"
        Text="Sign Up Request" Width="706px"></asp:Label>
    <asp:Label ID="EmployeeNoLabel" runat="server"
        Style="left: 5px; vertical-align: middle; position: absolute; top: 35px; text-align: justify"
        Width="98px">Employee No:</asp:Label>
    <asp:TextBox ID="EmployeeNo" runat="server" BackColor="#FBF99B" Style="left: 140px;
        position: absolute; top: 35px" Width="144px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="EmployeeValidator" runat="server" ControlToValidate="EmployeeNo"
        ErrorMessage="Employee No is required." Style="left: 290px; position: absolute;
        top: 35px" ToolTip="Employee No is required.">*</asp:RequiredFieldValidator>
    <asp:Label ID="DepartmentLabel" runat="server" Style="left: 350px;
        vertical-align: middle; position: absolute; top: 35px; text-align: justify">Department:</asp:Label>
    <asp:DropDownList ID="Department" runat="server" BackColor="#FBF99B" Style="left: 485px;
        position: absolute; top: 35px" Width="151px">
        <asp:ListItem>Computer Engg.</asp:ListItem>
        <asp:ListItem>E &amp; TC Engg.</asp:ListItem>
        <asp:ListItem>IT Engg.</asp:ListItem>
        <asp:ListItem>E &amp; I Engg.</asp:ListItem>
        <asp:ListItem>Mechanical Engg.</asp:ListItem>
        <asp:ListItem>Civil Engg.</asp:ListItem>
        <asp:ListItem>Applied Sciences</asp:ListItem>
    </asp:DropDownList>    
    <asp:Label ID="NameLabel" runat="server" AssociatedControlID="Name" Style="left: 5px;
        vertical-align: middle; position: absolute; top: 65px; text-align: justify">Full Name:</asp:Label>
    <asp:TextBox ID="Name" runat="server" BackColor="#FBF99B" Style="left: 140px;
        position: absolute; top: 65px" Width="144px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="NameValidator" runat="server" ControlToValidate="Name"
        ErrorMessage="Name is required." Style="left: 290px; position: absolute;
        top: 65px" ToolTip="Name is required.">*</asp:RequiredFieldValidator>
    <asp:Label ID="DesignationLabel" runat="server" Style="left: 350px;
        vertical-align: middle; position: absolute; top: 65px; text-align: justify">Designation:</asp:Label>
    <asp:DropDownList ID="Designation" runat="server" BackColor="#FBF99B"
        Style="left: 485px; position: absolute; top: 65px" Width="150px">
        <asp:ListItem>Professor</asp:ListItem>
        <asp:ListItem>Reader</asp:ListItem>
        <asp:ListItem>Lecturer</asp:ListItem>
    </asp:DropDownList>   
     
    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" Style="left: 5px;
        position: absolute; top: 95px; vertical-align: middle; text-align: justify;">Desired User Id:</asp:Label>
    <asp:TextBox ID="UserName" runat="server" BackColor="#FBF99B" Style="left: 140px;
        position: absolute; top: 95px" Width="144px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
        ErrorMessage="User Name is required." Style="position: absolute; left: 290px; top: 95px;" ToolTip="User Name is required.">*</asp:RequiredFieldValidator>
   
    <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email" Style="left: 350px;
        position: absolute; top: 95px; vertical-align: middle; text-align: justify;">Email Id:</asp:Label>
    <asp:TextBox ID="Email" runat="server" BackColor="#FBF99B" Style="left: 485px; position: absolute;
        top: 95px" Width="144px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="EmailValidator" runat="server" ControlToValidate="Email"
        ErrorMessage="E-mail is required." Style="left: 635px; position: absolute;
        top: 95px" ToolTip="E-mail is required.">*</asp:RequiredFieldValidator>
    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" Style="left: 5px;
        position: absolute; top: 125px; vertical-align: middle; text-align: justify;">Password:</asp:Label>
    <asp:TextBox ID="Password" runat="server" BackColor="#FBF99B" Style="left: 140px;
        position: absolute; top: 125px" TextMode="Password" Width="144px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
        ErrorMessage="Password is required." Style="left: 290px; position: absolute;
        top: 125px" ToolTip="Password is required.">*</asp:RequiredFieldValidator>
    <asp:Label ID="MobileLabel" runat="server" AssociatedControlID="Mobile" Style="left: 350px;
        position: absolute; top: 125px; vertical-align: middle; text-align: justify;" Width="78px">Mobile No:</asp:Label>
    <asp:TextBox ID="Mobile" runat="server" BackColor="#FBF99B" Style="left: 485px; position: absolute;
        top: 125px" Width="144px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="MobileValidator" runat="server" ControlToValidate="Mobile"
        ErrorMessage="Mobile no is required." Style="left: 635px; position: absolute; top: 125px"
        ToolTip="Mobile no is required.">*</asp:RequiredFieldValidator>
    <asp:RangeValidator ID="MobileValidator1" runat="server" ControlToValidate="Mobile"
        ErrorMessage="Enter a 10 digit mobile no." Font-Size="Smaller" MaximumValue="9999999999"
        MinimumValue="1000000000" Style="left: 485px; position: absolute; top: 144px; vertical-align: middle; text-align: justify;"
        Type="Double" Width="153px"></asp:RangeValidator>
   
    <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword"
        Style="left: 5px; position: absolute; top: 155px; vertical-align: middle; text-align: justify;">Confirm Password:</asp:Label>
    <asp:TextBox ID="ConfirmPassword" runat="server" BackColor="#FBF99B" Style="left: 140px;
        position: absolute; top: 155px" TextMode="Password" Width="144px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword"
        ErrorMessage="Confirm Password is required." Style="left: 290px; position: absolute;
        top: 155px" ToolTip="Confirm Password is required.">*</asp:RequiredFieldValidator>        
   
    <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question" Style="left: 5px;
        position: absolute; top: 185px; vertical-align: middle; text-align: justify;">Security Question:</asp:Label>
    <asp:TextBox ID="Question" runat="server" BackColor="#FBF99B" Style="left: 140px;
        position: absolute; top: 185px" Width="144px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question"
        ErrorMessage="Security question is required." Style="left: 290px; position: absolute;
        top: 185px" ToolTip="Security question is required.">*</asp:RequiredFieldValidator>
    
    <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer" Style="left: 5px;
        position: absolute; top: 215px; vertical-align: middle; text-align: justify;">Security Answer:</asp:Label>
    <asp:TextBox ID="Answer" runat="server" BackColor="#FBF99B" Style="left: 140px; position: absolute;
        top: 215px" Width="144px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer"
        ErrorMessage="Security answer is required." ToolTip="Security answer is required." style="left: 290px; position: absolute; top: 215px">*</asp:RequiredFieldValidator>
   
    <asp:Label ID="ImageLabel" runat="server" AssociatedControlID="Image" Height="48px" Style="left: 5px;
        vertical-align: middle; position: absolute; top: 245px; text-align: justify" Width="129px">Enter The Text Shown in The Image:</asp:Label>
    <asp:Image ID="Image" runat="server" Height="39px" ImageUrl="~/images/validationimage/validationimage.jpg" Style="left: 140px;
        position: absolute; top: 245px" Width="149px" />
    <asp:TextBox ID="ImageText" runat="server" BackColor="#FBF99B" Style="left: 295px;
        position: absolute; top: 259px" Width="144px"></asp:TextBox>
    <asp:Label ID="InvalidStringLabel" runat="server" Style="left: 295px; vertical-align: middle;
        color: red; position: absolute; top: 283px; text-align: justify" Text="Invalid String!"
        Visible="False" Width="103px" Height="9px" Font-Size="Smaller"></asp:Label>
    
    <asp:Button ID="SignUpButton" runat="server" Style="left: 20px; position: absolute; top: 306px"
        Text="Sign Up" />
    <asp:Button ID="RefreshImageButton" runat="server" CausesValidation="False" Height="22px" Style="left: 451px;
        position: absolute; top: 259px" Text="Refresh Image" Width="98px" />    
      
 
    <asp:RegularExpressionValidator ID="EmailValidator1" runat="server" ControlToValidate="Email"
        ErrorMessage="Enter a valid email address" Font-Size="Smaller" Style="left: 295px;
        position: absolute; top: 317px; vertical-align: middle; text-align: justify;" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
        Width="151px">Enter a valid email address</asp:RegularExpressionValidator>
    <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password"
        ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match."
        Font-Size="Smaller" Style="left: 295px; position: absolute; top: 344px; vertical-align: middle; text-align: justify;"
        Width="295px" Height="2px"></asp:CompareValidator> 
    <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>"
        SelectCommand="SELECT * FROM [Faculty]"></asp:SqlDataSource>
    <asp:Label ID="EmailSentLabel" runat="server" Style="left: 5px; vertical-align: middle;
        position: absolute; top: 35px; text-align: justify" Text="A verification code has been sent to your email account. Enter this code in the textbox below."
        Visible="False"></asp:Label>
    <asp:TextBox ID="VerificationCode" runat="server" BackColor="#FBF99B" Style="left: 140px;
        position: absolute; top: 65px" Visible="False" Width="144px"></asp:TextBox>
    <asp:Button ID="VerifyCode" runat="server" Style="left: 350px; position: absolute; top: 65px"
        Text="Submit" CausesValidation="False" Visible="False" />
    <asp:Label ID="InvalidCodeLabel" runat="server" AssociatedControlID="VerificationCode"
        Style="left: 140px; vertical-align: middle; color: red; position: absolute; top: 95px;
        text-align: justify" Visible="False">The code you entered is invalid!</asp:Label>
    <asp:Label ID="AccountCreatedLabel" runat="server" Style="left: 0px; vertical-align: middle;
        position: absolute; top: 35px; text-align: justify" Text="Your Account information has been successfully sent to the Portal Administrator. Your account will be automatically activated after the administrator confirms your request."
        Visible="False" Width="706px"></asp:Label>   
    <asp:Label ID="imagestring" runat="server" Style="left: 569px; position: absolute;
        top: 263px" Visible="False"></asp:Label>
    <asp:Label ID="vcode" runat="server" Style="left: 570px; position: absolute; top: 287px"
        Visible="False"></asp:Label>
    <asp:Label ID="pass" runat="server" Style="left: 570px; position: absolute; top: 311px"
        Visible="False"></asp:Label>
</asp:Content>

