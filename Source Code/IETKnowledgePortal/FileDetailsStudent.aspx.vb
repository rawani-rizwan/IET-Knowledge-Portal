Imports System.Data.SqlClient
Partial Class FileDetailsStudent
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If Me.IsPostBack = False Then
                Dim dssa As DataSourceSelectArguments = New DataSourceSelectArguments
                Dim sdr As SqlDataReader
                SDS.SelectCommand = "select * from Files where Id = " + Session("selectedfile")
                SDS.DataSourceMode = SqlDataSourceMode.DataReader
                sdr = SDS.Select(dssa)
                sdr.Read()
                Me.FileName.Text = sdr("File_Name").ToString()
                Me.FileName.Text = Me.FileName.Text.Replace(vbNewLine, "<br>")
                Me.TitleText.Text = sdr("Title").ToString()
                Me.TitleText.Text = Me.TitleText.Text.Replace(vbNewLine, "<br>")
                Me.Category.Text = sdr("Category").ToString()
                Me.Category.Text = Me.Category.Text.Replace(vbNewLine, "<br>")
                Me.UploadedBy.Text = sdr("Uploaded_By").ToString()
                Me.UploadedBy.Text = Me.UploadedBy.Text.Replace(vbNewLine, "<br>")
                Me.DateUploaded.Text = sdr("Date_Uploaded").ToString()
                Me.DateUploaded.Text = Me.DateUploaded.Text.Replace(vbNewLine, "<br>")
                Me.Author.Text = sdr("Author").ToString()
                Me.Author.Text = Me.Author.Text.Replace(vbNewLine, "<br>")
                Me.Publisher.Text = sdr("Publisher").ToString()
                Me.Publisher.Text = Me.Publisher.Text.Replace(vbNewLine, "<br>")
                Me.Description.Text = sdr("Description").ToString()
                Me.Description.Text = Me.Description.Text.Replace(vbNewLine, "<br>")
                Me.filepath.Text = sdr("File_Path").ToString
                Me.FileId.Text = sdr("Id").ToString
                Me.ViewFile.NavigateUrl = Me.filepath.Text
                If sdr("Uploader_Type").ToString = "Student" And sdr("Uploader_Id").ToString = Session("user").ToString Then
                    Me.Delete.Visible = True
                Else
                    Me.Delete.Visible = False
                End If
            End If
            
        Catch ex As Exception
            Response.Redirect("AccessDenied.aspx")
        End Try
    End Sub

    Protected Sub Download_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Download.Click
        Try
            Response.ContentType = "application/octet-stream"
            Response.AppendHeader("content-disposition", "attachment; filename=" + FileName.Text)
            Response.TransmitFile(filepath.Text)
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub Delete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Delete.Click
        Try
           
            Dim filetodelete As String = filepath.Text
            System.IO.File.Delete(Server.MapPath(filetodelete))
            SDS.DeleteCommand = "delete from Files where Id = " + Me.FileId.Text
            SDS.Delete()
            Response.Redirect("DownloadsStudent.aspx")

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub Back_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Back.Click
        Try
            Response.Redirect("DownloadsStudent.aspx")
        Catch ex As Exception

        End Try
    End Sub
End Class
