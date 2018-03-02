<%@ Page Language="VB" MasterPageFile="~/Faculty.master" AutoEventWireup="false" CodeFile="ViewOtherLinksFaculty.aspx.vb" Inherits="ViewOtherLinksFaculty" title="Useful Links" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
<asp:Label ID="HeadingLabel" runat="server" BackColor="#507CD1" ForeColor="White"
        Style="left: 0px; vertical-align: middle; position: absolute; top: 0px; text-align: center"
        Width="706px">Useful Links</asp:Label>
    <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>"
        SelectCommand="SELECT * FROM [Links]"></asp:SqlDataSource>
    <asp:TextBox ID="SearchBox" runat="server" Style="left: 0px;
        position: absolute; top: 30px" ToolTip="Enter Search Text Here. Leave Blank for Viewing All Records."
        Width="436px" BackColor="#FBF99B"></asp:TextBox>
     <asp:Label ID="UploadedByLabel" runat="server" Style="left: 460px; vertical-align: middle;
        position: absolute; top: 30px; text-align: justify">Suggested By:</asp:Label>
    <asp:DropDownList ID="SuggestedBy" runat="server" BackColor="#FBF99B" Style="left: 550px;
        position: absolute; top: 30px" Width="90px">
        <asp:ListItem Selected="True">All</asp:ListItem>
        <asp:ListItem>Faculty</asp:ListItem>
        <asp:ListItem>Student</asp:ListItem>
        <asp:ListItem>Administrator</asp:ListItem>
    </asp:DropDownList>
     <asp:Button ID="Search" runat="server" Style="left: 645px; position: absolute; top: 30px"
        Text="Search" Width="56px" />
     <asp:Label ID="SearchLabel" runat="server" Font-Size="Small" Style="left: 0px; vertical-align: middle;
        position: absolute; top: 55px; text-align: center" Text="Enter Link Title/Suggester Name to search for available Links."
        Width="442px"></asp:Label>
    <asp:Label ID="Noresult" runat="server" Text="No Links found!" style="left: 0px; position: absolute; top: 100px" Height="29px"></asp:Label>
    <asp:GridView ID="LinksData" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3"
        CellSpacing="1" DataKeyNames="Id" DataSourceID="SDS" GridLines="None" PageSize="5"
        Style="left: 0px; position: absolute; top: 100px" Width="706px">
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id"
                Visible="False" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:HyperLinkField DataNavigateUrlFields="Link" DataTextField="Link" HeaderText="Link"
                Target="_blank">
                <ControlStyle ForeColor="Black" />
            </asp:HyperLinkField>
            <asp:BoundField DataField="Link" HeaderText="Link" SortExpression="Link" Visible="False" />
            <asp:BoundField DataField="Date_Suggested" HeaderText="Date Suggested" SortExpression="Date_Suggested" />
            <asp:BoundField DataField="Uploaded_By" HeaderText="Suggested By" SortExpression="Uploaded_By" />
        </Columns>
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="#E7E7FF" />
    </asp:GridView>
   
    
</asp:Content>

