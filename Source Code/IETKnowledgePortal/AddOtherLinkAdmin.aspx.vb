Imports System.Data.SqlClient
Partial Class AddOtherLinkAdmin
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
            Dim id As Double = 0
            Dim dssa As DataSourceSelectArguments = New DataSourceSelectArguments
            Dim sdr As SqlDataReader
            SDS.SelectCommand = "select * from Links "
            SDS.DataSourceMode = SqlDataSourceMode.DataReader
            sdr = SDS.Select(dssa)
            While (sdr.Read)
                id = sdr("Id")
            End While
            id = id + 1
            SDS.SelectCommand = "select * from Administrator where User_Id = '" + Session("user").ToString + "'"
            SDS.DataSourceMode = SqlDataSourceMode.DataReader
            sdr = SDS.Select(dssa)
            sdr.Read()
            Dim uploadedby As String = sdr("Name").ToString + ", " + sdr("Designation").ToString
            SDS.InsertCommand = "insert into Links values (" + id.ToString + " , 'Miscellaneous' , '" + Me.TitleText.Text + "' , '" + Me.Link.Text + "' , GETDATE() , '" + uploadedby + "' , 'Administrator' , '" + Session("user").ToString + "')"
            SDS.DataSourceMode = SqlDataSourceMode.DataSet
            SDS.Insert()
            Me.RecordAdded.Visible = True
        Catch ex As SqlException
            Me.MsgBox(Me, "Could not add Link! Some fields may contain invalid values. Try removing special characters like single or double qoutes (') ")
            Me.RecordAdded.Visible = False
        Catch ex As Exception
            Me.RecordAdded.Visible = False
        End Try
    End Sub

    Protected Sub Done_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Done.Click
        Try
            Response.Redirect("UsefulLinksAdmin.aspx")
        Catch ex As Exception

        End Try
    End Sub
End Class
