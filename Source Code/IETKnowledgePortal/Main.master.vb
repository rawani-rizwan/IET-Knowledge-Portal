Imports System.Data.SqlClient
Partial Class Main
    Inherits System.Web.UI.MasterPage

    Protected Sub Login_Authenticate(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.AuthenticateEventArgs) Handles Login.Authenticate
        Try
            Dim user As String = Login.UserName
            Dim password As String = Login.Password
            Dim dssa As DataSourceSelectArguments = New DataSourceSelectArguments
            Dim result As SqlDataReader
            StudentInfo.DataSourceMode = SqlDataSourceMode.DataReader
            If Me.UserType.SelectedValue = "Student" Then
                Me.StudentInfo.SelectCommand = "select * from student where user_id ='" + user + "'"
            ElseIf Me.UserType.SelectedValue = "Faculty" Then
                Me.StudentInfo.SelectCommand = "select * from faculty where user_id ='" + user + "'"
            ElseIf Me.UserType.SelectedValue = "Administrator" Then
                Me.StudentInfo.SelectCommand = "select * from administrator where user_Id ='" + user + "'"
            End If
            result = Me.StudentInfo.Select(dssa)
            If result.Read Then
                If result("password").ToString = password Then
                    If UserType.SelectedValue = "Student" Then
                        If result("Account_Status").ToString = "activated" Then
                            Session("user") = user
                            Session("usertype") = "student"
                            If result("First_Login").ToString = "true" Then
                                Response.Redirect("CompleteProfileStudent.aspx")
                            Else
                                Response.Redirect("~/StudentHome.aspx")
                            End If

                        Else
                            Login.FailureText = "Your account has not yet been activated by the administrator."
                        End If
                    ElseIf UserType.SelectedValue = "Faculty" Then
                        If result("Account_Status").ToString = "activated" Then
                            Session("user") = user
                            Session("usertype") = "faculty"
                            If result("First_Login").ToString = "true" Then
                                Response.Redirect("CompleteProfileFaculty.aspx")
                            Else
                                Response.Redirect("~/FacultyHome.aspx")
                            End If

                        Else
                            Login.FailureText = "Your account has not yet been activated by the administrator."
                        End If
                    ElseIf UserType.SelectedValue = "Administrator" Then
                        Session("user") = user
                        Session("usertype") = "admin"
                        Response.Redirect("~/AdminHome.aspx")
                    End If
                End If
            End If
        Catch ex As SqlException
            Login.FailureText = "Invalid user name or password!"
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            Try
                If Session("usertype").ToString = "student" Then
                    Response.Redirect("~/StudentHome.aspx")
                ElseIf Session("usertype").ToString = "faculty" Then
                    Response.Redirect("~/FacultyHome.aspx")
                ElseIf Session("usertype").ToString = "admin" Then
                    Response.Redirect("~/AdminHome.aspx")
                End If
            Catch ex As Exception

            End Try
            Login.FailureText = "Invalid user name or password!"
            Dim l As LiteralControl = New LiteralControl()
            Dim sdr As SqlDataReader
            Dim con As SqlConnection = New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\IET.mdf;Integrated Security=True;User Instance=True")
            con.Open()
            Dim selectcommand As SqlCommand = New SqlCommand("select * from News_Gallery order by priority", con)
            sdr = selectcommand.ExecuteReader()
            l.Text = "<marquee  direction=""up"" scrolldelay=""20"" scrollamount=""3"" height=""325"" width=""225""  onMouseover=""this.stop()"" onMouseout=""this.start()"">"
            While (sdr.Read)
                If IsDBNull(sdr("News_Link")) Or sdr("News_Link").ToString = "" Then
                    l.Text = l.Text + sdr("News_Text").ToString + "<br><br>"
                Else
                    l.Text = l.Text + "<a href=""" + sdr("News_Link").ToString + """ target=""_blank"" style= ""color:blue"" >" + sdr("News_Text").ToString + "</a><br><br>"
                End If

            End While
            l.Text = l.Text + "</marquee>"
            Me.NewsPanel.Controls.Add(l)
            con.Close()
        Catch ex As Exception

        End Try

    End Sub

  
End Class

