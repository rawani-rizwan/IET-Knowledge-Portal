Imports System.Data.SqlClient
Partial Class ViewNoticesFaculty
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
                SDS.SelectCommand = "select * from Notices where ((Uploader_Type ='Faculty') and (Uploader_Id ='" + Session("user").ToString + "')) or (( Faculty_Visibility_Department like '%" + department + "%')) order by Date_Posted desc"

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
                Response.Redirect("ShowNoticeFaculty.aspx")


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
            SDS.SelectCommand = "select * from Notices where ((Uploader_Type ='Faculty') and (Uploader_Id ='" + Session("user").ToString + "')) or (( Faculty_Visibility_Department like '%" + department + "%')) order by Date_Posted desc"
        Catch ex As Exception

        End Try
    End Sub
End Class
