Imports System.Data.SqlClient
Partial Class DownloadsAdmin
    Inherits System.Web.UI.Page

  

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If Me.IsPostBack = False Then
                SDS.SelectCommand = "select * from Files order by Date_Uploaded desc"
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
                Response.Redirect("FileDetailsAdmin.aspx")

            ElseIf currentCommand = "del" Then

                Dim currentRowIndex As Integer = Int32.Parse(e.CommandArgument)
                Dim ID As String = Me.FilesData.DataKeys(currentRowIndex).Value
               
                Dim sdr As SqlDataReader
                Dim dssa As DataSourceSelectArguments = New DataSourceSelectArguments
                SDS1.SelectCommand = "select * from Files where Id = " + ID
                SDS1.DataSourceMode = SqlDataSourceMode.DataReader
                sdr = SDS1.Select(dssa)
                sdr.Read()
                Dim filetodelete As String = sdr("File_Path").ToString

                System.IO.File.Delete(Server.MapPath(filetodelete))

                SDS.DeleteCommand = "delete from Files where Id = " + ID
                SDS.Delete()



            ElseIf currentCommand = "download" Then
                Dim currentRowIndex As Integer = Int32.Parse(e.CommandArgument)
                Dim ID As String = Me.FilesData.DataKeys(currentRowIndex).Value
                SDS1.SelectCommand = "select * from Files where Id = " + ID
                Dim dssa As DataSourceSelectArguments = New DataSourceSelectArguments
                Dim sdr As SqlDataReader
                SDS1.DataSourceMode = SqlDataSourceMode.DataReader
                sdr = SDS1.Select(dssa)
                sdr.Read()
                Dim path As String = Server.MapPath(sdr("File_Path").ToString)
                Dim name As String = sdr("File_Name").ToString
                Response.ContentType = "application/octet-stream"
                Response.AppendHeader("content-disposition", "attachment; filename=" + name)
                Response.TransmitFile(path)
            End If

            
        Catch ex As Exception
           
        End Try
        Try
            Dim i As Integer = Me.SearchBox.Text.IndexOf("'")
            If i = -1 Then
                If Me.Category.SelectedValue <> "All" Then
                    If Me.UploadedBy.SelectedValue <> "All" Then
                        SDS.SelectCommand = " select * from Files where ((Category = '" + Me.Category.SelectedValue + "') and (Uploader_Type = '" + Me.UploadedBy.SelectedValue + "')) and ((File_Name like '%" + Me.SearchBox.Text + "%') or (Uploaded_By like '%" + Me.SearchBox.Text + "%') or (Title like '%" + Me.SearchBox.Text + "%') or (Author like '%" + Me.SearchBox.Text + "%') or (Publisher like '%" + Me.SearchBox.Text + "%')) order by Date_Uploaded desc"
                    Else
                        SDS.SelectCommand = " select * from Files where ((Category = '" + Me.Category.SelectedValue + "')) and ((File_Name like '%" + Me.SearchBox.Text + "%') or (Uploaded_By like '%" + Me.SearchBox.Text + "%') or (Title like '%" + Me.SearchBox.Text + "%') or (Author like '%" + Me.SearchBox.Text + "%') or (Publisher like '%" + Me.SearchBox.Text + "%')) order by Date_Uploaded desc"
                    End If
                    Me.FilesData.Visible = True
                Else
                    If Me.UploadedBy.SelectedValue <> "All" Then
                        SDS.SelectCommand = " select * from Files where ((Uploader_Type = '" + Me.UploadedBy.SelectedValue + "')) and ((File_Name like '%" + Me.SearchBox.Text + "%') or (Uploaded_By like '%" + Me.SearchBox.Text + "%') or (Title like '%" + Me.SearchBox.Text + "%') or (Author like '%" + Me.SearchBox.Text + "%') or (Publisher like '%" + Me.SearchBox.Text + "%')) order by Date_Uploaded desc"
                    Else
                        SDS.SelectCommand = " select * from Files where ((File_Name like '%" + Me.SearchBox.Text + "%') or (Uploaded_By like '%" + Me.SearchBox.Text + "%') or (Title like '%" + Me.SearchBox.Text + "%') or (Author like '%" + Me.SearchBox.Text + "%') or (Publisher like '%" + Me.SearchBox.Text + "%')) order by Date_Uploaded desc"
                    End If
                    Me.FilesData.Visible = True
                End If
            Else
                Me.FilesData.Visible = False

            End If

        Catch ex As Exception

        End Try
     

    End Sub

    Protected Sub Search_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Search.Click
        Try
            Dim i As Integer = Me.SearchBox.Text.IndexOf("'")
            If i = -1 Then
                If Me.Category.SelectedValue <> "All" Then
                    If Me.UploadedBy.SelectedValue <> "All" Then
                        SDS.SelectCommand = " select * from Files where ((Category = '" + Me.Category.SelectedValue + "') and (Uploader_Type = '" + Me.UploadedBy.SelectedValue + "')) and ((File_Name like '%" + Me.SearchBox.Text + "%') or (Uploaded_By like '%" + Me.SearchBox.Text + "%') or (Title like '%" + Me.SearchBox.Text + "%') or (Author like '%" + Me.SearchBox.Text + "%') or (Publisher like '%" + Me.SearchBox.Text + "%')) order by Date_Uploaded desc"
                    Else
                        SDS.SelectCommand = " select * from Files where ((Category = '" + Me.Category.SelectedValue + "')) and ((File_Name like '%" + Me.SearchBox.Text + "%') or (Uploaded_By like '%" + Me.SearchBox.Text + "%') or (Title like '%" + Me.SearchBox.Text + "%') or (Author like '%" + Me.SearchBox.Text + "%') or (Publisher like '%" + Me.SearchBox.Text + "%')) order by Date_Uploaded desc"
                    End If
                    Me.FilesData.Visible = True
                Else
                    If Me.UploadedBy.SelectedValue <> "All" Then
                        SDS.SelectCommand = " select * from Files where ((Uploader_Type = '" + Me.UploadedBy.SelectedValue + "')) and ((File_Name like '%" + Me.SearchBox.Text + "%') or (Uploaded_By like '%" + Me.SearchBox.Text + "%') or (Title like '%" + Me.SearchBox.Text + "%') or (Author like '%" + Me.SearchBox.Text + "%') or (Publisher like '%" + Me.SearchBox.Text + "%')) order by Date_Uploaded desc"
                    Else
                        SDS.SelectCommand = " select * from Files where ((File_Name like '%" + Me.SearchBox.Text + "%') or (Uploaded_By like '%" + Me.SearchBox.Text + "%') or (Title like '%" + Me.SearchBox.Text + "%') or (Author like '%" + Me.SearchBox.Text + "%') or (Publisher like '%" + Me.SearchBox.Text + "%')) order by Date_Uploaded desc"
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
