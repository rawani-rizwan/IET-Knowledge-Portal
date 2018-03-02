<%@ Page Language="VB" MasterPageFile="~/Admin.master" AutoEventWireup="false" CodeFile="DownloadsAdmin.aspx.vb" Inherits="DownloadsAdmin" title="Downloads" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <asp:Label ID="HeadingLabel" runat="server" BackColor="#507CD1" ForeColor="White"
        Style="left: 0px; vertical-align: middle; position: absolute; top: 0px; text-align: center"
        Width="706px">Downloads</asp:Label>
    <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>"
        SelectCommand="SELECT * FROM [Files]"></asp:SqlDataSource>
    <asp:TextBox ID="SearchBox" runat="server" Style="left: 0px;
        position: absolute; top: 30px" ToolTip="Enter Search Text Here. Leave Blank for Viewing All Records."
        Width="264px" BackColor="#FBF99B"></asp:TextBox>
    <asp:Label ID="CategoryLabel" runat="server" Style="left: 275px; vertical-align: middle;
        position: absolute; top: 30px; text-align: justify">Category:</asp:Label>
    <asp:DropDownList ID="Category" runat="server" BackColor="#FBF99B"
        Style="left: 340px; position: absolute; top: 30px" Width="110px">
        <asp:ListItem Selected="True">All</asp:ListItem>
        <asp:ListItem>Study Material</asp:ListItem>
        <asp:ListItem>Curriculum</asp:ListItem>
        <asp:ListItem>Assignment</asp:ListItem>
        <asp:ListItem>Question Paper</asp:ListItem>
    </asp:DropDownList>
    <asp:Label ID="UploadedByLabel" runat="server" Style="left: 460px; vertical-align: middle;
        position: absolute; top: 30px; text-align: justify">Uploaded By:</asp:Label>
    <asp:DropDownList ID="UploadedBy" runat="server" BackColor="#FBF99B" Style="left: 550px;
        position: absolute; top: 30px" Width="90px">
        <asp:ListItem Selected="True">All</asp:ListItem>
        <asp:ListItem>Faculty</asp:ListItem>
        <asp:ListItem>Student</asp:ListItem>
        <asp:ListItem >Administrator</asp:ListItem>
    </asp:DropDownList>
    <asp:Button ID="Search" runat="server" Style="left: 645px; position: absolute; top: 30px"
        Text="Search" Width="56px" />
    <asp:Label ID="SearchLabel" runat="server" Font-Size="Small" Style="left: 0px; vertical-align: middle;
        position: absolute; top: 55px; text-align: center" Text="Enter File Name/Title/Author/Publisher/Uploader Name to search files."
        Width="268px"></asp:Label>
    <asp:Label ID="Noresult" runat="server" Text="No files found!" style="left: 0px; position: absolute; top: 100px" Height="29px"></asp:Label>
    <asp:GridView ID="FilesData" runat="server" AllowPaging="True"
        AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge"
        BorderWidth="2px" CellPadding="3" CellSpacing="1" DataKeyNames="Id" DataSourceID="SDS"
        GridLines="None" Style="left: 0px; position: absolute; top: 100px" Width="706px" PageSize="5">
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" Visible="False" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="File_Name" HeaderText="File Name" SortExpression="File_Name" />
            <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
            <asp:BoundField DataField="File_Path" HeaderText="File_Path" SortExpression="File_Path" Visible="False" />
            <asp:BoundField DataField="Uploaded_By" HeaderText="Uploaded By" SortExpression="Uploaded_By" />
            <asp:BoundField DataField="Date_Uploaded" HeaderText="Upload Date" SortExpression="Date_Uploaded" />
            <asp:ButtonField CommandName="details" HeaderText="Details" Text="Details" />
            <asp:HyperLinkField DataNavigateUrlFields="File_Path" HeaderText="View" Target="_blank"
                Text="View">
                <ControlStyle ForeColor="Black" Font-Bold="False" />
            </asp:HyperLinkField>
            <asp:ButtonField CommandName="download" HeaderText="Download" Text="Download" />
            <asp:ButtonField CommandName="del" HeaderText="Delete" Text="Delete" />
        </Columns>
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="#E7E7FF" />
    </asp:GridView>
    <asp:SqlDataSource ID="SDS1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>"
        SelectCommand="SELECT * FROM [Files]"></asp:SqlDataSource>
</asp:Content>

