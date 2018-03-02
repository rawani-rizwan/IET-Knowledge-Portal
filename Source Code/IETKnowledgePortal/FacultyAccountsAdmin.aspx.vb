Imports System.Data.SqlClient
Partial Class FacultyAccountsAdmin
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
            If currentCommand = "viewprofile" Or currentCommand = "del" Then
                Dim currentRowIndex As Integer = Int32.Parse(e.CommandArgument)
                Dim UserID As String = Me.FacultyData.DataKeys(currentRowIndex).Value
                If currentCommand = "viewprofile" Then
                    Session("selectedfaculty") = UserID
                    Response.Redirect("FacultyProfileAdmin.aspx")
                Else
                   
                    Dim sdr As SqlDataReader
                    Dim dssa As DataSourceSelectArguments = New DataSourceSelectArguments
                    SDS1.SelectCommand = "select * from Faculty where User_Id = '" + UserID + "'"
                    SDS1.DataSourceMode = SqlDataSourceMode.DataReader
                    sdr = SDS1.Select(dssa)
                    sdr.Read()
                    Dim filetodelete As String = sdr("Profile_Picture").ToString
                    If filetodelete = "~/images/profile pictures/no_profile.jpg" Then
                    Else
                        System.IO.File.Delete(Server.MapPath(filetodelete))
                    End If
                    SDS.DeleteCommand = "delete from Faculty where User_Id ='" + UserID + "'"
                    SDS.Delete()

                End If

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
