<%@page import="java.util.ArrayList"%>
<%@page import="net.tkdkid1000.armiworldweb.Config" %>
<!doctype html>
<html>
   <head>
      <jsp:include page="/elements/static_imports.jsp"></jsp:include>
      <title><%= Config.get("servertitle", "Armi's World") %> - Home</title>
   </head>
   <body>
      <jsp:include page="/elements/navbar.jsp"></jsp:include>
      <jsp:include page="/elements/alert.jsp"></jsp:include>
      <div class="w3-container w3-center">
      	<img class="logo" src="static/images/armiworld.png">
      </div>
      <br />
      <hr />
      <div class="w3-container">
      	<div class="w3-panel w3-pale-yellow w3-topbar w3-bottombar w3-border-yellow">
      		<p>Come play with us! <a href="javascript:void(0);" style="cursor: pointer;" class="w3-tooltip" onclick="copytext('armi.tkdkid1000.net');">armi.tkdkid1000.net<span style="position:absolute;left:0;bottom:18px"
class="w3-text w3-tag w3-round w3-animate-opacity">Click to copy ip!</span></a>!</p>
      	</div>
      </div>
      <br />
      <hr />
      <div class="w3-row-padding">
      <div class="w3-container" style="display: inline; float: left;">
      	<div class="w3-card-4 w3-white w3-round-xlarge w3-half" style="width:300px;">
  			<div class="w3-container w3-center w3-large">
    			<div class="w3-center"><h1>Beaconwars</h1></div>
    			<div class="w3-left-align w3-small">
    				<p>The first game on Armi's World. Beaconwars is a fork of bedwars with a twist!</p>
    				<p>In beaconwars you work to defend your beacon, while also destroying other teams' beacons.</p>
    			</div>
  			</div>
	  	</div>
	  	<div class="w3-card-4 w3-white w3-round-xlarge w3-half" style="width:300px;">
  			<div class="w3-container w3-center w3-large">
    			<div class="w3-center"><h1>Economy</h1></div>
    			<div class="w3-left-align w3-small">
    				<p>Our twist on the towny gamemode. You build houses, claim land, participate in player run events, and more!</p>
    				<p>You can kinda do what you want hear. It's basically survival with jobs.</p>
    			</div>
  			</div>
	  	</div>
      </div>
      </div>
      
      <jsp:include page="/static/js/norefresh.js"></jsp:include>
      <jsp:include page="/elements/footer.jsp"></jsp:include>
   </body>
</html>