Imports System.Data.SqlClient
Partial Class CompleteProfileStudent
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

    Protected Sub Proceed_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Proceed.Click
        Try
            SDS.UpdateCommand = "update Student set About_Me = '" + Me.AboutMe.Text + "' , Interests = '" + Me.Interests.Text + "' , Projects = '" + Me.Projects.Text + "' , Achievements = '" + Me.Achievements.Text + "' , Publications = '" + Me.Publications.Text + "' where User_Id ='" + Session("user").ToString + "'"
            SDS.Update()
            Response.Redirect("StudentHome.aspx")
        Catch ex As SqlException
            Me.MsgBox(Me, "Some fields may contain invalid values. Try removing special characters like single or double qoutes (') ")
        Catch ex As Exception

        End Try

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            SDS.UpdateCommand = "update Student set First_Login ='false' where User_Id ='" + Session("user").ToString + "'"
            SDS.Update()
        Catch ex As Exception

        End Try
       
    End Sub
End Class
