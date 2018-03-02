Imports System.Data.SqlClient
Partial Class ViewNoticesAdmin
    Inherits System.Web.UI.Page

   

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If Me.IsPostBack = False Then
                SDS.SelectCommand = "select * from Notices order by Date_Posted desc"
            End If

        Catch ex As Exception

        End Try

    End Sub

    Protected Sub NoticesData_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles NoticesData.RowCommand
        Try
            Dim currentCommand As String = e.CommandName
            If currentCommand = "view" Then
                Dim currentRowIndex As Integer = Int32.Parse(e.CommandArgument)
                Dim ID As String = Me.NoticesData.DataKeys(currentRowIndex).Value
                Session("selectednotice") = ID
                Response.Redirect("ShowNoticeAdmin.aspx")

            ElseIf currentCommand = "del" Then

                Dim currentRowIndex As Integer = Int32.Parse(e.CommandArgument)
                Dim ID As String = Me.NoticesData.DataKeys(currentRowIndex).Value
              
                SDS.DeleteCommand = "delete from Notices where Id = " + ID
                SDS.Delete()

            End If

        Catch ex As Exception

        End Try
        Try
            SDS.SelectCommand = "select * from Notices order by Date_Posted desc"
        Catch ex As Exception

        End Try
    End Sub
End Class
