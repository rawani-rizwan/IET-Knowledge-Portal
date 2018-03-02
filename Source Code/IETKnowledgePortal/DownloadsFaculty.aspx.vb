Imports System.Data.SqlClient
Partial Class DownloadsFaculty
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If Me.IsPostBack = False Then
                SDS1.SelectCommand = "select * from Faculty where User_Id = '" + Session("user").ToString + "'"
                Dim sdr As SqlDataReader
                Dim dssa As DataSourceSelectArguments = New DataSourceSelectArguments
                SDS1.DataSourceMode = SqlDataSourceMode.DataReader
                sdr = SDS1.Select(dssa)
                sdr.Read()
                Dim department As String = "(" + sdr("Department").ToString + ")"
                SDS.SelectCommand = "select * from Files where ((Uploader_Type ='Faculty') and (Uploader_Id ='" + Session("user").ToString + "')) or (( Faculty_Visibility_Department like '%" + department + "%')) order by Date_Uploaded desc"
               
            End If
           
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub Search_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Search.Click
        Try
            SDS1.SelectCommand = "select * from Faculty where User_Id = '" + Session("user").ToString + "'"
            Dim sdr As SqlDataReader
            Dim dssa As DataSourceSelectArguments = New DataSourceSelectArguments
            SDS1.DataSourceMode = SqlDataSourceMode.DataReader
            sdr = SDS1.Select(dssa)
            sdr.Read()
            Dim department As String = "(" + sdr("Department").ToString + ")"
            Dim i As Integer = Me.SearchBox.Text.IndexOf("'")
            If i = -1 Then
                If Me.Category.SelectedValue <> "All" Then
                    If Me.UploadedBy.SelectedValue <> "All" Then
                        If Me.UploadedBy.SelectedValue <> "Faculty" Then
                            SDS.SelectCommand = " select * from Files where ((Category = '" + Me.Category.SelectedValue + "') and (Uploader_Type = '" + Me.UploadedBy.SelectedValue + "') and ( Faculty_Visibility_Department like '%" + department + "%')) and ((File_Name like '%" + Me.SearchBox.Text + "%') or (Uploaded_By like '%" + Me.SearchBox.Text + "%') or (Title like '%" + Me.SearchBox.Text + "%') or (Author like '%" + Me.SearchBox.Text + "%') or (Publisher like '%" + Me.SearchBox.Text + "%')) order by Date_Uploaded desc"
                        Else
                            SDS.SelectCommand = " select * from Files where ((Category = '" + Me.Category.SelectedValue + "') and (Uploader_Type = '" + Me.UploadedBy.SelectedValue + "') and ((( Faculty_Visibility_Department like '%" + department + "%')) or ((Uploader_Type ='Faculty') and (Uploader_Id ='" + Session("user").ToString + "')))) and ((File_Name like '%" + Me.SearchBox.Text + "%') or (Uploaded_By like '%" + Me.SearchBox.Text + "%') or (Title like '%" + Me.SearchBox.Text + "%') or (Author like '%" + Me.SearchBox.Text + "%') or (Publisher like '%" + Me.SearchBox.Text + "%')) order by Date_Uploaded desc"
                        End If

                    Else
                        SDS.SelectCommand = " select * from Files where ((Category = '" + Me.Category.SelectedValue + "') and ((( Faculty_Visibility_Department like '%" + department + "%')) or ((Uploader_Type ='Faculty') and (Uploader_Id ='" + Session("user").ToString + "')))) and ((File_Name like '%" + Me.SearchBox.Text + "%') or (Uploaded_By like '%" + Me.SearchBox.Text + "%') or (Title like '%" + Me.SearchBox.Text + "%') or (Author like '%" + Me.SearchBox.Text + "%') or (Publisher like '%" + Me.SearchBox.Text + "%')) order by Date_Uploaded desc"
                    End If
                    Me.FilesData.Visible = True
                Else
                    If Me.UploadedBy.SelectedValue <> "All" Then
                        If Me.UploadedBy.SelectedValue <> "Faculty" Then
                            SDS.SelectCommand = " select * from Files where ((Uploader_Type = '" + Me.UploadedBy.SelectedValue + "') and ( Faculty_Visibility_Department like '%" + department + "%')) and ((File_Name like '%" + Me.SearchBox.Text + "%') or (Uploaded_By like '%" + Me.SearchBox.Text + "%') or (Title like '%" + Me.SearchBox.Text + "%') or (Author like '%" + Me.SearchBox.Text + "%') or (Publisher like '%" + Me.SearchBox.Text + "%')) order by Date_Uploaded desc"
                        Else
                            SDS.SelectCommand = " select * from Files where ((Uploader_Type = '" + Me.UploadedBy.SelectedValue + "') and ((( Faculty_Visibility_Department like '%" + department + "%')) or ((Uploader_Type ='Faculty') and (Uploader_Id ='" + Session("user").ToString + "')))) and ((File_Name like '%" + Me.SearchBox.Text + "%') or (Uploaded_By like '%" + Me.SearchBox.Text + "%') or (Title like '%" + Me.SearchBox.Text + "%') or (Author like '%" + Me.SearchBox.Text + "%') or (Publisher like '%" + Me.SearchBox.Text + "%')) order by Date_Uploaded desc"
                        End If

                    Else
                        SDS.SelectCommand = " select * from Files where (((( Faculty_Visibility_Department like '%" + department + "%')) or ((Uploader_Type ='Faculty') and (Uploader_Id ='" + Session("user").ToString + "')))) and ((File_Name like '%" + Me.SearchBox.Text + "%') or (Uploaded_By like '%" + Me.SearchBox.Text + "%') or (Title like '%" + Me.SearchBox.Text + "%') or (Author like '%" + Me.SearchBox.Text + "%') or (Publisher like '%" + Me.SearchBox.Text + "%')) order by Date_Uploaded desc"
                    End If
                    Me.FilesData.Visible = True
                End If
            Else
                Me.FilesData.Visible = False

            End If
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub FilesData_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles FilesData.RowCommand
        Try
            Dim currentCommand As String = e.CommandName
            If currentCommand = "details" Then
                Dim currentRowIndex As Integer = Int32.Parse(e.CommandArgument)
                Dim ID As String = Me.FilesData.DataKeys(currentRowIndex).Value
                Session("selectedfile") = ID
                Response.Redirect("FileDetailsFaculty.aspx")

            ElseIf currentCommand = "download" Then
                Dim currentRowIndex As Integer = Int32.Parse(e.CommandArgument)
                Dim ID As String = Me.FilesData.DataKeys(currentRowIndex).Value
                SDS1.SelectCommand = "select * from Files where Id = " + ID
                Dim dssa1 As DataSourceSelectArguments = New DataSourceSelectArguments
                Dim sdr1 As SqlDataReader
                SDS1.DataSourceMode = SqlDataSourceMode.DataReader
                sdr1 = SDS1.Select(dssa1)
                sdr1.Read()
                Dim path As String = Server.MapPath(sdr1("File_Path").ToString)
                Dim name As String = sdr1("File_Name").ToString
                Response.ContentType = "application/octet-stream"
                Response.AppendHeader("content-disposition", "attachment; filename=" + name)
                Response.TransmitFile(path)
            End If
           
        Catch ex As Exception

        End Try
        Try
            SDS1.SelectCommand = "select * from Faculty where User_Id = '" + Session("user").ToString + "'"
            Dim sdr As SqlDataReader
            Dim dssa As DataSourceSelectArguments = New DataSourceSelectArguments
            SDS1.DataSourceMode = SqlDataSourceMode.DataReader
            sdr = SDS1.Select(dssa)
            sdr.Read()
            Dim department As String = "(" + sdr("Department").ToString + ")"
            Dim i As Integer = Me.SearchBox.Text.IndexOf("'")
            If i = -1 Then
                If Me.Category.SelectedValue <> "All" Then
                    If Me.UploadedBy.SelectedValue <> "All" Then
                        If Me.UploadedBy.SelectedValue <> "Faculty" Then
                            SDS.SelectCommand = " select * from Files where ((Category = '" + Me.Category.SelectedValue + "') and (Uploader_Type = '" + Me.UploadedBy.SelectedValue + "') and ( Faculty_Visibility_Department like '%" + department + "%')) and ((File_Name like '%" + Me.SearchBox.Text + "%') or (Uploaded_By like '%" + Me.SearchBox.Text + "%') or (Title like '%" + Me.SearchBox.Text + "%') or (Author like '%" + Me.SearchBox.Text + "%') or (Publisher like '%" + Me.SearchBox.Text + "%')) order by Date_Uploaded desc"
                        Else
                            SDS.SelectCommand = " select * from Files where ((Category = '" + Me.Category.SelectedValue + "') and (Uploader_Type = '" + Me.UploadedBy.SelectedValue + "') and ((( Faculty_Visibility_Department like '%" + department + "%')) or ((Uploader_Type ='Faculty') and (Uploader_Id ='" + Session("user").ToString + "')))) and ((File_Name like '%" + Me.SearchBox.Text + "%') or (Uploaded_By like '%" + Me.SearchBox.Text + "%') or (Title like '%" + Me.SearchBox.Text + "%') or (Author like '%" + Me.SearchBox.Text + "%') or (Publisher like '%" + Me.SearchBox.Text + "%')) order by Date_Uploaded desc"
                        End If

                    Else
                        SDS.SelectCommand = " select * from Files where ((Category = '" + Me.Category.SelectedValue + "') and ((( Faculty_Visibility_Department like '%" + department + "%')) or ((Uploader_Type ='Faculty') and (Uploader_Id ='" + Session("user").ToString + "')))) and ((File_Name like '%" + Me.SearchBox.Text + "%') or (Uploaded_By like '%" + Me.SearchBox.Text + "%') or (Title like '%" + Me.SearchBox.Text + "%') or (Author like '%" + Me.SearchBox.Text + "%') or (Publisher like '%" + Me.SearchBox.Text + "%')) order by Date_Uploaded desc"
                    End If
                    Me.FilesData.Visible = True
                Else
                    If Me.UploadedBy.SelectedValue <> "All" Then
                        If Me.UploadedBy.SelectedValue <> "Faculty" Then
                            SDS.SelectCommand = " select * from Files where ((Uploader_Type = '" + Me.UploadedBy.SelectedValue + "') and ( Faculty_Visibility_Department like '%" + department + "%')) and ((File_Name like '%" + Me.SearchBox.Text + "%') or (Uploaded_By like '%" + Me.SearchBox.Text + "%') or (Title like '%" + Me.SearchBox.Text + "%') or (Author like '%" + Me.SearchBox.Text + "%') or (Publisher like '%" + Me.SearchBox.Text + "%')) order by Date_Uploaded desc"
                        Else
                            SDS.SelectCommand = " select * from Files where ((Uploader_Type = '" + Me.UploadedBy.SelectedValue + "') and ((( Faculty_Visibility_Department like '%" + department + "%')) or ((Uploader_Type ='Faculty') and (Uploader_Id ='" + Session("user").ToString + "')))) and ((File_Name like '%" + Me.SearchBox.Text + "%') or (Uploaded_By like '%" + Me.SearchBox.Text + "%') or (Title like '%" + Me.SearchBox.Text + "%') or (Author like '%" + Me.SearchBox.Text + "%') or (Publisher like '%" + Me.SearchBox.Text + "%')) order by Date_Uploaded desc"
                        End If

                    Else
                        SDS.SelectCommand = " select * from Files where (((( Faculty_Visibility_Department like '%" + department + "%')) or ((Uploader_Type ='Faculty') and (Uploader_Id ='" + Session("user").ToString + "')))) and ((File_Name like '%" + Me.SearchBox.Text + "%') or (Uploaded_By like '%" + Me.SearchBox.Text + "%') or (Title like '%" + Me.SearchBox.Text + "%') or (Author like '%" + Me.SearchBox.Text + "%') or (Publisher like '%" + Me.SearchBox.Text + "%')) order by Date_Uploaded desc"
                    End If
                    Me.FilesData.Visible = True
                End If
            Else
                Me.FilesData.Visible = False

            End If
        Catch ex As Exception

        End Try
    End Sub
End Class
