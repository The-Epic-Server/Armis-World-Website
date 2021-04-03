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
      <div class="container">
    	<div class="row">
        	<div class="col-4">
          		<div class="text-center">
            		<img src="/static/images/armiworld.png"> 
          		</div>     
        	</div>
    	</div>
	  </div>
	  <hr />
	  <br>
	  <div class="container">
	  	<div class="alert alert-warning" role="alert">
	  		<p>Come play with us! <span data-bs-toggle="tooltip" data-bs-placement="top" title="Click to copy the ip!" style="cursor: pointer;" onclick="copytexttooltip('armi.tkdkid1000.net', this);">armi.tkdkid1000.net</span></p>
	  	</div>
	  	</div>
	  	<hr />
	  	<br>
	  	<div class="container">
	  		<div class="card" style="width: 18rem; display:inline-block;">
	  		<img src="/static/images/beaconwars.png" class="card-img-top">
	  		<div class="card-body">
	  			<h5 class="card-title">Beaconwars</h5>
		  		<p class="card-text">The first game on Armi's World. Beaconwars is a fork of bedwars with a twist!</p>
   		 		<p class="card-text">In beaconwars you work to defend your beacon, while also destroying other teams' beacons.</p>
	  		</div>
	  	</div>
      	<div class="card" style="width: 18rem; display:inline-block;">
	  		<img src="/static/images/economy.png" class="card-img-top">
	  		<div class="card-body">
	  			<h5 class="card-title">Economy</h5>
	  			<p class="card-text">Our twist on the towny gamemode. You build houses, claim land, participate in player run events, and more!</p>
    			<p class="card-text">You can kinda do what you want hear. It's basically survival with jobs.</p>
	  		</div>
	 	 </div>
	  </div>
	  <script type="text/javascript">
	  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
	  var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
	    return new bootstrap.Tooltip(tooltipTriggerEl)
	  })
	  </script>
      <jsp:include page="/static/js/norefresh.js"></jsp:include>
      <jsp:include page="/elements/footer.jsp"></jsp:include>
   </body>
</html>