
Partial Class AdministratorAccountsStudent
    Inherits System.Web.UI.Page

    Protected Sub AdminData_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles AdminData.RowCommand
        Try
            Dim currentCommand As String = e.CommandName
            If currentCommand = "viewprofile" Then
                Dim currentRowIndex As Integer = Int32.Parse(e.CommandArgument)
                Dim UserID As String = Me.AdminData.DataKeys(currentRowIndex).Value
                Session("selectedadmin") = UserID
                Response.Redirect("AdminProfileStudent.aspx")
            End If
        Catch ex As Exception

        End Try
    End Sub
End Class
