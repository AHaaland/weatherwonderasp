Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
' <System.Web.Script.Services.ScriptService()> _
<WebService(Namespace:="http://wwonderasp.andrewhaaland.com/")>
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Public Class XtremeWxAlerts
    Inherits System.Web.Services.WebService

    Private severity As String
    <WebMethod()>
    Public Function GetAlert() As String
        Return severity
    End Function
    <WebMethod()>
    Public Sub SendAlert(ByVal sev As String)
        severity = sev
    End Sub


End Class