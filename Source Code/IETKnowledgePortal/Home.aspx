<%@ Page Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="Home.aspx.vb" Inherits="Home" title="Home" %>
<%-- Add content controls here --%>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="Content">
    <asp:Label ID="HeadingLabel" runat="server" Style="left: 0px; vertical-align: middle;
        position: absolute; top: 0px; text-align: center" Text="Welcome to IET Knowledge Portal"
        Width="706px" BackColor="#507CD1" ForeColor="White"></asp:Label>
    <asp:Label ID="Label1" runat="server" Style="left: 0px; font-family: Calibri; position: absolute;
        top: 30px; text-align: justify;" Text="‘Knowledge Portal’ is a website for IET-DAVV that provides a platform where students and faculty can interact and exchange information, study material, notes etc. It provides various facilities like blogging, uploading and downloading course related material, question answer forum."
        Width="706px"></asp:Label>
    <asp:Label ID="Label2" runat="server" Style="left: 0px; font-family: Calibri; position: absolute;
        top: 103px; text-align: justify" Text="With the traditional ‘Notice-Board’ system, there is scope for a lot of communication gap between students and teachers. Using this website, students can access the current updates and study materials instantly, from anywhere. Also, because the college timings are limited, and students and teachers aren’t necessarily free at the same time, it’s hard for the students to ask their queries in time. Using the question-answer forum or the discussion board, a student can have a one-to-one discussion with the teachers. Also, students can help other students too. This way, students can mutually benefit from each-others’ knowledge."
        Width="706px"></asp:Label>
    <asp:Label ID="Label3" runat="server" Style="left: 0px; font-family: Calibri;
        position: absolute; top: 234px; text-align: justify" Text="Knowledge portal users can create their profile where they can share their achievements and interests with others. It should be noted that the students can only view the information that is relevant to their course. Regular updates and notices would be shared on knowledge portal. Students and teachers can also upload and download study material, timetables, syllabus and class notes."
        Width="706px"></asp:Label>
</asp:Content>
