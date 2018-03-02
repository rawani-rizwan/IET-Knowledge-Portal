Imports System.Data.SqlClient
Partial Class ChangeStudentProfilePicture
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
            If Options.SelectedIndex = 0 Then
                If Me.ImageUpload.HasFile Then
                    If System.IO.Path.GetFileName(ImageUpload.FileName).IndexOf("'") <> -1 Then
                        Me.MsgBox(Me, "File name contains special characters like single quotes! Rename the file before uploading.")
                        Exit Sub
                    End If
                    If Me.ImageUpload.PostedFile.ContentLength < 5242880 Then
                        Me.SizeExceeded.Visible = False
                        SDS.DataSourceMode = SqlDataSourceMode.DataReader
                        Dim dssa As DataSourceSelectArguments = New DataSourceSelectArguments
                        Dim sdr As SqlDataReader
                        Dim userid As String = Session("user").ToString
                        SDS.SelectCommand = "select * from Student where User_Id = '" + userid + "'"
                        sdr = SDS.Select(dssa)
                        sdr.Read()
                        Dim filetodelete As String = sdr("Profile_Picture").ToString
                        If filetodelete = "~/images/profile pictures/no_profile.jpg" Then
                        Else
                            System.IO.File.Delete(Server.MapPath(filetodelete))

                        End If
                        Dim filename As String = "Student_" + sdr("User_Id").ToString + System.IO.Path.GetExtension(Me.ImageUpload.FileName)
                        ImageUpload.SaveAs(Server.MapPath("images/profile pictures/" + filename))
                        SDS.UpdateCommand = "update Student set Profile_Picture='~/images/profile pictures/" + filename + "' where User_Id='" + userid + "'"
                        SDS.DataSourceMode = SqlDataSourceMode.DataSet
                        SDS.Update()
                        Response.Redirect("~/StudentHome.aspx")
                    Else
                        Me.SizeExceeded.Visible = True
                    End If

                End If
            Else
                SDS.DataSourceMode = SqlDataSourceMode.DataReader
                Dim dssa As DataSourceSelectArguments = New DataSourceSelectArguments
                Dim sdr As SqlDataReader
                Dim userid As String = Session("user").ToString
                SDS.SelectCommand = "select * from Student where User_Id='" + userid + "'"
                sdr = SDS.Select(dssa)
                sdr.Read()
                Dim filetodelete As String = sdr("Profile_Picture").ToString
                If filetodelete = "~/images/profile pictures/no_profile.jpg" Then
                Else
                    System.IO.File.Delete(Server.MapPath(filetodelete))

                End If
                SDS.UpdateCommand = "update Student set Profile_Picture='~/images/profile pictures/no_profile.jpg' where User_Id='" + userid + "'"
                SDS.DataSourceMode = SqlDataSourceMode.DataSet
                SDS.Update()
                Response.Redirect("~/StudentHome.aspx")
            End If
        Catch ex As Exception

        End Try


    End Sub

    Protected Sub Cancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Cancel.Click
        Try
            Response.Redirect("~/AccountSettingsStudent.aspx")
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub Options_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Options.SelectedIndexChanged
        Try
            If Options.SelectedIndex = 0 Then
                Me.ImageUpload.Enabled = True
                Me.InvalidFile.Enabled = True
                Me.FileRequired.Enabled = True
            Else
                Me.ImageUpload.Enabled = False
                Me.InvalidFile.Enabled = False
                Me.FileRequired.Enabled = False
            End If
        Catch ex As Exception

        End Try
    End Sub
End Class
