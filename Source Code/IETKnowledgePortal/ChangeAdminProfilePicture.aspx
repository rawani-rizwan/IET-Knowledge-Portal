<%@ Page Language="VB" MasterPageFile="~/Admin.master" AutoEventWireup="false" CodeFile="ChangeAdminProfilePicture.aspx.vb" Inherits="ChangeAdminProfilePicture" title="Change Profile Picture" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <asp:Label ID="HeadingLabel" runat="server" BackColor="#507CD1" ForeColor="White"
        Style="left: 0px; vertical-align: middle; position: absolute; top: 0px; text-align: center"
        Text="Change Profile Picture" Width="706px"></asp:Label>
    <asp:FileUpload ID="ImageUpload" runat="server" style="position: absolute; top: 70px; left: 0px;" Width="316px" BackColor="#FBF99B" />
    <asp:RadioButtonList ID="Options" runat="server" RepeatColumns="2" Style="left: 0px;
        position: absolute; top: 30px" Width="234px" AutoPostBack="True">
        <asp:ListItem Selected="True">Upload an Image</asp:ListItem>
        <asp:ListItem>No Image</asp:ListItem>
    </asp:RadioButtonList>
    <asp:Button ID="Update" runat="server" Style="left: 43px; position: absolute; top: 130px"
        Text="Update" />
    <asp:Button ID="Cancel" runat="server" Style="left: 132px; position: absolute; top: 130px"
        Text="Cancel" CausesValidation="False" />
    <asp:Label ID="Conditions" runat="server" Font-Size="Small" Style="left: 0px; vertical-align: middle;
        position: absolute; top: 90px; text-align: center" Text="(jpg, gif, png files  -  5 MB max.)"
        Width="232px"></asp:Label>
    <asp:RegularExpressionValidator ID="InvalidFile" runat="server" ControlToValidate="ImageUpload"
        ErrorMessage="Invalid File!" Style="left: 331px; position: absolute; top: 70px"
        ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.jpg|.JPG|.GIF|.gif|.png|.PNG)$"></asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="FileRequired" runat="server" ControlToValidate="ImageUpload"
        ErrorMessage="*" Style="left: 315px; position: absolute; top: 70px"></asp:RequiredFieldValidator>
    <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>"
        SelectCommand="SELECT * FROM [Administrator]"></asp:SqlDataSource>
    <asp:Label ID="SizeExceeded" runat="server" ForeColor="Red" Style="left: 0px; vertical-align: middle;
        position: absolute; top: 170px; text-align: center" Visible="False" Width="229px">The File is larger than 5 MB!</asp:Label>
</asp:Content>

