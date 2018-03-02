Imports System.Data.SqlClient
Partial Class AdminHome
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            Dim sdr As SqlDataReader
            Dim dssa As DataSourceSelectArguments = New DataSourceSelectArguments
            SDS.SelectCommand = "select * from Administrator where User_Id = '" + Session("user").ToString + "'"
            SDS.DataSourceMode = SqlDataSourceMode.DataReader
            sdr = SDS.Select(dssa)
            sdr.Read()
            Me.HeadingLabel.Text = "Welcome " + sdr("Name").ToString
        Catch ex As Exception
            Response.Redirect("AccessDenied.aspx")
        End Try
    End Sub
End Class
