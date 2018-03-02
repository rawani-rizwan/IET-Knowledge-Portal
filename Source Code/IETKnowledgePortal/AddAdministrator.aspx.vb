Imports System.Data.SqlClient
Imports System.Net.Mail
Partial Class AddAdministrator
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

    Protected Sub Add_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Add.Click
        Try
            Dim dssa As DataSourceSelectArguments = New DataSourceSelectArguments
            Dim sdr As SqlDataReader
            SDS.SelectCommand = "select * from Administrator where User_Id='" + Me.UserId.Text + "'"
            SDS.DataSourceMode = SqlDataSourceMode.DataReader
            sdr = SDS.Select(dssa)
            If sdr.Read Then
                Me.MsgBox(Me, "An Administrator with this User Id already exists!")
                Exit Sub
            End If
            Dim password As String = System.Guid.NewGuid().ToString
            password = password.Substring(0, 8)
            SDS.InsertCommand = "insert into Administrator(User_Id, Password, Name, Profile_Picture, Designation, Email_Id, Mobile, Security_Question, Security_Answer) values('" + Me.UserId.Text + "' ,'" + password + "' ,'" + Me.Name.Text + "' ,'~/images/profile pictures/no_profile.jpg' ,'" + Me.Designation.Text + "' ,'" + Me.Email.Text + "' ," + Me.Mobile.Text + " ,'' ,'' )"
            Dim msg As MailMessage = New MailMessage("noreply@ietknowledgeportal.com", Me.Email.Text)
            msg.Subject = "Administrator Account Created"
            msg.IsBodyHtml = True
            msg.Body = "An Administrator account has been created in IET Knowledge Portal with your Email Id.<br><br>Your User Id is " + Me.UserId.Text + "<br><br>Your Password is " + password + "<br><br>Kindly change this password after logging in on priority.<br><br>Do provide security information(security question and answer). This helps in password recovery if you ever forget your password.<br><br>This is a system generated mail. Please do not reply to this mail."
            Dim smtp As SmtpClient = New SmtpClient()
            smtp.Host = "smtp.gmail.com"
            smtp.Credentials = New System.Net.NetworkCredential("ietknowledgeportal@gmail.com", "knowledgeportal")
            smtp.EnableSsl = True
            SDS.Insert()
            smtp.Send(msg)
            Response.Redirect("~/AdministratorAdded.aspx")
        Catch ex As SqlException
            Me.MsgBox(Me, "Could not add administrator! Some fields may contain invalid values. Try removing special characters like single or double qoutes (') ")
        Catch ex As SmtpException
            Me.MsgBox(Me, "Could not send e-mail to new administrator! The action will be cancelled. Try again later.")
            SDS.DeleteCommand = "delete from Administrator where User_Id = '" + Me.UserId.Text + "'"
            SDS.Delete()
        Catch ex As Exception

        End Try


    End Sub
End Class
