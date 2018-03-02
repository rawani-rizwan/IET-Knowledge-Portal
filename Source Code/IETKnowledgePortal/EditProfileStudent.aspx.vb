Imports System.Data.SqlClient
Partial Class EditProfileStudent
    Inherits System.Web.UI.Page

    Protected Sub MsgBox(ByVal F As Object, ByVal sMsg As String)
        Dim sb As New StringBuilder()
        Dim oFormObject As System.Web.UI.Control = Nothing
        Try
            sMsg = sMsg.Replace("'", "\'")
            sMsg = sMsg.Replace(Chr(34), "\" & Chr(34))
            sMsg = sMsg.Replace(vbCrLf, "\n")
            sMsg = "<script language='javascript'>alert('" & sMsg & "');</script>"
            sb = New StringBuilder()
            sb.Append(sMsg)
            For Each oFormObject In F.Controls
                If TypeOf oFormObject Is HtmlForm Then
                    Exit For
                End If
            Next
            oFormObject.Controls.AddAt(oFormObject.Controls.Count, New LiteralControl(sb.ToString))

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub Update_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Update.Click
        Try
            SDS.DataSourceMode = SqlDataSourceMode.DataSet
            SDS.UpdateCommand = "update Student set Roll_no = '" + Me.RollNo.Text + "' , Year = '" + Me.Year.Text + "' , Branch = '" + Me.Branch.Text + "' , Email_Id = '" + Me.Email.Text + "' , Mobile = " + Me.Mobile.Text + " , About_Me = '" + Me.AboutMe.Text + "' , Interests = '" + Me.Interests.Text + "' , Projects = '" + Me.Projects.Text + "' , Achievements = '" + Me.Achievements.Text + "' , Publications = '" + Me.Publications.Text + "' where User_Id ='" + Session("user").ToString + "'"
            SDS.Update()
            Response.Redirect("StudentProfileUpdated.aspx")
        Catch ex As SqlException
            Me.MsgBox(Me, "Could not edit profile! Some fields may contain invalid values. Try removing special characters like single or double qoutes (') ")
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If Me.IsPostBack Then
            Else
                Dim username As String = Session("user").ToString
                SDS.SelectCommand = "select * from Student where User_Id='" + username + "'"
                Dim dssa As DataSourceSelectArguments = New DataSourceSelectArguments
                Dim sdr As SqlDataReader
                SDS.DataSourceMode = SqlDataSourceMode.DataReader
                sdr = SDS.Select(dssa)
                sdr.Read()
                Me.UserId.Text = sdr("User_Id").ToString
                Me.EnrollmentNo.Text = sdr("Enrollment_No").ToString
                Me.ScholarNo.Text = sdr("Scholar_No").ToString
                Me.Name.Text = sdr("Name").ToString
                Me.RollNo.Text = sdr("Roll_No").ToString
                Me.Year.SelectedValue = sdr("Year").ToString
                Me.Branch.SelectedValue = sdr("Branch").ToString
                Me.Email.Text = sdr("Email_Id").ToString
                Me.Mobile.Text = sdr("Mobile").ToString
                Me.AboutMe.Text = sdr("About_Me").ToString
                Me.Interests.Text = sdr("Interests").ToString
                Me.Achievements.Text = sdr("Achievements").ToString
                Me.Projects.Text = sdr("Projects").ToString
                Me.Publications.Text = sdr("Publications").ToString
            End If
        Catch ex As Exception
            Response.Redirect("~/AccessDenied.aspx")
        End Try
    End Sub

    Protected Sub Cancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Cancel.Click
        Try
            Response.Redirect("AccountSettingsStudent.aspx")
        Catch ex As Exception

        End Try
    End Sub
End Class
