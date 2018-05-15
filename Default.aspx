<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE HTML>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>WeatherWonder</title>
        <!-- Bootstrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link href="Style/style.css" rel="stylesheet" />
        <!--Jquery, jquery validation, bootstrapJS import-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.16.0/jquery.validate.min.js"></script>
    </head>
    <body>
        <!--#include file="Includes/header.inc"-->
        <div class="text-center jumbotron bg-img">
            <div class = "container">
                <h1>The smartest weather application!</h1>
                <h4>With multiple sources of data all in one place, WeatherWonder is the MOST accurate weather application! </h4>
            
            </div>
            <!-- Removing 'name' attribute will force the field to not be submitted! -->
                <div class="control-group form-horizontal col-md-offset-5 col-xs-offset-3 col-md-2 col-xs-6" id="zipDiv">
                    <form  id = "zipForm" name = "zipForm" runat="server" >
                      <!--<asp:Label for="zipCode" runat="server">Zip Code:</asp:Label>-->
                      <asp:TextBox  name = "zipCode" id="zipCode" style = "text-align:center" CssClass="form-control" runat="server" placeholder = "Enter Your Zip Code" Forecolor="Black" />
                      <asp:Button type = "submit" runat ="server" id = "zipBTN" class = "btn btn-primary"  style = "margin-top:1em" Text="Get Your Forecast" />
                      <!--<asp:Button type = "submit" runat = "server" id = "forecastBTN"  class = "btn btn-primary" style = "margin-top:1em" Text="Coming Soon!" />-->
                    </form>
                </div>
            
        </div>
        <div class="container" id="homeText">
            <h2 class = "text-center">About this project:</h2>
            <div class="col-md-12 col-xs-12">
                <p>WeatherWonder was developed for Probability and Statistics I with Eric Brattain at SUNY New Paltz as a project for the course. WeatherWonder was created by Andrew Haaland, Michael McGovern, and Penny Adler-Colvin. Originally, WeatherWonder allowed you to retrieve a forecast from Weather Underground, and we created a weather prediction using random variables.
                    Andrew Haaland has modified the original project's WeatherUnderground.com API forecast retrieval feature to run on Asp.NET/Visual Basic instead of PHP as originally designed.
                </p>
            </div>
        </div>
        
        <!-- AHaaland; User defn. scripts -->
        <script>
        // Validation of Zip code input
        $("#zipForm").validate({
    
        // Specify the validation rules
        rules: {
            zipCode:
            {
                required:true,
                minlength: 5,
                maxlength: 5,
                number: true
            }
        },

        messages: {
            zipCode: "Please enter a valid US zip code"
        },
        highlight: function(element) {
            $(element).closest('#zipDiv').addClass('has-error');
        },
        unhighlight: function(element) {
            $(element).closest('#zipDiv').removeClass('has-error');
            
        }
        });
        </script>
        <script>
            //If form is valid, switch submit btn to spinning sun
            $("#zipBTN").on('click',function(e){
                if($("#zipForm").valid())
                {
                    var self = this;
                    $(this).hide().after('<br /><img src = "/Images/sunny.gif" alt = "Loading..." style = "height:25px; width:25px;margin-top:1em">');
                    $("#forecastBTN").hide();
                }
            });
            $("#forecastBTN").on('click',function(e){

                    var self = this;
                    $("#zipBTN").hide().after('<br /><img src = "/Images/sunny.gif" alt = "Loading..." style = "height:25px; width:25px;margin-top:1em">');
                    $("#forecastBTN").hide();
            });
            
        </script>
        <!--#include file="Includes/footer.inc"-->
    </body>
</html>
