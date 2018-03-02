
Partial Class DeleteReplyAdmin
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            Dim replyid As String = Request.QueryString("ReplyId")
            Dim topicid As String = Request.QueryString("TopicId")
            Dim pr As String = "ViewDiscussionAdmin.aspx?TopicId=" + topicid
           
            SDS.DeleteCommand = "Delete from Replies where Id = " + replyid
            SDS.Delete()
            SDS.UpdateCommand = "Update Discussion_Threads set Replies = Replies - 1 where Id = " + topicid
            SDS.Update()

            Response.Redirect(pr)

        Catch ex As Exception

        End Try
    End Sub
End Class
