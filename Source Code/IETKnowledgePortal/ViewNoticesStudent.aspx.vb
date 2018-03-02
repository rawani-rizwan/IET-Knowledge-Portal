Imports System.Data.SqlClient
Partial Class ViewNoticesStudent
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If Me.IsPostBack = False Then
                SDS1.SelectCommand = "select * from Student where User_Id = '" + Session("user").ToString + "'"
                Dim sdr As SqlDataReader
                Dim dssa As DataSourceSelectArguments = New DataSourceSelectArguments
                SDS1.DataSourceMode = SqlDataSourceMode.DataReader
                sdr = SDS1.Select(dssa)
                sdr.Read()
                Dim year As String = "(" + sdr("Year").ToString + ")"
                Dim branch As String = "(" + sdr("Branch").ToString + ")"
                SDS.SelectCommand = "select * from Notices where ((Uploader_Type ='Student') and (Uploader_Id ='" + Session("user").ToString + "')) or (( Student_Visibility_Year like '%" + year + "%') and (Student_Visibility_Branch like '%" + branch + "%')) order by Date_Posted desc"
            End If

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub NoticesData_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles NoticesData.RowCommand
        Try
            Dim currentCommand As String = e.CommandName
            If currentCommand = "view" Then
                Dim currentRowIndex As Integer = Int32.Parse(e.CommandArgument)
                Dim ID As String = Me.NoticesData.DataKeys(currentRowIndex).Value
                Session("selectednotice") = ID
                Response.Redirect("ShowNoticeStudent.aspx")

           
            End If
           
        Catch ex As Exception

        End Try
        Try
            SDS1.SelectCommand = "select * from Student where User_Id = '" + Session("user").ToString + "'"
            Dim sdr As SqlDataReader
            Dim dssa As DataSourceSelectArguments = New DataSourceSelectArguments
            SDS1.DataSourceMode = SqlDataSourceMode.DataReader
            sdr = SDS1.Select(dssa)
            sdr.Read()
            Dim year As String = "(" + sdr("Year").ToString + ")"
            Dim branch As String = "(" + sdr("Branch").ToString + ")"
            SDS.SelectCommand = "select * from Notices where ((Uploader_Type ='Student') and (Uploader_Id ='" + Session("user").ToString + "')) or (( Student_Visibility_Year like '%" + year + "%') and (Student_Visibility_Branch like '%" + branch + "%')) order by Date_Posted desc"
        Catch ex As Exception

        End Try
    End Sub
End Class
