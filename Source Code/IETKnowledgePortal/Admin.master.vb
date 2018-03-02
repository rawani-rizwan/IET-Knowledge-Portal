Imports System.Data.SqlClient
Partial Class Admin
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            Try
                Dim con1 As SqlConnection = New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\IET.mdf;Integrated Security=True;User Instance=True")
                Dim userid As String = Session("user").ToString
                con1.Open()
                Dim sdr1 As SqlDataReader
                Dim selectcommand1 As SqlCommand = New SqlCommand("select * from Administrator where User_Id='" + userid + "'", con1)
                sdr1 = selectcommand1.ExecuteReader()
                sdr1.Read()
                Me.Profile_Picture.ImageUrl = sdr1("Profile_Picture").ToString
                Me.LoggedInLabel.Text = "Logged in as : " + sdr1("User_Id").ToString
                Me.Name.Text = "Name: " + sdr1("Name").ToString
                Me.Designation.Text = "Administrator, " + sdr1("Designation").ToString
                con1.Close()
            Catch ex As Exception
                Response.Redirect("~/AccessDenied.aspx")
            End Try
            Dim l As LiteralControl = New LiteralControl()
            Dim sdr As SqlDataReader
            Dim con As SqlConnection = New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\IET.mdf;Integrated Security=True;User Instance=True")
            con.Open()
            Dim selectcommand As SqlCommand = New SqlCommand("select * from News_Gallery order by priority", con)
            sdr = selectcommand.ExecuteReader()
            l.Text = "<marquee  direction=""up"" scrolldelay=""20"" scrollamount=""3"" height=""325"" width=""225""  onMouseover=""this.stop()"" onMouseout=""this.start()"">"
            While (sdr.Read)
                If IsDBNull(sdr("News_Link")) Or sdr("News_Link").ToString = "" Then
                    l.Text = l.Text + sdr("News_Text").ToString + "<br><br>"
                Else
                    l.Text = l.Text + "<a href=""" + sdr("News_Link").ToString + """ target=""_blank"" style= ""color:blue"" >" + sdr("News_Text").ToString + "</a><br><br>"
                End If

            End While
            l.Text = l.Text + "</marquee>"
            Me.NewsPanel.Controls.Add(l)
            con.Close()
        Catch ex As Exception

        End Try
    End Sub
End Class

