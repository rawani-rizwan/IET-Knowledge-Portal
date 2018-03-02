Imports System.Drawing
Imports System.Data.SqlClient
Imports System.Net.Mail
Partial Class ForgotPassword
    Inherits System.Web.UI.Page
    Dim s As String
    Dim p As String

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

    Protected Sub SubmitUserId_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SubmitUserId.Click
        Try
            Dim dssa As DataSourceSelectArguments = New DataSourceSelectArguments()
            Dim sdr As SqlDataReader
            SDS.SelectCommand = "select * from " + Me.UserType.SelectedValue + " where User_Id ='" + Me.UserName.Text + "'"
            SDS.DataSourceMode = SqlDataSourceMode.DataReader
            sdr = SDS.Select(dssa)
            If (sdr.Read) Then
                Me.InvalidUserLabel.Visible = False
                Me.UserType.Enabled = False
                Me.UserName.Enabled = False
                Me.QuestionLabel.Visible = True
                Me.Question.Visible = True
                Me.AnswerLabel.Visible = True
                Me.Answer.Visible = True
                Me.Question.Text = sdr("Security_Question").ToString
                Me.ImageLabel.Visible = True
                Me.Image.Visible = True
                Me.ImageText.Visible = True
                Me.RefreshImageButton.Visible = True
                Me.Submit.Visible = True
                Me.SubmitUserId.Enabled = False
            Else
                Me.InvalidUserLabel.Visible = True

            End If
        Catch ex As SqlException
            Me.InvalidUserLabel.Visible = True
        Catch ex As Exception

        End Try

    End Sub

    Protected Sub RefreshImageButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles RefreshImageButton.Click
        Try
            Me.refreshimage()
            Me.InvalidStringLabel.Visible = False
        Catch ex As Exception

        End Try
       
    End Sub
    Protected Sub refreshimage()
        Try
            s = System.Guid.NewGuid().ToString
            s = s.Substring(0, 5)
            Dim b As Bitmap = New Bitmap(149, 39)
            Dim g As Graphics = Graphics.FromImage(b)
            Dim ob1 As SolidBrush = New SolidBrush(Color.GreenYellow)
            Dim ob2 As SolidBrush = New SolidBrush(Color.Red)
            g.FillRectangle(ob1, 0, 0, 149, 39)
            Dim fon As Font = New Font("Arial", 22)
            Dim poin As Point = New Point(1.0F, 1.0F)
            g.DrawString(s, fon, ob2, poin)
            b.Save(Server.MapPath("images/validationimage/validationimage.jpg"), Imaging.ImageFormat.Jpeg)
            Me.imagestring.Text = s
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If Me.IsPostBack = False Then
                Me.refreshimage()
            End If
        Catch ex As Exception

        End Try
      
    End Sub

    Protected Sub Submit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Submit.Click
        Try
            If Me.imagestring.Text.ToString.ToLower = Me.ImageText.Text.ToLower Then
                Me.InvalidStringLabel.Visible = False
                Dim dssa As DataSourceSelectArguments = New DataSourceSelectArguments()
                Dim sdr As SqlDataReader
                SDS.SelectCommand = "select * from " + Me.UserType.SelectedValue + " where User_Id ='" + Me.UserName.Text + "'"
                SDS.DataSourceMode = SqlDataSourceMode.DataReader
                sdr = SDS.Select(dssa)
                If (sdr.Read) Then
                    If (sdr("Security_Answer").ToString = Me.Answer.Text) Then
                        Me.WrongAnswerLabel.Visible = False
                        Try
                            p = System.Guid.NewGuid().ToString
                            p = p.Substring(0, 8)
                            SDS.DataSourceMode = SqlDataSourceMode.DataSet
                            SDS.UpdateCommand = "update " + Me.UserType.SelectedValue + " set Password = '" + p + "' where User_Id='" + Me.UserName.Text + "'"
                            Dim email As String = sdr("Email_Id")
                            Dim msg As MailMessage = New MailMessage("noreply@ietknowledgeportal.com", email)
                            msg.Subject = "IET Knowledge Portal Password Changed"
                            msg.IsBodyHtml = True
                            msg.Body = "Your new Password for the " + Me.UserType.SelectedValue + " Account '" + Me.UserName.Text + "' is " + p + "<br><br>Kindly change the password after logging in on priority. <br><br>This is a system generated mail. Please do not reply to this mail."
                            Dim smtp As SmtpClient = New SmtpClient()
                            smtp.Host = "smtp.gmail.com"
                            smtp.Credentials = New System.Net.NetworkCredential("ietknowledgeportal@gmail.com", "knowledgeportal")
                            smtp.EnableSsl = True
                            smtp.Send(msg)
                            SDS.Update()
                            Me.Submit.Enabled = False
                            Me.RefreshImageButton.Enabled = False
                            Response.Redirect("~/PasswordChanged.aspx")
                        Catch ex As SmtpException
                            Me.MsgBox(Me, "Could not send new password to your e-mail id! The action will be cancelled. Try again later.")
                            Me.refreshimage()
                        Catch ex As Exception
                            Me.refreshimage()
                        End Try
                    Else
                        Me.WrongAnswerLabel.Visible = True
                        Me.refreshimage()
                    End If
                End If
            Else
                Me.InvalidStringLabel.Visible = True
                Me.WrongAnswerLabel.Visible = False
                Me.refreshimage()
            End If

        Catch ex As Exception
            Me.refreshimage()
        End Try
      
    End Sub
End Class
