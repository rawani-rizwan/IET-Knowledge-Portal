Imports System.Data.SqlClient
Partial Class DiscussionForumFaculty
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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If Me.IsPostBack = False Then
                Dim dssa As DataSourceSelectArguments = New DataSourceSelectArguments
                Dim sdr As SqlDataReader
                SDS.SelectCommand = "select * from Faculty where User_Id = '" + Session("user").ToString + "'"
                SDS.DataSourceMode = SqlDataSourceMode.DataReader
                sdr = SDS.Select(dssa)
                sdr.Read()
                Me.ProfilePicture.ImageUrl = sdr("Profile_Picture").ToString
                Me.PosterName.Text = sdr("Name").ToString
                Me.PosterPosition.Text = sdr("Designation").ToString + ", " + sdr("Department").ToString
                Me.PosterId.Text = sdr("User_Id").ToString
                Me.SetLiteral()
            End If
        Catch ex As Exception
            Response.Redirect("AccessDenied.aspx")
        End Try
    End Sub

    Protected Sub SetLiteral()
        Try
            Dim dssa As DataSourceSelectArguments = New DataSourceSelectArguments
            Dim sdr As SqlDataReader
            SDS.SelectCommand = "select * from Discussion_Threads order by Date_Posted desc"
            SDS.DataSourceMode = SqlDataSourceMode.DataReader
            sdr = SDS.Select(dssa)
            Me.Literal1.Text = "<table border=""2"" width=""700"">"
            Dim b As Boolean
            b = sdr.Read
            If b = True Then
                Me.Literal1.Text = Me.Literal1.Text + "<tr style=""background-color:#507CD1; color:white;""><th>Posted By</th><th>Discussion Thread Details</th></tr>"
            End If

            While (b)
                Me.Literal1.Text = Me.Literal1.Text + "<tr style=""background-color:#DEDFDE;"">"
                Dim dssa1 As DataSourceSelectArguments = New DataSourceSelectArguments
                Dim sdr1 As SqlDataReader
                SDS1.SelectCommand = "select * from " + sdr("Poster_Type").ToString + " where User_Id = '" + sdr("Poster_Id").ToString + "'"
                SDS1.DataSourceMode = SqlDataSourceMode.DataReader
                sdr1 = SDS1.Select(dssa1)
                Dim picture As String
                If sdr1.Read Then
                    picture = sdr1("Profile_Picture").ToString
                Else
                    picture = "~/images/profile pictures/no_profile.jpg"
                End If
                picture = picture.Substring(2)
                picture = picture.Replace(" ", "%20")
                Me.Literal1.Text = Me.Literal1.Text + "<td valign = ""top"" >"
                Me.Literal1.Text = Me.Literal1.Text + "<table>"
                Me.Literal1.Text = Me.Literal1.Text + "<tr>"
                Me.Literal1.Text = Me.Literal1.Text + "<td valign = ""top"" ><img src = """ + picture + """ style= ""width:100px; height:120px;"" /></td>"
                Me.Literal1.Text = Me.Literal1.Text + "</tr>"
                Me.Literal1.Text = Me.Literal1.Text + "<tr>"
                Me.Literal1.Text = Me.Literal1.Text + "<td valign = ""top"" ><label style= ""font-size:small;"" >" + sdr("Poster_Name").ToString + "</label></td>"
                Me.Literal1.Text = Me.Literal1.Text + "</tr>"
                Me.Literal1.Text = Me.Literal1.Text + "<tr>"
                Me.Literal1.Text = Me.Literal1.Text + "<td valign = ""top"" ><label style= ""font-size:small;"" >" + sdr("Poster_Position").ToString + "</label></td>"
                Me.Literal1.Text = Me.Literal1.Text + "</tr>"
                Me.Literal1.Text = Me.Literal1.Text + "</table>"
                Me.Literal1.Text = Me.Literal1.Text + "</td>"
                Me.Literal1.Text = Me.Literal1.Text + "<td valign = ""top"" >"
                Me.Literal1.Text = Me.Literal1.Text + "<table>"
                Me.Literal1.Text = Me.Literal1.Text + "<tr>"
                Me.Literal1.Text = Me.Literal1.Text + "<td valign = ""top"" ><label style= ""font-size:small;"" >" + "Date Posted: " + sdr("Date_Posted").ToString + "</label></td>"
                Me.Literal1.Text = Me.Literal1.Text + "</tr>"
                Me.Literal1.Text = Me.Literal1.Text + "<tr></tr><tr></tr><tr>"
                Me.Literal1.Text = Me.Literal1.Text + "<td valign = ""top"" ><label>" + sdr("Topic").ToString + "</label></td>"
                Me.Literal1.Text = Me.Literal1.Text + "</tr>"
                Me.Literal1.Text = Me.Literal1.Text + "<tr></tr><tr></tr><tr>"
                Me.Literal1.Text = Me.Literal1.Text + "<td valign = ""top""><label style= ""font-size:small;"" >" + "Replies: " + sdr("Replies").ToString + "&nbsp;&nbsp;&nbsp;&nbsp;" + "<a href = ""ViewDiscussionFaculty.aspx?TopicId=" + sdr("Id").ToString + """  style= ""color:blue"" >View Thread/Reply</a>"
                If sdr("Poster_Type").ToString = "Faculty" And sdr("Poster_Id").ToString = Session("user").ToString Then
                    Me.Literal1.Text = Me.Literal1.Text + "&nbsp;&nbsp;&nbsp;&nbsp;" + "<a href = ""DeleteDiscussionFaculty.aspx?TopicId=" + sdr("Id").ToString + """  style= ""color:blue"" >Delete Thread</a>"
                End If

                Me.Literal1.Text = Me.Literal1.Text + "</label></td>"
                Me.Literal1.Text = Me.Literal1.Text + "</tr><tr></tr><tr></tr>"
                Me.Literal1.Text = Me.Literal1.Text + "</table>"
                Me.Literal1.Text = Me.Literal1.Text + "</td>"

                Me.Literal1.Text = Me.Literal1.Text + "</tr>"
                b = sdr.Read
            End While
            Me.Literal1.Text = Me.Literal1.Text + "</table>"
            Me.Literal1.Text = Me.Literal1.Text.Replace(vbNewLine, "<br>")
        Catch ex As Exception

        End Try

    End Sub

    Protected Sub PostTopic_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles PostTopic.Click
        Try
            Dim dssa As DataSourceSelectArguments = New DataSourceSelectArguments
            Dim sdr As SqlDataReader
            SDS.SelectCommand = "select * from Discussion_Threads order by id"
            SDS.DataSourceMode = SqlDataSourceMode.DataReader
            sdr = SDS.Select(dssa)
            Dim id As Double = 0
            While (sdr.Read)
                id = sdr("Id")
            End While
            id = id + 1
            SDS.InsertCommand = "insert into Discussion_Threads values (" + id.ToString + " , '" + Me.Discussion.Text + "' , GETDATE() , 'Faculty' , '" + Me.PosterName.Text + "' , '" + Me.PosterPosition.Text + "' , '" + Me.PosterId.Text + "' , 0)"
            SDS.Insert()
            Me.SetLiteral()
            Me.Discussion.Text = ""
        Catch ex As SqlException
            Me.MsgBox(Me, "Could not add Discussion Thread! Try removing special characters like single or double qoutes (') ")
        Catch ex As Exception

        End Try
    End Sub
End Class
