<%@ Page Language="VB" MasterPageFile="~/Faculty.master" AutoEventWireup="false" CodeFile="StudentAccountsFaculty.aspx.vb" Inherits="StudentAccountsFaculty" title="Student Accounts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <asp:Label ID="HeadingLabel" runat="server" BackColor="#507CD1" ForeColor="White"
        Style="left: 0px; vertical-align: middle; position: absolute; top: 0px; text-align: center"
        Text="Student Accounts" Width="706px"></asp:Label>
    <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>"
        SelectCommand="SELECT * FROM [Student]"></asp:SqlDataSource>
    <asp:TextBox ID="SearchBox" runat="server" Style="left: 0px;
        position: absolute; top: 30px" ToolTip="Enter Search Text Here. Leave Blank for Viewing All Records."
        Width="275px" BackColor="#FBF99B"></asp:TextBox>
    <asp:Label ID="YearLabel" runat="server" Style="left: 300px; vertical-align: middle;
        position: absolute; top: 30px; text-align: justify">Year:</asp:Label>
    <asp:DropDownList ID="Year" runat="server" BackColor="#FBF99B" Font-Names="Times New Roman"
        Style="left: 345px; position: absolute; top: 30px" Width="58px">
        <asp:ListItem Selected="True">All</asp:ListItem>
        <asp:ListItem>I</asp:ListItem>
        <asp:ListItem>II</asp:ListItem>
        <asp:ListItem>III</asp:ListItem>
        <asp:ListItem>IV</asp:ListItem>
    </asp:DropDownList>
    <asp:Label ID="BranchLabel" runat="server" Style="left: 425px; vertical-align: middle;
        position: absolute; top: 30px; text-align: justify">Branch:</asp:Label>
    <asp:DropDownList ID="Branch" runat="server" BackColor="#FBF99B" Style="left: 485px;
        position: absolute; top: 30px" Width="139px">
        <asp:ListItem Selected="True">All</asp:ListItem>
        <asp:ListItem>Computer Engg.</asp:ListItem>
        <asp:ListItem>E &amp; TC Engg.</asp:ListItem>
        <asp:ListItem>IT Engg.</asp:ListItem>
        <asp:ListItem>E &amp; I Engg.</asp:ListItem>
        <asp:ListItem>Mechanical Engg.</asp:ListItem>
        <asp:ListItem>Civil Engg.</asp:ListItem>
    </asp:DropDownList>
    <asp:Button ID="Search" runat="server" Style="left: 640px; position: absolute; top: 30px"
        Text="Search" Width="61px" />
    <asp:Label ID="SearchLabel" runat="server" Font-Size="Small" Style="left: 0px; vertical-align: middle;
        position: absolute; top: 55px; text-align: center" Text="Enter User Id/Enrollment No/Scholar No/Roll No/Name to Search Students."
        Width="280px"></asp:Label>
    <asp:Label ID="Noresult" runat="server" Text="No records found!" style="left: 0px; position: absolute; top: 100px" Height="29px"></asp:Label>
    <asp:GridView ID="StudentData" runat="server" AllowPaging="True"
        AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge"
        BorderWidth="2px" CellPadding="3" CellSpacing="1" DataKeyNames="User_Id" DataSourceID="SDS"
        GridLines="None" Style="left: 0px; position: absolute; top: 100px" Width="706px" PageSize="4">
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        <Columns>
            <asp:ImageField DataImageUrlField="Profile_Picture" HeaderText="Profile Picture">
                <ControlStyle Height="70px" Width="50px" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:ImageField>
            <asp:BoundField DataField="User_Id" HeaderText="User Id" ReadOnly="True" SortExpression="User_Id" />
            <asp:BoundField DataField="Enrollment_No" HeaderText="Enrollment No" SortExpression="Enrollment_No" />
            <asp:BoundField DataField="Scholar_No" HeaderText="Scholar No" SortExpression="Scholar_No" />
            <asp:BoundField DataField="Roll_no" HeaderText="Roll No" SortExpression="Roll_no" />
            <asp:BoundField DataField="Profile_Picture" HeaderText="Profile_Picture" SortExpression="Profile_Picture"
                Visible="False" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
            <asp:BoundField DataField="Branch" HeaderText="Branch" SortExpression="Branch" />
            <asp:ButtonField CommandName="viewprofile" HeaderText="View Profile" Text="View Profile" />
        </Columns>
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="#E7E7FF" />
    </asp:GridView>
</asp:Content>

