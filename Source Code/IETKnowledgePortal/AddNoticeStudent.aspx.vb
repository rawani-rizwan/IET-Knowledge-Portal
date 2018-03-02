Imports System.Data.SqlClient
Partial Class AddNoticeStudent
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

    Protected Sub Add_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Add.Click
        Try
            Dim i As Integer = 0
            Dim dssa As DataSourceSelectArguments = New DataSourceSelectArguments
            Dim sdr As SqlDataReader
            SDS.SelectCommand = "select * from Notices"
            SDS.DataSourceMode = SqlDataSourceMode.DataReader
            sdr = SDS.Select(dssa)
            Dim id As Double = 0
            While (sdr.Read)
                id = sdr("Id")
            End While
            id = id + 1
            SDS.SelectCommand = "select * from Student where User_Id = '" + Session("user").ToString + "'"
            sdr = SDS.Select(dssa)
            sdr.Read()
            Dim uploadedby As String = sdr("Name").ToString + ", " + sdr("Year").ToString + " Year, " + sdr("Branch").ToString
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
            SDS.InsertCommand = "insert into Notices values (" + id.ToString + " , '" + Me.Subject.Text + "' , '" + Me.Notice.Text + "' , GETDATE() , '" + uploadedby + "' , 'Student' , '" + Session("user").ToString + "' , '" + facultyvisibilitydepartment + "' , '" + studentvisibilityyear + "' , '" + studentvisibilitybranch + "')"
            SDS.DataSourceMode = SqlDataSourceMode.DataSet
            SDS.Insert()
            Response.Redirect("NoticeAddedStudent.aspx")
        Catch ex As SqlException
            Me.MsgBox(Me, "Could not add Notice! Some fields may contain invalid values. Try removing special characters like single or double qoutes (') ")
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub Cancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Cancel.Click
        Try
            Response.Redirect("NoticeBoardStudent.aspx")
        Catch ex As Exception

        End Try
    End Sub
End Class
