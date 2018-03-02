
Partial Class MySuggestionsStudent
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If Me.IsPostBack = False Then
                SDS.SelectCommand = "select * from Links where Uploader_Type = 'Student' and Uploader_Id = '" + Session("user").ToString + "' order by Date_Suggested desc"
            End If
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub LinksData_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles LinksData.RowCommand
        Try
            Dim currentCommand As String = e.CommandName
            If currentCommand = "del" Then
                Dim currentRowIndex As Integer = Int32.Parse(e.CommandArgument)
                Dim ID As String = Me.LinksData.DataKeys(currentRowIndex).Value
               
                SDS.DeleteCommand = "delete from Links where Id = " + ID
                SDS.Delete()

            End If

        Catch ex As Exception

        End Try
        Try
            SDS.SelectCommand = "select * from Links where Uploader_Type = 'Student' and Uploader_Id = '" + Session("user").ToString + "' order by Date_Suggested desc"
        Catch ex As Exception

        End Try
    End Sub
End Class
