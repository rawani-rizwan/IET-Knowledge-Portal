Imports System.Data.SqlClient
Partial Class FacultyProfileStudent
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If Me.IsPostBack = False Then
                Dim dssa As DataSourceSelectArguments = New DataSourceSelectArguments
                Dim sdr As SqlDataReader
                SDS.SelectCommand = "select * from Faculty where User_Id = '" + Session("selectedfaculty").ToString + "'"
                SDS.DataSourceMode = SqlDataSourceMode.DataReader
                sdr = SDS.Select(dssa)
                sdr.Read()
                Me.UserId.Text = sdr("User_Id").ToString()
                Me.EmployeeNo.Text = sdr("Employee_No").ToString()
                Me.Name.Text = sdr("Name").ToString()
                Me.Department.Text = sdr("Department").ToString()
                Me.Designation.Text = sdr("Designation").ToString()
                Me.Email.Text = sdr("Email_Id").ToString()
                Me.Mobile.Text = sdr("Mobile").ToString()
                Me.AboutMe.Text = sdr("About_Me").ToString()
                Me.AboutMe.Text = Me.AboutMe.Text.Replace(vbNewLine, "<br>")
                Me.Qualifications.Text = sdr("Qualifications").ToString()
                Me.Qualifications.Text = Me.Qualifications.Text.Replace(vbNewLine, "<br>")
                Me.Interests.Text = sdr("Interests").ToString()
                Me.Interests.Text = Me.Interests.Text.Replace(vbNewLine, "<br>")
                Me.SubjectsTaught.Text = sdr("Subjects_Taught").ToString()
                Me.SubjectsTaught.Text = Me.SubjectsTaught.Text.Replace(vbNewLine, "<br>")
                Me.Achievements.Text = sdr("Achievements").ToString
                Me.Achievements.Text = Me.Achievements.Text.Replace(vbNewLine, "<br>")
                Me.Projects.Text = sdr("Projects").ToString()
                Me.Projects.Text = Me.Projects.Text.Replace(vbNewLine, "<br>")
                Me.Publications.Text = sdr("Publications").ToString()
                Me.Publications.Text = Me.Publications.Text.Replace(vbNewLine, "<br>")
                Me.TeachingStyle.Text = sdr("Teaching_Style").ToString()
                Me.TeachingStyle.Text = Me.TeachingStyle.Text.Replace(vbNewLine, "<br>")
                Me.ProfilePicture.ImageUrl = sdr("Profile_Picture").ToString()
            End If
           
        Catch ex As Exception
            Response.Redirect("AccessDenied.aspx")
        End Try
    End Sub

    Protected Sub Back_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Back.Click
        Try
            Response.Redirect("FacultyAccountsStudent.aspx")
        Catch ex As Exception

        End Try
    End Sub
End Class
