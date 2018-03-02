<%@ Page Language="VB" MasterPageFile="~/Admin.master" AutoEventWireup="false" CodeFile="AdministratorAccountsAdmin.aspx.vb" Inherits="AdministratorAccountsAdmin" title="Administrator Accounts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <asp:Label ID="HeadingLabel" runat="server" BackColor="#507CD1" ForeColor="White"
        Style="left: 0px; vertical-align: middle; position: absolute; top: 0px; text-align: center"
        Text="Administrator Accounts" Width="706px"></asp:Label>
    <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>"
        SelectCommand="SELECT * FROM [Administrator]"></asp:SqlDataSource>
    <asp:GridView ID="AdminData" runat="server" AllowPaging="True"
        AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge"
        BorderWidth="2px" CellPadding="3" CellSpacing="1" DataKeyNames="User_Id" DataSourceID="SDS"
        GridLines="None" Style="left: 0px; position: absolute; top: 30px" Width="706px" PageSize="4">
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        <Columns>
            <asp:ImageField DataImageUrlField="Profile_Picture" HeaderText="Profile Picture">
                <ControlStyle Height="70px" Width="50px" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:ImageField>
            <asp:BoundField DataField="User_Id" HeaderText="User Id" ReadOnly="True" SortExpression="User_Id" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Profile_Picture" HeaderText="Profile_Picture" SortExpression="Profile_Picture"
                Visible="False" />
            <asp:BoundField DataField="Designation" HeaderText="Designation" SortExpression="Designation" />
            <asp:ButtonField CommandName="viewprofile" HeaderText="View Profile" Text="View Profile" />
        </Columns>
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="#E7E7FF" />
    </asp:GridView>
</asp:Content>

