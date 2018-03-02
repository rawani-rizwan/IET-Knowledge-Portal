<%@ Page Language="VB" MasterPageFile="~/Student.master" AutoEventWireup="false" CodeFile="ViewNoticesStudent.aspx.vb" Inherits="ViewNoticesStudent" title="Notice Board" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
 <asp:Label ID="HeadingLabel" runat="server" BackColor="#507CD1" ForeColor="White"
        Style="left: 0px; vertical-align: middle; position: absolute; top: 0px; text-align: center"
        Width="706px">Notice Board</asp:Label>
    <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>"
        SelectCommand="SELECT * FROM [Notices]"></asp:SqlDataSource>
    <asp:Label ID="Noresult" runat="server" Text="No Notices to show!" style="left: 0px; position: absolute; top: 60px" Height="29px"></asp:Label>
 <asp:GridView ID="NoticesData" runat="server" AllowPaging="True"
        AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge"
        BorderWidth="2px" CellPadding="3" CellSpacing="1" DataKeyNames="Id" DataSourceID="SDS"
        GridLines="None" Style="left: 0px; position: absolute; top: 30px" Width="706px" PageSize="5">
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id"
                Visible="False" />
            <asp:BoundField DataField="Date_Posted" HeaderText="Date Posted" SortExpression="Date_Posted" />
            <asp:BoundField DataField="Subject" HeaderText="Subject" SortExpression="Subject" />
            <asp:BoundField DataField="Notice" HeaderText="Notice" SortExpression="Notice" Visible="False" />
            <asp:BoundField DataField="Uploaded_By" HeaderText="Uploaded By" SortExpression="Uploaded_By" />
            <asp:ButtonField CommandName="view" HeaderText="View" Text="View" />
        </Columns>
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="#E7E7FF" />
        
    </asp:GridView>
     <asp:SqlDataSource ID="SDS1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>"
        SelectCommand="SELECT * FROM [Notices]"></asp:SqlDataSource>
</asp:Content>

