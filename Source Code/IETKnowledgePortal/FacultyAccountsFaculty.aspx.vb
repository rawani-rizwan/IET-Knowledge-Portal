
Partial Class FacultyAccountsFaculty
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If Me.IsPostBack = False Then
                SDS.SelectCommand = " select * from Faculty where Account_Status = 'activated' order by designationorder"
            End If

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub Search_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Search.Click
        Try
            Dim i As Integer = Me.SearchBox.Text.IndexOf("'")
            If i = -1 Then
                If Me.Department.SelectedValue <> "All" Then
                    SDS.SelectCommand = " select * from Faculty  where ((Account_Status = 'activated') and (Department = '" + Me.Department.SelectedValue + "')) and ((Name like '%" + Me.SearchBox.Text + "%') or (User_Id like '%" + Me.SearchBox.Text + "%') or (Employee_No like '%" + Me.SearchBox.Text + "%')) order by designationorder"
                Else
                    SDS.SelectCommand = " select * from Faculty  where ((Account_Status = 'activated')) and ((Name like '%" + Me.SearchBox.Text + "%') or (User_Id like '%" + Me.SearchBox.Text + "%') or (Employee_No like '%" + Me.SearchBox.Text + "%')) order by designationorder"
                End If
                Me.FacultyData.Visible = True
            Else
                Me.FacultyData.Visible = False

            End If



        Catch ex As Exception

        End Try
    End Sub

    Protected Sub FacultyData_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles FacultyData.RowCommand
        Try
            Dim currentCommand As String = e.CommandName
            If currentCommand = "viewprofile" Then
                Dim currentRowIndex As Integer = Int32.Parse(e.CommandArgument)
                Dim UserID As String = Me.FacultyData.DataKeys(currentRowIndex).Value
                Session("selectedfaculty") = UserID
                Response.Redirect("FacultyProfileFaculty.aspx")
            End If
           
        Catch ex As Exception

        End Try
        Try
            Dim i As Integer = Me.SearchBox.Text.IndexOf("'")
            If i = -1 Then
                If Me.Department.SelectedValue <> "All" Then
                    SDS.SelectCommand = " select * from Faculty  where ((Account_Status = 'activated') and (Department = '" + Me.Department.SelectedValue + "')) and ((Name like '%" + Me.SearchBox.Text + "%') or (User_Id like '%" + Me.SearchBox.Text + "%') or (Employee_No like '%" + Me.SearchBox.Text + "%')) order by designationorder"
                Else
                    SDS.SelectCommand = " select * from Faculty  where ((Account_Status = 'activated')) and ((Name like '%" + Me.SearchBox.Text + "%') or (User_Id like '%" + Me.SearchBox.Text + "%') or (Employee_No like '%" + Me.SearchBox.Text + "%')) order by designationorder"
                End If
                Me.FacultyData.Visible = True
            Else
                Me.FacultyData.Visible = False

            End If



        Catch ex As Exception

        End Try
    End Sub
End Class
