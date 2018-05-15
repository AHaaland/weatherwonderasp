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
                      <asp:Button type = "submit" runat ="server" id = "zipBTN" class = "btn btn-primary"  style = "margin-top:1em" Text="Your WeatherUnderground Forecast" />
                      <asp:Button type = "submit" runat = "server" id = "forecastBTN"  class = "btn btn-primary" style = "margin-top:1em" Text="Get Your NWS Forecast" />
                    </form>
                </div>
            
        </div>
        <div class="container" id="homeText">
            <h2 class = "text-center">About this project:</h2>
            <div class="col-md-12 col-xs-12">
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec pulvinar convallis dolor, id ultricies lorem pellentesque eu. Morbi sapien ante, consequat vitae sagittis vitae, tincidunt ac lectus. Sed augue magna, pharetra nec lorem id, sagittis feugiat odio. Nunc fermentum, elit vel facilisis efficitur, diam massa faucibus ante, porttitor maximus tellus libero in nulla. Quisque in suscipit quam. Morbi nibh diam, congue sit amet justo vel, hendrerit suscipit elit. Sed semper enim fermentum viverra venenatis. Proin quis dictum est. Etiam ornare leo ac dolor suscipit, nec egestas nisi maximus. Cras dictum luctus lacus et maximus. Aenean pellentesque enim eget elit laoreet, eget sodales sapien tincidunt.
                In feugiat nunc vel efficitur mollis. Nunc fringilla volutpat porta. Nam et semper diam. Mauris ut sapien feugiat, dignissim nunc sed, commodo lorem. Nam non blandit tortor. Suspendisse suscipit dapibus consequat. Ut mauris risus, gravida fringilla sem quis, faucibus rutrum dolor. Mauris id aliquam odio. Fusce sit amet ante aliquet, tincidunt velit cursus, rutrum ante. Nam a fermentum risus. Nulla volutpat vitae eros a rutrum. Pellentesque imperdiet sem interdum odio commodo, ut ultricies elit semper. Mauris porttitor enim et lorem lacinia, sit amet eleifend lacus fringilla.</p>
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
    </body>
</html>
