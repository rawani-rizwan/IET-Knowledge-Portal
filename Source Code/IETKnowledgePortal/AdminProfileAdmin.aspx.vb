Imports System.Data.SqlClient
Partial Class AdminProfileAdmin
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If Me.IsPostBack = False Then
                Dim username As String = Session("selectedadmin").ToString
                SDS.SelectCommand = "select * from Administrator where User_Id='" + username + "'"
                Dim dssa As DataSourceSelectArguments = New DataSourceSelectArguments
                Dim sdr As SqlDataReader
                SDS.DataSourceMode = SqlDataSourceMode.DataReader
                sdr = SDS.Select(dssa)
                sdr.Read()
                Me.UserId.Text = sdr("User_Id").ToString
                Me.Name.Text = sdr("Name").ToString
                Me.Designation.Text = sdr("Designation").ToString
                Me.Email.Text = sdr("Email_Id").ToString
                Me.Mobile.Text = sdr("Mobile").ToString
                Me.ProfilePicture.ImageUrl = sdr("Profile_Picture").ToString
            End If
          
        Catch ex As Exception
            Response.Redirect("AccessDenied.aspx")
        End Try
       
    End Sub

    Protected Sub Back_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Back.Click
        Try
            Response.Redirect("AdministratorAccountsAdmin.aspx")
        Catch ex As Exception

        End Try

    End Sub
End Class
