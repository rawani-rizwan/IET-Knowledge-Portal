<%@ Page Language="VB" MasterPageFile="~/Admin.master" AutoEventWireup="false" CodeFile="UpdateNewsGallery.aspx.vb" Inherits="UpdateNewsGallery" title="Update News Gallery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <asp:Label ID="HeadingLabel" runat="server" BackColor="#507CD1" ForeColor="White"
        Style="left: 0px; vertical-align: middle; position: absolute; top: 0px; text-align: center"
        Text="Update News Gallery" Width="706px"></asp:Label>
    <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>"
        DeleteCommand="DELETE FROM [News_Gallery] WHERE [News_Id] = @original_News_Id"
        InsertCommand="INSERT INTO [News_Gallery] ([News_Id], [News_Text], [News_Link], [Priority]) VALUES (@News_Id, @News_Text, @News_Link, @Priority)"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [News_Gallery] ORDER BY [Priority]"
        UpdateCommand="UPDATE [News_Gallery] SET [News_Text] = @News_Text, [News_Link] = @News_Link, [Priority] = @Priority WHERE [News_Id] = @original_News_Id">
        <DeleteParameters>
            <asp:Parameter Name="original_News_Id" Type="Decimal" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="News_Text" Type="String" />
            <asp:Parameter Name="News_Link" Type="String" />
            <asp:Parameter Name="Priority" Type="Decimal" />
            <asp:Parameter Name="original_News_Id" Type="Decimal" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="News_Id" Type="Decimal" />
            <asp:Parameter Name="News_Text" Type="String" />
            <asp:Parameter Name="News_Link" Type="String" />
            <asp:Parameter Name="Priority" Type="Decimal" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:HyperLink ID="NewNews" runat="server" NavigateUrl="~/NewNewsItem.aspx" Style="left: 0px;
        color: blue; position: absolute; top: 30px; text-decoration: underline">Add News Item</asp:HyperLink>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True"
        AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge"
        BorderWidth="2px" CellPadding="3" CellSpacing="1" DataKeyNames="News_Id" DataSourceID="SDS"
        GridLines="None" Style="left: 0px; position: absolute; top: 60px" Width="706px" PageSize="8">
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        <Columns>
            <asp:BoundField DataField="News_Id" HeaderText="News Id" ReadOnly="True" SortExpression="News_Id"
                Visible="False" />
            <asp:BoundField DataField="Priority" HeaderText="Priority" SortExpression="Priority" />
            <asp:BoundField DataField="News_Text" HeaderText="News Text" SortExpression="News_Text" />
            <asp:BoundField DataField="News_Link" HeaderText="News Link" SortExpression="News_Link" />
            <asp:CommandField HeaderText="Edit" ShowEditButton="True" />
            <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" />
        </Columns>
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="#E7E7FF" />
    </asp:GridView>
    
</asp:Content>

