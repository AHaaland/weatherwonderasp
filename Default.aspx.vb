
Partial Class _Default
    Inherits System.Web.UI.Page


    Sub callWunder(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles zipBTN.Click
        Dim zips = CType(zipForm.FindControl("zipCode"), TextBox).Text
        Dim responseStr = "WUndergroundForecast.aspx?zip=" & zips
        Response.Redirect(responseStr)

    End Sub
End Class
