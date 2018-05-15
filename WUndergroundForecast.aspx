<%@ Page Language="VB" AutoEventWireup="false" CodeFile="WUndergroundForecast.aspx.vb" Inherits="WUndergroundForecast" %>

<!DOCTYPE html>
<html>
    <head>
            <meta charset="utf-8">
            <title>Your WeatherUnderground.com Forecast</title>
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
            <link rel="stylesheet" href="/Style/style.css">
    </head>
    <body>
        <!--#include file="Includes/header.inc"-->
      
        
        
        <div class="weather-container container" ID="weatherContain" runat="server">
            
            <div id="currentConditions" class = "panel panel-default">
                <div class = "panel-heading">
                    <b>Current Conditions in:</b>
                    <h4 id ="curArea" runat="server"></h4>
                </div>
                <div class = "panel-body">
                    <div class = "currentSummary ">
                        <!-- aligns image centered over text-->
                        <img style = "margin:auto; display:block;" src = "<% = currentWeather.SelectToken("current_observation.icon_url")%>"  alt =" <% = currentWeather.SelectToken("current_observation.icon")%>">
                        <p style = "text-align:center;"><b><% = currentWeather.SelectToken("current_observation.weather")%></b></p>
                    </div>
                    <div class="tempCurrent ">
                        <p style = "margin-bottom:0px;"><b>Temperature:</b></p>
                        <h2 style = "margin-top:0px;margin-bottom:0px;"> <% = currentWeather.SelectToken("current_observation.temperature_string")%></h2>
                        <p style = "margin-bottom:0px;"><b>Feels Like:</b></p>
                        <h3 style = "margin-top:0px;margin-bottom:0px"> <% = currentWeather.SelectToken("current_observation.feelslike_string")%></h3>
                    </div>
                    <div class="detailedCurrent ">
                        <p style = "margin-bottom:0px;"><b>Humidity:  <% = currentWeather.SelectToken("current_observation.relative_humidity")%></b></p>
                        <p style = "margin-bottom:0px;"><b>Wind:  <% = currentWeather.SelectToken("current_observation.wind_string").ToString + " " + currentWeather.SelectToken("current_observation.wind_dir").ToString + " " + currentWeather.SelectToken("current_observation.wind_mph").ToString + " mph"%></b></p>
                        <p style = "margin-bottom:0px;"><b>Barometer: <% = currentWeather.SelectToken("current_observation.pressure_in").ToString + " in (" + currentWeather.SelectToken("current_observation.pressure_mb").ToString + " mb)"%></b></p>
                        <p style = "margin-bottom:0px;"><b>Dew Point: <% = currentWeather.SelectToken("current_observation.dewpoint_string")%></b></p>
                        <p style = "margin-bottom:0px;"><b>Visibility: <% = currentWeather.SelectToken("current_observation.visibility_mi").ToString + " mi"%></b></p>
                        <p style = "margin-bottom:0px;"><b>Observation Time: <% = currentWeather.SelectToken("current_observation.observation_time")%></b></p>
                        <p style = "margin-bottom:0px;"><b>Station of Observation: <% = currentWeather.SelectToken("current_observation.station_id")%></b></p>
                    </div>
                </div>
            </div>
        
            
            
                <div id = "forecast" class="panel panel-default">
                <div class ="panel-heading">
                    <b>Forecast For:</b>
                    <div id ="foreArea" runat="server"></div>
              
                    
                </div>
            <div class = "panel-body" runat ="server" id ="forecastPanel">
            
            </div>

            </div>

        </div>
        
        <script type = "text/javascript">
            
        </script>
    <!--#include file="Includes/footer.inc"-->
    </body>
</html>