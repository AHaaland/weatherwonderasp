
Partial Class testpage
    Inherits System.Web.UI.Page
    Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim getVar As String = Request.QueryString("zip")
        tDiv.InnerHtml = "Hello,World " & getVar

    End Sub
End Class
