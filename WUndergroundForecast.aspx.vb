
Imports System.IO
Imports System.Net
Imports Newtonsoft.Json
Imports Newtonsoft.Json.Linq

Partial Class WUndergroundForecast
    Inherits System.Web.UI.Page
    ReadOnly WUNDERKEY As String = "HIDDEN"
    Public currentWeather As JObject
    Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim getVar As Integer = Request.QueryString("zip")
        Dim weatherObject As JObject = GetJobjectWeather(WUNDERKEY, getVar)
        SetLocInfo(weatherObject)
        SetCurrentWeather(weatherObject)
        SetForecast(weatherObject)
        SetAlerts(weatherObject)
        currentWeather = GetCurrentWeather(WUNDERKEY, getVar)
    End Sub
    Public Function GetJobjectWeather(ByVal wuKey As String, ByVal zip As String) As JObject
        Dim client As New System.Net.WebClient
        client.Headers.Add("User-Agent", "Nobody")
        Dim sb As New System.Text.StringBuilder("http://api.wunderground.com/api/")
        sb.Append(wuKey)
        sb.Append("/geolookup/forecast10day/conditions/alerts/q/")
        sb.Append(zip + ".json")
        Dim response = client.DownloadString(New Uri(sb.ToString()))
        Dim weatherObject As JObject = JObject.Parse(response)
        Return weatherObject
    End Function
    Public Function GetCurrentWeather(ByVal wuKey As String, ByVal zip As String) As JObject
        Dim client As New System.Net.WebClient
        client.Headers.Add("User-Agent", "Nobody")
        Dim sb As New System.Text.StringBuilder("http://api.wunderground.com/api/")
        sb.Append(wuKey)
        sb.Append("/conditions/q/")
        sb.Append(zip + ".json")
        Dim response = client.DownloadString(New Uri(sb.ToString()))
        Dim weatherObject As JObject = JObject.Parse(response)
        Return weatherObject
    End Function
    Public Sub SetLocInfo(ByVal ary As JObject)
        Dim city As String = CStr(ary.SelectToken("location.city"))
        Dim state As String = CStr(ary.SelectToken("location.state"))
        foreArea.InnerHtml = "<h4>" + city & ", " & state & "</h4><a href =" & ary.SelectToken("location.wuiurl").ToString & ">WeatherUnderground.com forecast for " + city + ", " + state + "</a>"
        curArea.InnerHtml = city & ", " & state
    End Sub
    Public Sub SetCurrentWeather(ByVal ary As JObject)

    End Sub
    Public Sub SetForecast(ByVal ary As JObject)
        Dim countEven As Integer = 1
        Dim highTempArray(10) As Integer
        Dim weekForecast As JArray = ary.SelectToken("forecast.txt_forecast.forecastday")

        Dim forecastList As New List(Of JToken)
        forecastList = weekForecast.ToList
        For Each itDay In forecastList
            If countEven Mod 2 = 1 Then

                forecastPanel.InnerHtml = forecastPanel.InnerHtml + "<div class = 'panel panel-default'><div class ='panel-body'><div class = 'media'><div class = 'media-left media-middle'><img class = 'media-object' src = '" + itDay("icon_url").ToString + "' alt = '" + itDay("icon").ToString + "'></div>"
                forecastPanel.InnerHtml = forecastPanel.InnerHtml + "<div class = 'media-body'><b>" + itDay("title").ToString + "</b> <br>" + itDay("fcttext").ToString + " <br> Chance of percipitation: " + itDay("pop").ToString + "%</div></div></div></div>"
            Else
                forecastPanel.InnerHtml = forecastPanel.InnerHtml + "<div class = 'panel panel-default wellEffect'><div class ='panel-body'><div class = 'media'><div class = 'media-left media-middle'><img class = 'media-object' src = '" + itDay("icon_url").ToString + "' alt = '" + itDay("icon").ToString + "'></div>"
                forecastPanel.InnerHtml = forecastPanel.InnerHtml + "<div class = 'media-body'><b>" + itDay("title").ToString + "</b> <br>" + itDay("fcttext").ToString + " <br> Chance of percipitation: " + itDay("pop").ToString + "%</div></div></div></div>"
            End If
            countEven += 1
        Next
    End Sub
    Public Sub SetAlerts(ByVal ary As JObject)
        Dim alertsAry As JArray = ary.SelectToken("alerts")
        Dim alertList As New List(Of JToken)
        alertList = alertsAry.ToList
        Dim sigMapper As New Hashtable()
        sigMapper.Add("W", 4)
        sigMapper.Add("A", 3)
        sigMapper.Add("Y", 2)
        sigMapper.Add("S", 1)
        Dim worstAlert As Integer = 0
        If Not alertList.Count = 0 Then
            For Each alert In alertList
                If worstAlert < sigMapper.Item(CStr(alert("significance"))) Then
                    worstAlert = sigMapper.Item(CStr(alert("significance")))
                End If
            Next

            Dim classMap As New Hashtable()
            classMap.Add(4, "panel-danger")
            classMap.Add(3, "panel-warning")
            classMap.Add(2, "panel-warning")
            classMap.Add(1, "panel-info")
            Dim count As Integer = 0
            alertContainer.InnerHtml = "<div id='stormAlert' class = 'panel " & classMap.Item(worstAlert) & "'> <div class = 'panel-heading text-center'> <b>Hazardous Weather Conditions</b></div><div class = 'panel-body'>"
            For Each alert In alertList
                alertContainer.InnerHtml = alertContainer.InnerHtml & "<ul style='list-style-type: none; margin:0; padding:0;'> <li><a data-toggle = modal href='#" & CStr(count) & "'>" & CStr(alert("description")) & " Until " & CStr(alert("expires")) & "</a></li></ul> </div></div>"
                modalContainer.InnerHtml = modalContainer.InnerHtml & "<div Class='modal fade' id= '" & CStr(count) & "' role='dialog'> <div class='modal-dialog'> <div class='modal-content'> <div class='modal-header'> <button type='button' class='close' data-dismiss='modal'>&times;</button> <h4 class='modal-title'>" & CStr(alert("description")) & "</h4> </div> <div class='modal-body'>" & CStr(alert("message")) & "</div> <div class='modal-footer'> <button type='button' class='btn btn-secondary' data-dismiss='modal'>Close</button> </div> </div> </div> </div>"
                count += 1
            Next


        End If

    End Sub


    ' Dim temp As String = CStr(weatherObject.SelectToken("forecast.txt_forecast.forecastday[0].icon"))


End Class
