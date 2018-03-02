
Partial Class StudentAccountsFaculty
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If Me.IsPostBack = False Then
                SDS.SelectCommand = " select * from Student where Account_Status = 'activated' order by Year, Branch, Roll_No"
            End If

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub Search_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Search.Click
        Try
            Dim i As Integer = Me.SearchBox.Text.IndexOf("'")
            If i = -1 Then
                If Me.Year.SelectedValue <> "All" Then
                    If Me.Branch.SelectedValue <> "All" Then
                        SDS.SelectCommand = " select * from Student where ((Account_Status = 'activated') and (Branch = '" + Me.Branch.SelectedValue + "') and (Year = '" + Me.Year.SelectedValue + "')) and ((Name like '%" + Me.SearchBox.Text + "%') or (User_Id like '%" + Me.SearchBox.Text + "%') or (Enrollment_No like '%" + Me.SearchBox.Text + "%') or (Scholar_No like '%" + Me.SearchBox.Text + "%') or (Roll_No like '%" + Me.SearchBox.Text + "%')) order by Year, Branch, Roll_No"
                    Else
                        SDS.SelectCommand = " select * from Student where ((Account_Status = 'activated') and (Year = '" + Me.Year.SelectedValue + "')) and ((Name like '%" + Me.SearchBox.Text + "%') or (User_Id like '%" + Me.SearchBox.Text + "%') or (Enrollment_No like '%" + Me.SearchBox.Text + "%') or (Scholar_No like '%" + Me.SearchBox.Text + "%') or (Roll_No like '%" + Me.SearchBox.Text + "%')) order by Year, Branch, Roll_No"
                    End If
                    Me.StudentData.Visible = True
                Else
                    If Me.Branch.SelectedValue <> "All" Then
                        SDS.SelectCommand = " select * from Student where ((Account_Status = 'activated') and (Branch = '" + Me.Branch.SelectedValue + "')) and ((Name like '%" + Me.SearchBox.Text + "%') or (User_Id like '%" + Me.SearchBox.Text + "%') or (Enrollment_No like '%" + Me.SearchBox.Text + "%') or (Scholar_No like '%" + Me.SearchBox.Text + "%') or (Roll_No like '%" + Me.SearchBox.Text + "%')) order by Year, Branch, Roll_No"
                    Else
                        SDS.SelectCommand = " select * from Student where ((Account_Status = 'activated')) and ((Name like '%" + Me.SearchBox.Text + "%') or (User_Id like '%" + Me.SearchBox.Text + "%') or (Enrollment_No like '%" + Me.SearchBox.Text + "%') or (Scholar_No like '%" + Me.SearchBox.Text + "%') or (Roll_No like '%" + Me.SearchBox.Text + "%')) order by Year, Branch, Roll_No"
                    End If
                    Me.StudentData.Visible = True
                End If
            Else
                Me.StudentData.Visible = False

            End If



        Catch ex As Exception

        End Try
    End Sub

    Protected Sub StudentData_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles StudentData.RowCommand
        Try
            Dim currentCommand As String = e.CommandName
            If currentCommand = "viewprofile" Then
                Dim currentRowIndex As Integer = Int32.Parse(e.CommandArgument)
                Dim UserID As String = Me.StudentData.DataKeys(currentRowIndex).Value
                Session("selectedstudent") = UserID
                Response.Redirect("StudentProfileFaculty.aspx")
            End If
          
        Catch ex As Exception

        End Try
        Try
            Dim i As Integer = Me.SearchBox.Text.IndexOf("'")
            If i = -1 Then
                If Me.Year.SelectedValue <> "All" Then
                    If Me.Branch.SelectedValue <> "All" Then
                        SDS.SelectCommand = " select * from Student where ((Account_Status = 'activated') and (Branch = '" + Me.Branch.SelectedValue + "') and (Year = '" + Me.Year.SelectedValue + "')) and ((Name like '%" + Me.SearchBox.Text + "%') or (User_Id like '%" + Me.SearchBox.Text + "%') or (Enrollment_No like '%" + Me.SearchBox.Text + "%') or (Scholar_No like '%" + Me.SearchBox.Text + "%') or (Roll_No like '%" + Me.SearchBox.Text + "%')) order by Year, Branch, Roll_No"
                    Else
                        SDS.SelectCommand = " select * from Student where ((Account_Status = 'activated') and (Year = '" + Me.Year.SelectedValue + "')) and ((Name like '%" + Me.SearchBox.Text + "%') or (User_Id like '%" + Me.SearchBox.Text + "%') or (Enrollment_No like '%" + Me.SearchBox.Text + "%') or (Scholar_No like '%" + Me.SearchBox.Text + "%') or (Roll_No like '%" + Me.SearchBox.Text + "%')) order by Year, Branch, Roll_No"
                    End If
                    Me.StudentData.Visible = True
                Else
                    If Me.Branch.SelectedValue <> "All" Then
                        SDS.SelectCommand = " select * from Student where ((Account_Status = 'activated') and (Branch = '" + Me.Branch.SelectedValue + "')) and ((Name like '%" + Me.SearchBox.Text + "%') or (User_Id like '%" + Me.SearchBox.Text + "%') or (Enrollment_No like '%" + Me.SearchBox.Text + "%') or (Scholar_No like '%" + Me.SearchBox.Text + "%') or (Roll_No like '%" + Me.SearchBox.Text + "%')) order by Year, Branch, Roll_No"
                    Else
                        SDS.SelectCommand = " select * from Student where ((Account_Status = 'activated')) and ((Name like '%" + Me.SearchBox.Text + "%') or (User_Id like '%" + Me.SearchBox.Text + "%') or (Enrollment_No like '%" + Me.SearchBox.Text + "%') or (Scholar_No like '%" + Me.SearchBox.Text + "%') or (Roll_No like '%" + Me.SearchBox.Text + "%')) order by Year, Branch, Roll_No"
                    End If
                    Me.StudentData.Visible = True
                End If
            Else
                Me.StudentData.Visible = False

            End If



        Catch ex As Exception

        End Try
    End Sub
End Class
