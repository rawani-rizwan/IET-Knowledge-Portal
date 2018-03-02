Imports System.Drawing
Imports System.Data.SqlClient
Imports System.Net.Mail
Partial Class StudentSignUp
    Inherits System.Web.UI.Page
    Dim s As String
    Dim vc As String
    Protected Sub RefreshImageButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles RefreshImageButton.Click
        Try
            Me.refreshimage()
            Me.InvalidStringLabel.Visible = False
        Catch ex As Exception

        End Try
        
    End Sub

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

    Protected Sub refreshimage()
        Try
            s = System.Guid.NewGuid().ToString
            s = s.Substring(0, 5)
            Dim b As Bitmap = New Bitmap(149, 39)
            Dim g As Graphics = Graphics.FromImage(b)
            Dim ob1 As SolidBrush = New SolidBrush(Color.GreenYellow)
            Dim ob2 As SolidBrush = New SolidBrush(Color.Red)
            g.FillRectangle(ob1, 0, 0, 149, 39)
            Dim fon As Font = New Font("Arial", 22)
            Dim poin As Point = New Point(1.0F, 1.0F)
            g.DrawString(s, fon, ob2, poin)
            b.Save(Server.MapPath("images/validationimage/validationimage.jpg"), Imaging.ImageFormat.Jpeg)
            imagestring.Text = s
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If Me.IsPostBack = False Then
                Me.refreshimage()
            End If
        Catch ex As Exception

        End Try

    End Sub

    Protected Sub SignUpButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SignUpButton.Click
        Try
            Dim sdr As SqlDataReader
            Dim dssa As DataSourceSelectArguments = New DataSourceSelectArguments
            Dim enrolmentnumber As String = Me.EnrolmentNo.Text
            Dim scholarnumber As String = Me.ScholarNo.Text
            Dim rollnumber As String = Me.RollNo.Text
            Dim userid As String = Me.UserName.Text
            SDS.SelectCommand = "select * from Student where Enrollment_No='" + enrolmentnumber + "'"
            SDS.DataSourceMode = SqlDataSourceMode.DataReader
            sdr = SDS.Select(dssa)
            If (sdr.Read) Then
                Me.MsgBox(Me, "An account already exists with the given Enrollment No.")
                Me.refreshimage()
                Exit Sub
            End If
            SDS.SelectCommand = "select * from Student where Scholar_No='" + scholarnumber + "'"
            sdr = SDS.Select(dssa)
            If (sdr.Read) Then
                Me.MsgBox(Me, "An account already exists with the given Scholar No.")
                Me.refreshimage()
                Exit Sub
            End If
            SDS.SelectCommand = "select * from Student where Roll_No='" + rollnumber + "'"
            sdr = SDS.Select(dssa)
            If (sdr.Read) Then
                Me.MsgBox(Me, "An account already exists with the given Roll No.")
                Me.refreshimage()
                Exit Sub
            End If
            SDS.SelectCommand = "select * from Student where User_Id='" + userid + "'"
            sdr = SDS.Select(dssa)
            If (sdr.Read) Then
                Me.MsgBox(Me, "An account already exists with the given User_Id")
                Me.refreshimage()
                Exit Sub
            End If
            If Me.imagestring.Text.ToString.ToLower = Me.ImageText.Text.ToLower Then
                Me.InvalidStringLabel.Visible = False
                Me.pass.Text = Me.Password.Text
                vc = System.Guid.NewGuid().ToString
                vc = vc.Substring(0, 8)
                Me.vcode.Text = vc
                Dim eno As String = Me.EnrolmentNo.Text
                Dim schno As String = Me.ScholarNo.Text
                Dim fullname As String = Me.Name.Text
                Dim rollnum As String = Me.RollNo.Text
                Dim user_id As String = Me.UserName.Text
                Dim yearofstudy As String = Me.Year.SelectedValue
                Dim branchofstudy As String = Me.Branch.SelectedValue
                Dim emailid As String = Me.Email.Text
                Dim mobileno As String = Me.Mobile.Text
                Dim secquestion As String = Me.Question.Text
                Dim secanswer As String = Me.Answer.Text
                Dim accountstatus As String = "notactivated"
                Dim firstlogin As String = "true"
                Dim profilepicture As String = "~/images/profile pictures/no_profile.jpg"
                SDS.DataSourceMode = SqlDataSourceMode.DataSet
                SDS.InsertCommand = "INSERT INTO Student(User_Id, Password, Enrollment_No, Scholar_No, Roll_no, Name, Year, Branch, Email_Id, Mobile, Security_Question, Security_Answer, Account_Status, Profile_Picture, Date_Requested, First_Login, About_Me, Interests, Projects, Achievements, Publications) VALUES ('" + user_id + "','" + Me.pass.Text + "','" + eno + "','" + schno + "','" + rollnum + "','" + fullname + "','" + yearofstudy + "','" + branchofstudy + "','" + emailid + "'," + mobileno + ",'" + secquestion + "','" + secanswer + "','" + accountstatus + "','" + profilepicture + "',GETDATE(),'" + firstlogin + "' , '' , '' , '' , '' , '')"
                SDS.Insert()
                SDS.DeleteCommand = "delete from Student where User_Id = '" + user_id + "'"
                SDS.Delete()
                Dim msg As MailMessage = New MailMessage("noreply@ietknowledgeportal.com", Me.Email.Text)
                msg.Subject = "IET Knowledge Portal Registration"
                msg.IsBodyHtml = True
                msg.Body = "Your verification code is " + vc + "<br><br>This is a system generated mail. Please do not reply to this mail."
                Dim smtp As SmtpClient = New SmtpClient()
                smtp.Host = "smtp.gmail.com"
                smtp.Credentials = New System.Net.NetworkCredential("ietknowledgeportal@gmail.com", "knowledgeportal")
                smtp.EnableSsl = True
                smtp.Send(msg)
                Me.EnrolmentNoLabel.Visible = False
                Me.EnrolmentNo.Visible = False
                Me.ScholarNoLabel.Visible = False
                Me.ScholarNo.Visible = False
                Me.NameLabel.Visible = False
                Me.Name.Visible = False
                Me.RollNo.Visible = False
                Me.RollNoLabel.Visible = False
                Me.UserNameLabel.Visible = False
                Me.UserName.Visible = False
                Me.Password.Visible = False
                Me.PasswordLabel.Visible = False
                Me.Year.Visible = False
                Me.YearLabel.Visible = False
                Me.ConfirmPassword.Visible = False
                Me.ConfirmPasswordLabel.Visible = False
                Me.BranchLabel.Visible = False
                Me.Branch.Visible = False
                Me.QuestionLabel.Visible = False
                Me.Question.Visible = False
                Me.EmailLabel.Visible = False
                Me.Email.Visible = False
                Me.AnswerLabel.Visible = False
                Me.Answer.Visible = False
                Me.MobileLabel.Visible = False
                Me.Mobile.Visible = False
                Me.ImageLabel.Visible = False
                Me.Image.Visible = False
                Me.ImageText.Visible = False
                Me.RefreshImageButton.Visible = False
                Me.SignUpButton.Visible = False
                Me.EmailSentLabel.Visible = True
                Me.VerificationCode.Visible = True
                Me.VerifyCode.Visible = True
            Else
                Me.InvalidStringLabel.Visible = True
                Me.refreshimage()
            End If

        Catch ex As SqlException
            Me.MsgBox(Me, "Some fields may contain invalid values. Try removing special characters like single or double qoutes (') ")
            Me.refreshimage()
        Catch ex As SmtpException
            Me.MsgBox(Me, "Unable to send verification e-mail. Try again later")
            Me.refreshimage()
        Catch ex As Exception
            Me.refreshimage()
        End Try

    End Sub

    Protected Sub VerifyCode_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles VerifyCode.Click
        Try
            Dim eno As String = Me.EnrolmentNo.Text
            Dim schno As String = Me.ScholarNo.Text
            Dim fullname As String = Me.Name.Text
            Dim rollnumber As String = Me.RollNo.Text
            Dim userid As String = Me.UserName.Text
            Dim yearofstudy As String = Me.Year.SelectedValue
            Dim branchofstudy As String = Me.Branch.SelectedValue
            Dim emailid As String = Me.Email.Text
            Dim mobileno As String = Me.Mobile.Text
            Dim secquestion As String = Me.Question.Text
            Dim secanswer As String = Me.Answer.Text
            Dim accountstatus As String = "notactivated"
            Dim firstlogin As String = "true"
            Dim profilepicture As String = "~/images/profile pictures/no_profile.jpg"
            If Me.vcode.Text = Me.VerificationCode.Text Then
                Me.InvalidCodeLabel.Visible = False
                SDS.DataSourceMode = SqlDataSourceMode.DataSet
                SDS.InsertCommand = "INSERT INTO Student(User_Id, Password, Enrollment_No, Scholar_No, Roll_no, Name, Year, Branch, Email_Id, Mobile, Security_Question, Security_Answer, Account_Status, Profile_Picture, Date_Requested, First_Login, About_Me, Interests, Projects, Achievements, Publications) VALUES ('" + userid + "','" + Me.pass.Text + "','" + eno + "','" + schno + "','" + rollnumber + "','" + fullname + "','" + yearofstudy + "','" + branchofstudy + "','" + emailid + "'," + mobileno + ",'" + secquestion + "','" + secanswer + "','" + accountstatus + "','" + profilepicture + "',GETDATE(),'" + firstlogin + "' , '' , '' , '' , '' , '')"
                SDS.Insert()
                Me.EmailSentLabel.Visible = False
                Me.VerificationCode.Visible = False
                Me.VerifyCode.Visible = False
                Me.AccountCreatedLabel.Visible = True
            Else
                Me.InvalidCodeLabel.Visible = True
            End If
        Catch ex As SqlException
            Me.MsgBox(Me, "Your account could not be created due to increased server load. Try again later.")
        Catch ex As Exception

        End Try
    End Sub
End Class
