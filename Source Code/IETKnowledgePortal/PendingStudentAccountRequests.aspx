<%@ Page Language="VB" MasterPageFile="~/Admin.master" AutoEventWireup="false" CodeFile="PendingStudentAccountRequests.aspx.vb" Inherits="PendingStudentAccountRequests" title="Account Requests" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <asp:Label ID="NoRequest" runat="server" Style="left: 0px; font-family: Calibri;
        position: absolute; top: 30px; text-align: justify" Text="There are no pending student account requests."
        Width="706px" Visible="True"></asp:Label>
    <asp:Label ID="HeadingLabel" runat="server" BackColor="#507CD1" ForeColor="White"
        Style="left: 0px; vertical-align: middle; position: absolute; top: 0px; text-align: center"
        Text="New Student Account Requests" Width="706px"></asp:Label>
    <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>"
        SelectCommand="SELECT * FROM [Student]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SDS1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>"
        SelectCommand="SELECT * FROM [Student]"></asp:SqlDataSource>
    <asp:GridView ID="AccountRequests" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px"
        CellPadding="3" DataKeyNames="User_Id" DataSourceID="SDS" Style="left: 0px;
        position: absolute; top: 30px" Width="706px" CellSpacing="1" GridLines="None" PageSize="8">
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        <Columns>
            <asp:BoundField DataField="User_Id" HeaderText="User Id" ReadOnly="True" SortExpression="User_Id" />
            <asp:BoundField DataField="Enrollment_No" HeaderText="Enrollment No" SortExpression="Enrollment_No" />
            <asp:BoundField DataField="Scholar_No" HeaderText="Scholar No" SortExpression="Scholar_No" />
            <asp:BoundField DataField="Roll_no" HeaderText="Roll No" SortExpression="Roll_no" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
            <asp:BoundField DataField="Branch" HeaderText="Branch" SortExpression="Branch" />
            <asp:BoundField DataField="Account_Status" HeaderText="Account_Status" SortExpression="Account_Status"
                Visible="False" />
            <asp:BoundField DataField="Date_Requested" HeaderText="Date_Requested" SortExpression="Date_Requested"
                Visible="False" />
            <asp:ButtonField CommandName="activate" HeaderText="Activate" Text="Activate" />
            <asp:ButtonField CommandName="deny" HeaderText="Deny" Text="Deny" />
        </Columns>
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="#E7E7FF" />
    </asp:GridView>
</asp:Content>

