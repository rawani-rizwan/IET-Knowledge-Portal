Imports System.Net.Mail
Imports System.Data.SqlClient
Partial Class PendingStudentAccountRequests
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If Me.IsPostBack = False Then
                SDS.SelectCommand = "select * from Student where Account_Status='notactivated' order by Date_Requested"
            End If

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub AccountRequests_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles AccountRequests.RowCommand
        Try
            Dim currentCommand As String = e.CommandName
            If currentCommand = "activate" Or currentCommand = "deny" Then
                Dim currentRowIndex As Integer = Int32.Parse(e.CommandArgument)
                Dim UserID As String = Me.AccountRequests.DataKeys(currentRowIndex).Value
                Dim email As String
                Dim sdr As SqlDataReader
                Dim dssa As DataSourceSelectArguments = New DataSourceSelectArguments
                SDS1.DataSourceMode = SqlDataSourceMode.DataReader
                SDS1.SelectCommand = "select Email_Id from student where User_Id='" + UserID + "'"
                sdr = SDS1.Select(dssa)
                sdr.Read()
                email = sdr("Email_Id")
                If currentCommand = "activate" Then
                    SDS.DataSourceMode = SqlDataSourceMode.DataSet
                    SDS.UpdateCommand = "update Student set Account_Status='activated' where User_Id='" + UserID + "'"
                    SDS.Update()
                    Dim msg As MailMessage = New MailMessage("noreply@ietknowledgeportal.com", email)
                    msg.Subject = "IET Knowledge Portal Account Activated"
                    msg.IsBodyHtml = True
                    msg.Body = "Congratulations! Your IET Knowledge Portal student account '" + UserID + "' has been activated.<br><br>This is a system generated mail. Please do not reply to this mail."
                    Dim smtp As SmtpClient = New SmtpClient()
                    smtp.Host = "smtp.gmail.com"
                    smtp.Credentials = New System.Net.NetworkCredential("ietknowledgeportal@gmail.com", "knowledgeportal")
                    smtp.EnableSsl = True
                    smtp.Send(msg)


                ElseIf currentCommand = "deny" Then
                    SDS.DataSourceMode = SqlDataSourceMode.DataSet
                    SDS.DeleteCommand = "delete from Student where User_Id='" + UserID + "'"
                    SDS.Delete()
                    Dim msg As MailMessage = New MailMessage("noreply@ietknowledgeportal.com", email)
                    msg.Subject = "IET Knowledge Portal Account Request Denied"
                    msg.IsBodyHtml = True
                    msg.Body = "Your IET Knowledge Portal student account request '" + UserID + "' has been denied.<br><br>This is a system generated mail. Please do not reply to this mail."
                    Dim smtp As SmtpClient = New SmtpClient()
                    smtp.Host = "smtp.gmail.com"
                    smtp.Credentials = New System.Net.NetworkCredential("ietknowledgeportal@gmail.com", "knowledgeportal")
                    smtp.EnableSsl = True
                    smtp.Send(msg)
                End If
            End If

        Catch ex As Exception

        End Try
        Try
            SDS.SelectCommand = "select * from Student where Account_Status='notactivated' order by Date_Requested"
        Catch ex As Exception

        End Try
    End Sub

  
End Class
