<%@page import="java.util.HashMap"%>
<%@page import="net.tkdkid1000.armiworldweb.Database"%>
<%@page import="java.util.List" %>
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
      <% if (session.getAttribute("email") == null) response.sendError(403); %>
      <h1>Your Tickets</h1>
      <div class="container">
      	<div class="card">
      		<div class="card-body">
      			<h5 class="card-title"></h5>
      			<ul class="list-group">
      				<%
      				List<HashMap<String, Object>> tickets = Database.runQuery("SELECT * FROM tickets WHERE author=\""+session.getAttribute("email")+"\"");
      				%>
      				<li class="list-group-item"></li>
      			</ul>
      		</div>
      	</div>
      </div>
      <jsp:include page="/static/js/norefresh.js"></jsp:include>
      <jsp:include page="/elements/footer.jsp"></jsp:include>
   </body>
</html>