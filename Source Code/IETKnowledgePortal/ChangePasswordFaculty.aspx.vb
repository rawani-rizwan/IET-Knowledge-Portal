Imports System.Data.SqlClient
Partial Class ChangePasswordFaculty
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
            SDS.DataSourceMode = SqlDataSourceMode.DataReader
            Dim sdr As SqlDataReader
            Dim dssa As DataSourceSelectArguments = New DataSourceSelectArguments
            SDS.SelectCommand = "Select * from Faculty where User_Id = '" + Session("user").ToString + "'"
            sdr = SDS.Select(dssa)
            sdr.Read()
            If sdr("Password").ToString = Me.CurrentPassword.Text Then
                Me.WrongPassword.Visible = False
                SDS.UpdateCommand = "update Faculty set Password = '" + Me.Password.Text + "' where User_Id = '" + Session("user").ToString + "'"
                SDS.Update()
                Response.Redirect("FacultyPasswordUpdated.aspx")
            Else
                Me.WrongPassword.Visible = True
            End If

        Catch ex As SqlException
            Me.MsgBox(Me, "Could not change Password! Some fields may contain invalid values. Try removing special characters like single or double qoutes (') ")
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub Cancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Cancel.Click
        Try
            Response.Redirect("AccountSettingsFaculty.aspx")
        Catch ex As Exception

        End Try
    End Sub

   
End Class
