<%@ Page Language="VB" MasterPageFile="~/Student.master" AutoEventWireup="false" CodeFile="UploadStudent.aspx.vb" Inherits="UploadStudent" title="File Upload" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <asp:Label ID="HeadingLabel" runat="server" BackColor="#507CD1" ForeColor="White"
        Style="left: 0px; vertical-align: middle; position: absolute; top: 0px; text-align: center"
        Width="706px">Upload File</asp:Label>
    <asp:FileUpload ID="FileUpload1" runat="server" Style="left: 5px; position: absolute;
        top: 35px" Width="316px" BackColor="#FBF99B" />
    <asp:RequiredFieldValidator ID="FileRequired" runat="server" ControlToValidate="FileUpload1"
        ErrorMessage="*" Style="left: 320px; position: absolute; top: 35px"></asp:RequiredFieldValidator>
    <asp:Label ID="SizeExceeded" runat="server" ForeColor="Red" Style="left: 340px; vertical-align: middle;
        position: absolute; top: 35px; text-align: center" Visible="False" Width="229px">The File is larger than 15 MB!</asp:Label>
    <asp:Label ID="Conditions" runat="server" Font-Size="Small" Style="left: 5px; vertical-align: middle;
        position: absolute; top: 55px; text-align: center" Text="(15 MB max.)" Width="232px"></asp:Label>
    <asp:Label ID="Detailsabel" runat="server" Style="left: 5px; vertical-align: middle;
        position: absolute; top: 90px; text-align: justify" Width="138px">Enter relavant Details:</asp:Label>
    <asp:Label ID="CategoryLabel" runat="server" Style="left: 5px; vertical-align: middle;
        position: absolute; top: 130px; text-align: justify">Category:</asp:Label>
    <asp:DropDownList ID="Category" runat="server" BackColor="#FBF99B" Style="left: 85px;
        position: absolute; top: 130px" Width="149px">
        <asp:ListItem>Study Material</asp:ListItem>
        <asp:ListItem>Curriculum</asp:ListItem>
        <asp:ListItem>Assignment</asp:ListItem>
        <asp:ListItem>Question Paper</asp:ListItem>
        <asp:ListItem>Other</asp:ListItem>
    </asp:DropDownList>
    <asp:Label ID="TitleLabel" runat="server" Style="left: 370px; vertical-align: middle;
        position: absolute; top: 130px; text-align: justify">Title:</asp:Label>
    <asp:TextBox ID="TitleText" runat="server" BackColor="#FBF99B" Style="left: 450px; position: absolute;
        top: 130px" Width="144px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="TitleRequired" runat="server" ControlToValidate="TitleText"
        ErrorMessage="*" Style="left: 600px; position: absolute; top: 130px"></asp:RequiredFieldValidator>
    <asp:Label ID="AuthorLabel" runat="server" Style="left: 5px; vertical-align: middle;
        position: absolute; top: 170px; text-align: justify">Author:</asp:Label>
    <asp:TextBox ID="Author" runat="server" BackColor="#FBF99B" Style="left: 85px; position: absolute;
        top: 170px" Width="144px"></asp:TextBox>
    <asp:Label ID="PublisherLabel" runat="server" Style="left: 370px; vertical-align: middle;
        position: absolute; top: 170px; text-align: justify">Publisher:</asp:Label>
    <asp:TextBox ID="Publisher" runat="server" BackColor="#FBF99B" Style="left: 450px;
        position: absolute; top: 170px" Width="144px"></asp:TextBox>
    <asp:Label ID="DescriptionLabel" runat="server" Style="left: 5px;
        vertical-align: middle; position: absolute; top: 217px; text-align: justify">Description:</asp:Label>
    <asp:TextBox ID="Description" runat="server" BackColor="#FBF99B" Style="left: 85px;
        position: absolute; top: 210px" TextMode="MultiLine" Width="144px"></asp:TextBox>
    
   
    <asp:Label ID="Visibility" runat="server" Style="left: 5px; vertical-align: middle;
        position: absolute; top: 270px; text-align: justify" Width="87px">Set Visibility:</asp:Label>
    <asp:Label ID="Faculty" runat="server"  Style="left: 5px; position: absolute;
        top: 310px" >Faculty:</asp:Label>
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
    <asp:Label ID="Student" runat="server"  Style="left: 5px; position: absolute;
        top: 420px" >Students:</asp:Label>
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
    <asp:Button ID="Upload" runat="server" Style="left: 5px; position: absolute; top: 570px"
        Text="Upload" />
    <asp:Button ID="Cancel" runat="server" CausesValidation="False" Style="left: 115px;
        position: absolute; top: 570px" Text="Cancel" />
    <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>"
        SelectCommand="SELECT * FROM [Files]"></asp:SqlDataSource>
</asp:Content>

