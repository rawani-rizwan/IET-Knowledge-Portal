Imports System.Data.SqlClient
Partial Class DeleteAccountAdmin
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            Dim dssa As DataSourceSelectArguments = New DataSourceSelectArguments
            Dim sdr As SqlDataReader
            SDS.SelectCommand = "select * from Administrator"
            SDS.DataSourceMode = SqlDataSourceMode.DataReader
            sdr = SDS.Select(dssa)
            sdr.Read()
            If sdr.Read() Then
                cantdelete.Visible = False
                Me.Delete.Visible = True
                Me.Password.Visible = True
                Me.PasswordLabel.Visible = True
                Me.PasswordRequired.Visible = True
            Else
                cantdelete.Visible = True
                Me.Delete.Visible = False
                Me.Password.Visible = False
                Me.PasswordLabel.Visible = False
                Me.PasswordRequired.Visible = False
            End If
        Catch ex As Exception

        End Try
       

    End Sub

    Protected Sub Delete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Delete.Click
        Try
            Dim dssa As DataSourceSelectArguments = New DataSourceSelectArguments
            Dim sdr As SqlDataReader
            SDS.SelectCommand = "select * from Administrator where User_Id ='" + Session("user").ToString + "'"
            SDS.DataSourceMode = SqlDataSourceMode.DataReader
            sdr = SDS.Select(dssa)
            sdr.Read()
            If sdr("Password").ToString = Me.Password.Text Then
                Me.wrongpassword.Visible = False
                Dim filetodelete As String = sdr("Profile_Picture").ToString
                If filetodelete = "~/images/profile pictures/no_profile.jpg" Then
                Else
                    System.IO.File.Delete(Server.MapPath(filetodelete))

                End If
                SDS.DeleteCommand = "delete from Administrator where User_Id ='" + Session("user").ToString + "'"
                SDS.DataSourceMode = SqlDataSourceMode.DataSet
                SDS.Delete()
                Session.RemoveAll()
                Response.Redirect("AccountDeleted.aspx")
            Else
                Me.wrongpassword.Visible = True
            End If
        Catch ex As Exception

        End Try
      
    End Sub
End Class
