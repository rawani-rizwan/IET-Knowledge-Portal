
Partial Class ViewOtherLinksAdmin
    Inherits System.Web.UI.Page

  

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If Me.IsPostBack = False Then
                SDS.SelectCommand = "select * from Links where Category = 'Miscellaneous' order by Date_Suggested desc"
            End If
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub Search_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Search.Click
        Try
            Dim i As Integer = Me.SearchBox.Text.IndexOf("'")
            If i = -1 Then
                If Me.SuggestedBy.SelectedValue <> "All" Then
                    SDS.SelectCommand = "select * from Links where Category = 'Miscellaneous' and Uploader_Type = '" + Me.SuggestedBy.SelectedValue + "' and ( Title like '%" + Me.SearchBox.Text + "%' or Uploaded_By like '%" + Me.SearchBox.Text + "%' ) order by Date_Suggested desc"
                Else
                    SDS.SelectCommand = "select * from Links where Category = 'Miscellaneous' and ( Title like '%" + Me.SearchBox.Text + "%' or Uploaded_By like '%" + Me.SearchBox.Text + "%' ) order by Date_Suggested desc"
                End If
                Me.LinksData.Visible = True
            Else
                Me.LinksData.Visible = False
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
            Dim i As Integer = Me.SearchBox.Text.IndexOf("'")
            If i = -1 Then
                If Me.SuggestedBy.SelectedValue <> "All" Then
                    SDS.SelectCommand = "select * from Links where Category = 'Miscellaneous' and Uploader_Type = '" + Me.SuggestedBy.SelectedValue + "' and ( Title like '%" + Me.SearchBox.Text + "%' or Uploaded_By like '%" + Me.SearchBox.Text + "%' ) order by Date_Suggested desc"
                Else
                    SDS.SelectCommand = "select * from Links where Category = 'Miscellaneous' and ( Title like '%" + Me.SearchBox.Text + "%' or Uploaded_By like '%" + Me.SearchBox.Text + "%' ) order by Date_Suggested desc"
                End If
                Me.LinksData.Visible = True
            Else
                Me.LinksData.Visible = False
            End If
        Catch ex As Exception

        End Try
    End Sub
End Class
