Imports System.Data.SqlClient
Partial Class ViewDiscussionAdmin
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
                Me.TopicId.Text = Request.QueryString("TopicId")
                Dim dssa As DataSourceSelectArguments = New DataSourceSelectArguments
                Dim sdr As SqlDataReader
                SDS.SelectCommand = "select * from Administrator where User_Id = '" + Session("user").ToString + "'"
                SDS.DataSourceMode = SqlDataSourceMode.DataReader
                sdr = SDS.Select(dssa)
                sdr.Read()
                Me.ProfilePicture.ImageUrl = sdr("Profile_Picture").ToString
                Me.PosterName.Text = sdr("Name").ToString
                Me.PosterPosition.Text = sdr("Designation").ToString
                Me.PosterId.Text = sdr("User_Id").ToString
                Me.SetTopicLiteral()
                Me.SetReplyLiteral()
            End If
        Catch ex As Exception

        End Try

    End Sub
    Protected Sub SetTopicLiteral()
        Try
            Dim dssa As DataSourceSelectArguments = New DataSourceSelectArguments
            Dim sdr As SqlDataReader
            SDS.SelectCommand = "select * from Discussion_Threads where Id = " + Me.TopicId.Text
            SDS.DataSourceMode = SqlDataSourceMode.DataReader
            sdr = SDS.Select(dssa)
            Me.TopicLiteral.Text = "<table border=""2"" width=""700"">"
            Me.TopicLiteral.Text = Me.TopicLiteral.Text + "<tr style=""background-color:#507CD1; color:white;""><th>Posted By</th><th>Discussion Thread Details</th></tr>"
            sdr.Read()
            Me.TopicLiteral.Text = Me.TopicLiteral.Text + "<tr style=""background-color:#DEDFDE;"">"
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
            Me.TopicLiteral.Text = Me.TopicLiteral.Text + "<td valign = ""top"" >"
            Me.TopicLiteral.Text = Me.TopicLiteral.Text + "<table>"
            Me.TopicLiteral.Text = Me.TopicLiteral.Text + "<tr>"
            Me.TopicLiteral.Text = Me.TopicLiteral.Text + "<td valign = ""top"" ><img src = """ + picture + """ style= ""width:100px; height:120px;"" /></td>"
            Me.TopicLiteral.Text = Me.TopicLiteral.Text + "</tr>"
            Me.TopicLiteral.Text = Me.TopicLiteral.Text + "<tr>"
            Me.TopicLiteral.Text = Me.TopicLiteral.Text + "<td valign = ""top"" ><label style= ""font-size:small;"" >" + sdr("Poster_Name").ToString + "</label></td>"
            Me.TopicLiteral.Text = Me.TopicLiteral.Text + "</tr>"
            Me.TopicLiteral.Text = Me.TopicLiteral.Text + "<tr>"
            Me.TopicLiteral.Text = Me.TopicLiteral.Text + "<td valign = ""top"" ><label style= ""font-size:small;"" >" + sdr("Poster_Position").ToString + "</label></td>"
            Me.TopicLiteral.Text = Me.TopicLiteral.Text + "</tr>"
            Me.TopicLiteral.Text = Me.TopicLiteral.Text + "</table>"
            Me.TopicLiteral.Text = Me.TopicLiteral.Text + "</td>"
            Me.TopicLiteral.Text = Me.TopicLiteral.Text + "<td valign = ""top"" >"
            Me.TopicLiteral.Text = Me.TopicLiteral.Text + "<table>"
            Me.TopicLiteral.Text = Me.TopicLiteral.Text + "<tr>"
            Me.TopicLiteral.Text = Me.TopicLiteral.Text + "<td valign = ""top"" ><label style= ""font-size:small;"" >" + "Date Posted: " + sdr("Date_Posted").ToString + "</label></td>"
            Me.TopicLiteral.Text = Me.TopicLiteral.Text + "</tr>"
            Me.TopicLiteral.Text = Me.TopicLiteral.Text + "<tr></tr><tr></tr><tr>"
            Me.TopicLiteral.Text = Me.TopicLiteral.Text + "<td valign = ""top"" ><label>" + sdr("Topic").ToString + "</label></td>"
            Me.TopicLiteral.Text = Me.TopicLiteral.Text + "</tr>"
            Me.TopicLiteral.Text = Me.TopicLiteral.Text + "<tr></tr><tr></tr><tr>"
            Me.TopicLiteral.Text = Me.TopicLiteral.Text + "<td valign = ""top""><label style= ""font-size:small;"" >" + "Replies: " + sdr("Replies").ToString
            Me.TopicLiteral.Text = Me.TopicLiteral.Text + "&nbsp;&nbsp;&nbsp;&nbsp;" + "<a href = ""DeleteDiscussionAdmin.aspx?TopicId=" + sdr("Id").ToString + """  style= ""color:blue"" >Delete Thread</a>"
            Me.TopicLiteral.Text = Me.TopicLiteral.Text + "</label></td>"
            Me.TopicLiteral.Text = Me.TopicLiteral.Text + "</tr><tr></tr><tr></tr>"
            Me.TopicLiteral.Text = Me.TopicLiteral.Text + "</table>"
            Me.TopicLiteral.Text = Me.TopicLiteral.Text + "</td>"
            Me.TopicLiteral.Text = Me.TopicLiteral.Text + "</tr>"
            Me.TopicLiteral.Text = Me.TopicLiteral.Text + "</table>"
            Me.TopicLiteral.Text = Me.TopicLiteral.Text.Replace(vbNewLine, "<br>")
        Catch ex As Exception

        End Try
       
    End Sub
    Protected Sub SetReplyLiteral()
        Try
            Dim dssa As DataSourceSelectArguments = New DataSourceSelectArguments
            Dim sdr As SqlDataReader
            SDS.SelectCommand = "select * from Replies where Topic_Id = " + Me.TopicId.Text + " order by Date_Posted"
            SDS.DataSourceMode = SqlDataSourceMode.DataReader
            sdr = SDS.Select(dssa)
            Me.ReplyLiteral.Text = "<table border=""2"" width=""700"">"
            Dim b As Boolean
            b = sdr.Read
            If b = True Then
                Me.ReplyLiteral.Text = Me.ReplyLiteral.Text + "<tr style=""background-color:#507CD1; color:white;""><th>Posted By</th><th>Reply Details</th></tr>"
            End If

            While (b)
                Me.ReplyLiteral.Text = Me.ReplyLiteral.Text + "<tr style=""background-color:#DEDFDE;"">"
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
                Me.ReplyLiteral.Text = Me.ReplyLiteral.Text + "<td valign = ""top"" >"
                Me.ReplyLiteral.Text = Me.ReplyLiteral.Text + "<table>"
                Me.ReplyLiteral.Text = Me.ReplyLiteral.Text + "<tr>"
                Me.ReplyLiteral.Text = Me.ReplyLiteral.Text + "<td valign = ""top"" ><img src = """ + picture + """ style= ""width:100px; height:120px;"" /></td>"
                Me.ReplyLiteral.Text = Me.ReplyLiteral.Text + "</tr>"
                Me.ReplyLiteral.Text = Me.ReplyLiteral.Text + "<tr>"
                Me.ReplyLiteral.Text = Me.ReplyLiteral.Text + "<td valign = ""top"" ><label style= ""font-size:small;"" >" + sdr("Poster_Name").ToString + "</label></td>"
                Me.ReplyLiteral.Text = Me.ReplyLiteral.Text + "</tr>"
                Me.ReplyLiteral.Text = Me.ReplyLiteral.Text + "<tr>"
                Me.ReplyLiteral.Text = Me.ReplyLiteral.Text + "<td valign = ""top"" ><label style= ""font-size:small;"" >" + sdr("Poster_Position").ToString + "</label></td>"
                Me.ReplyLiteral.Text = Me.ReplyLiteral.Text + "</tr>"
                Me.ReplyLiteral.Text = Me.ReplyLiteral.Text + "</table>"
                Me.ReplyLiteral.Text = Me.ReplyLiteral.Text + "</td>"
                Me.ReplyLiteral.Text = Me.ReplyLiteral.Text + "<td valign = ""top"" >"
                Me.ReplyLiteral.Text = Me.ReplyLiteral.Text + "<table>"
                Me.ReplyLiteral.Text = Me.ReplyLiteral.Text + "<tr>"
                Me.ReplyLiteral.Text = Me.ReplyLiteral.Text + "<td valign = ""top"" ><label style= ""font-size:small;"" >" + "Date Posted: " + sdr("Date_Posted").ToString + "</label></td>"
                Me.ReplyLiteral.Text = Me.ReplyLiteral.Text + "</tr>"
                Me.ReplyLiteral.Text = Me.ReplyLiteral.Text + "<tr></tr><tr></tr><tr>"
                Me.ReplyLiteral.Text = Me.ReplyLiteral.Text + "<td valign = ""top"" ><label>" + sdr("Reply").ToString + "</label></td>"
                Me.ReplyLiteral.Text = Me.ReplyLiteral.Text + "</tr>"
                Me.ReplyLiteral.Text = Me.ReplyLiteral.Text + "<tr></tr><tr></tr><tr>"
                Me.ReplyLiteral.Text = Me.ReplyLiteral.Text + "<td valign = ""top""><label style= ""font-size:small;"" >"
                Me.ReplyLiteral.Text = Me.ReplyLiteral.Text + "<a href = ""DeleteReplyAdmin.aspx?ReplyId=" + sdr("Id").ToString + "&TopicId=" + sdr("Topic_Id").ToString + """  style= ""color:blue"" >Delete Reply</a>"
                Me.ReplyLiteral.Text = Me.ReplyLiteral.Text + "</label></td>"
                Me.ReplyLiteral.Text = Me.ReplyLiteral.Text + "</tr><tr></tr><tr></tr>"
                Me.ReplyLiteral.Text = Me.ReplyLiteral.Text + "</table>"
                Me.ReplyLiteral.Text = Me.ReplyLiteral.Text + "</td>"

                Me.ReplyLiteral.Text = Me.ReplyLiteral.Text + "</tr>"
                b = sdr.Read
            End While
            Me.ReplyLiteral.Text = Me.ReplyLiteral.Text + "</table>"
            Me.ReplyLiteral.Text = Me.ReplyLiteral.Text.Replace(vbNewLine, "<br>")
        Catch ex As Exception

        End Try
        
    End Sub

    Protected Sub PostReply_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles PostReply.Click
        Try
            Dim dssa As DataSourceSelectArguments = New DataSourceSelectArguments
            Dim sdr As SqlDataReader
            SDS.SelectCommand = "select * from Replies order by id"
            SDS.DataSourceMode = SqlDataSourceMode.DataReader
            sdr = SDS.Select(dssa)
            Dim id As Double = 0
            While (sdr.Read)
                id = sdr("Id")
            End While
            id = id + 1
            SDS.InsertCommand = "insert into Replies values (" + id.ToString + " , " + Me.TopicId.Text + " , '" + Me.Reply.Text + "' , GETDATE() , 'Administrator' , '" + Me.PosterName.Text + "' , '" + Me.PosterPosition.Text + "' , '" + Me.PosterId.Text + "')"
            SDS.Insert()
            SDS.UpdateCommand = "Update Discussion_Threads set Replies = Replies+1 where Id = " + Me.TopicId.Text
            SDS.Update()
            Me.SetTopicLiteral()
            Me.SetReplyLiteral()
            Me.Reply.Text = ""
        Catch ex As SqlException
            Me.MsgBox(Me, "Could not add Reply! Try removing special characters like single or double qoutes (') ")
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub Back_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Back.Click
        Try
            Response.Redirect("DiscussionForumAdmin.aspx")
        Catch ex As Exception

        End Try
    End Sub
End Class
