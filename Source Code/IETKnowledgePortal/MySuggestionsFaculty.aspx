<%@ Page Language="VB" MasterPageFile="~/Faculty.master" AutoEventWireup="false" CodeFile="MySuggestionsFaculty.aspx.vb" Inherits="MySuggestionsFaculty" title="My Suggestions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
<asp:Label ID="HeadingLabel" runat="server" BackColor="#507CD1" ForeColor="White"
        Style="left: 0px; vertical-align: middle; position: absolute; top: 0px; text-align: center"
        Width="706px">My Suggestions</asp:Label>
    <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>"
        SelectCommand="SELECT * FROM [Links]"></asp:SqlDataSource>
    <asp:Label ID="Noresult" runat="server" Height="29px" Style="left: 0px; position: absolute;
        top: 60px" Text="No Links found!"></asp:Label>
    <asp:GridView ID="LinksData" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3"
        CellSpacing="1" DataKeyNames="Id" DataSourceID="SDS" GridLines="None" PageSize="8"
        Style="left: 0px; position: absolute; top: 30px" Width="706px">
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id"
                Visible="False" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
            <asp:HyperLinkField DataNavigateUrlFields="Link" DataTextField="Link" HeaderText="Link"
                Target="_blank">
                <ControlStyle ForeColor="Black" />
            </asp:HyperLinkField>
            <asp:BoundField DataField="Link" HeaderText="Link" SortExpression="Link" Visible="False" />
            <asp:BoundField DataField="Date_Suggested" HeaderText="Date Suggested" SortExpression="Date_Suggested" />
            <asp:ButtonField CommandName="del" HeaderText="Delete" Text="Delete" />
        </Columns>
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="#E7E7FF" />
    </asp:GridView>
</asp:Content>

