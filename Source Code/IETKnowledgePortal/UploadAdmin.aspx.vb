Imports System.Data.SqlClient

Partial Class UploadAdmin
    Inherits System.Web.UI.Page

   
    Protected Sub MsgBox(ByVal F As Object, ByVal sMsg As String)
        Dim sb As New StringBuilder()
        Dim oFormObject As System.Web.UI.Control = Nothing
        Try
            sMsg = sMsg.Replace("'", "\'")
            sMsg = sMsg.Replace(Chr(34), "\" & Chr(34))
            sMsg = sMsg.Replace(vbCrLf, "\n")
            sMsg = "<script language='javascript'>alert('" & sMsg & "');</script>"
            sb = New StringBuilder()
            sb.Append(sMsg)
            For Each oFormObject In F.Controls
                If TypeOf oFormObject Is HtmlForm Then
                    Exit For
                End If
            Next
            oFormObject.Controls.AddAt(oFormObject.Controls.Count, New LiteralControl(sb.ToString))

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub Upload_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Upload.Click
        Try

            If Me.FileUpload1.HasFile Then
                If Me.FileUpload1.PostedFile.ContentLength < 15728640 Then
                    Dim i As Integer = 0
                    Me.SizeExceeded.Visible = False
                    SDS.DataSourceMode = SqlDataSourceMode.DataReader
                    Dim dssa As DataSourceSelectArguments = New DataSourceSelectArguments
                    Dim sdr As SqlDataReader
                    SDS.SelectCommand = "select Id from Files "
                    sdr = SDS.Select(dssa)
                    Dim id As Double = 0
                    While (sdr.Read())
                        id = Val(sdr("Id").ToString)
                    End While
                    id = id + 1
                    Dim filename As String = System.IO.Path.GetFileNameWithoutExtension(Me.FileUpload1.FileName) + "_fileid=" + id.ToString + System.IO.Path.GetExtension(Me.FileUpload1.FileName)
                    Dim filepath As String = "resources/" + filename
                    filename = System.IO.Path.GetFileName(Me.FileUpload1.FileName)
                    SDS.SelectCommand = "select * from Administrator where User_Id = '" + Session("user").ToString + "'"
                    SDS.DataSourceMode = SqlDataSourceMode.DataReader
                    sdr = SDS.Select(dssa)
                    sdr.Read()
                    Dim uploadertype As String = "Administrator"
                    Dim uploaderid As String = sdr("User_Id").ToString
                    Dim uploadedby As String = sdr("Name").ToString + ", " + sdr("Designation").ToString
                    Dim facultyvisibilitydepartment As String = ""
                    For i = 0 To Me.Department.Items.Count - 1
                        If Me.Department.Items.Item(i).Selected = True Then
                            facultyvisibilitydepartment = facultyvisibilitydepartment + "(" + Me.Department.Items.Item(i).Value + ")"
                        End If
                    Next
                    Dim studentvisibilityyear As String = ""
                    For i = 0 To Me.Year.Items.Count - 1
                        If Me.Year.Items.Item(i).Selected = True Then
                            studentvisibilityyear = studentvisibilityyear + "(" + Me.Year.Items.Item(i).Value + ")"
                        End If
                    Next
                    Dim studentvisibilitybranch As String = ""
                    For i = 0 To Me.Branch.Items.Count - 1
                        If Me.Branch.Items.Item(i).Selected = True Then
                            studentvisibilitybranch = studentvisibilitybranch + "(" + Me.Branch.Items.Item(i).Value + ")"
                        End If
                    Next
                    Dim categoryvalue As String = Me.Category.SelectedValue
                    If Me.Category.SelectedValue = "Other" Then
                        categoryvalue = "Miscellaneous"
                    End If
                    SDS.InsertCommand = "insert into Files values (" + id.ToString + " , '" + filename + "' , '" + "~/" + filepath + "' , '" + uploadertype + "' , '" + uploadedby + "' , '" + uploaderid + "' , GETDATE() , '" + categoryvalue + "' , '" + Me.TitleText.Text + "' , '" + Me.Author.Text + "' , '" + Me.Publisher.Text + "' , '" + Me.Description.Text + "' , '" + facultyvisibilitydepartment + "' , '" + studentvisibilityyear + "' , '" + studentvisibilitybranch + "')"
                    SDS.DataSourceMode = SqlDataSourceMode.DataSet
                    SDS.Insert()
                    FileUpload1.SaveAs(Server.MapPath(filepath))
                    Response.Redirect("~/FileUploadedAdmin.aspx")
                Else
                    Me.SizeExceeded.Visible = True
                End If

            End If

        Catch ex As SqlException
            Me.MsgBox(Me, "Some fields may contain invalid values. Try removing special characters like single or double qoutes (') ")
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub Cancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Cancel.Click
        Try
            Response.Redirect("~/KnowledgeSharingAdmin.aspx")
        Catch ex As Exception

        End Try

    End Sub
End Class
