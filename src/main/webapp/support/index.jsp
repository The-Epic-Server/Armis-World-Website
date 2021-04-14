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
      	<div class="container">
      		<div class="card" style="width: 18rem; display:inline-block;">
      			<div class="card-body bg-primary">
      				<h5 class="bg-dark text-light rounded p-2">Support Ticket</h5>
      				<hr />
      				<a href="/support/ticket" class="btn btn-primary bg-dark"><i class="fas fa-plus-square"></i> Create Ticket</a>
      			</div>
     	 	</div>
      	</div>
      </div>
	  
      <jsp:include page="/static/js/norefresh.js"></jsp:include>
      <jsp:include page="/elements/footer.jsp"></jsp:include>
   </body>
</html>