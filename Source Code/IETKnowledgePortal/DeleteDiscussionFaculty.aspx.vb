
Partial Class DeleteDiscussionFaculty
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            Dim topicid As String = Request.QueryString("TopicId")
           
            SDS.DeleteCommand = "Delete from Replies where Topic_Id = " + topicid
            SDS.Delete()
            SDS.DeleteCommand = "Delete from Discussion_Threads where Id = " + topicid
            SDS.Delete()
          
            Response.Redirect("DiscussionForumFaculty.aspx")

        Catch ex As Exception

        End Try
    End Sub
End Class
