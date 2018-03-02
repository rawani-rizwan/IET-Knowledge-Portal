Imports System.Data.SqlClient
Partial Class ShowNoticeFaculty
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If Me.IsPostBack = False Then
                Dim dssa As DataSourceSelectArguments = New DataSourceSelectArguments
                Dim sdr As SqlDataReader
                SDS.SelectCommand = "select * from Notices where Id = " + Session("selectednotice").ToString
                SDS.DataSourceMode = SqlDataSourceMode.DataReader
                sdr = SDS.Select(dssa)
                sdr.Read()
                Me.DatePosted.Text = sdr("Date_Posted").ToString
                Me.Subject.Text = sdr("Subject").ToString
                Me.Subject.Text = Me.Subject.Text.Replace(vbNewLine, "<br>")
                Me.Notice.Text = sdr("Notice").ToString
                Me.Notice.Text = Me.Notice.Text.Replace(vbNewLine, "<br>")
                Me.NoticeId.Text = sdr("Id").ToString
                If sdr("Uploader_Type").ToString = "Faculty" And sdr("Uploader_Id").ToString = Session("user").ToString Then
                    Me.Delete.Visible = True
                Else
                    Me.Delete.Visible = False
                End If
            End If
           
        Catch ex As Exception
            Response.Redirect("AccessDenied.aspx")
        End Try
    End Sub

    Protected Sub Delete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Delete.Click
        Try
           
            SDS.DeleteCommand = "delete from Notices where Id = " + Me.NoticeId.Text
            SDS.Delete()
            Response.Redirect("ViewNoticesFaculty.aspx")

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub Back_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Back.Click
        Try
            Response.Redirect("ViewNoticesFaculty.aspx")
        Catch ex As Exception

        End Try
    End Sub
End Class
