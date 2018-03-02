Imports System.Data.SqlClient
Partial Class StudentProfileFaculty
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If Me.IsPostBack = False Then
                Dim dssa As DataSourceSelectArguments = New DataSourceSelectArguments
                Dim sdr As SqlDataReader
                SDS.SelectCommand = "select * from Student where User_Id = '" + Session("selectedstudent").ToString + "'"
                SDS.DataSourceMode = SqlDataSourceMode.DataReader
                sdr = SDS.Select(dssa)
                sdr.Read()
                Me.UserId.Text = sdr("User_Id").ToString()
                Me.EnrollmentNo.Text = sdr("Enrollment_No").ToString()
                Me.ScholarNo.Text = sdr("Scholar_No").ToString()
                Me.RollNo.Text = sdr("Roll_No").ToString()
                Me.Name.Text = sdr("Name").ToString()
                Me.Year.Text = sdr("Year").ToString() + " Year"
                Me.Branch.Text = sdr("Branch").ToString()
                Me.Email.Text = sdr("Email_Id").ToString()
                Me.Mobile.Text = sdr("Mobile").ToString()
                Me.AboutMe.Text = sdr("About_Me").ToString()
                Me.AboutMe.Text = Me.AboutMe.Text.Replace(vbNewLine, "<br>")
                Me.Interests.Text = sdr("Interests").ToString()
                Me.Interests.Text = Me.Interests.Text.Replace(vbNewLine, "<br>")
                Me.Achievements.Text = sdr("Achievements").ToString
                Me.Achievements.Text = Me.Achievements.Text.Replace(vbNewLine, "<br>")
                Me.Projects.Text = sdr("Projects").ToString()
                Me.Projects.Text = Me.Projects.Text.Replace(vbNewLine, "<br>")
                Me.Publications.Text = sdr("Publications").ToString()
                Me.Publications.Text = Me.Publications.Text.Replace(vbNewLine, "<br>")
                Me.ProfilePicture.ImageUrl = sdr("Profile_Picture").ToString()
            End If
           
        Catch ex As Exception
            Response.Redirect("AccessDenied.aspx")
        End Try
    End Sub

    Protected Sub Back_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Back.Click
        Try
            Response.Redirect("StudentAccountsFaculty.aspx")
        Catch ex As Exception

        End Try
    End Sub
End Class
