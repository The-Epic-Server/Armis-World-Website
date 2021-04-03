<%@page import="java.util.ArrayList"%>
<%@page import="net.tkdkid1000.armiworldweb.Config" %>
<%@page import="java.util.HashMap"%>
<%@page import="net.tkdkid1000.armiworldweb.Database"%>
<%@page import="java.util.List" %>
<!doctype html>
<html>
   <head>
      <jsp:include page="/elements/static_imports.jsp"></jsp:include>
      <title><%= Config.get("servertitle", "Armi's World") %> - User Viewer</title>
   </head>
   <body>
      <jsp:include page="/elements/navbar.jsp"></jsp:include>
      <jsp:include page="/elements/alert.jsp"></jsp:include>
      <% if (request.getParameter("name") == null) { %>
      	<h1>Oops!</h1>
      	<p class="text-center">You didn't enter a name into the user viewer!</p>
      	<p class="text-center">Do <span class="text-warning">NOT</span> report this as an error.</p>
      <% } else { %>
      	<% 
      	List<HashMap<String, Object>> users = Database.runQuery("SELECT * FROM users;"); 
      	boolean contains = false;
      	for (HashMap<String, Object> user : users) {
      		if (((String)user.get("username")).equalsIgnoreCase(request.getParameter("name"))) {
      			contains = true;
      		}
      	}
      	if (!contains) {
      	%>
      	<h1>Ah snap!</h1>
      	<p class="text-center">The name you entered has not registered for our website yet.</p>
      	<p class="text-center">Do <span class="text-warning">NOT</span> report this as an error, instead:</p>
      	<ul class="list-group">
      		<li class="list-group-item list-group-item-danger">Check that the username is correct</li>
      		<li class="list-group-item list-group-item-danger">Check that the specified account exists</li>
      		<li class="list-group-item list-group-item-danger">If both of the above are true, then you may report this as an error.</li>
      	</ul>
      	<% } else { %>
      		<div class="card mx-auto" style="width: 18rem;">
      			<img class="card-img-top" src="<%= Database.runQuery("SELECT * FROM users WHERE UPPER(username) LIKE UPPER(\""+request.getParameter("name")+"\");").get(0).get("icon") %>">
      			<div class="card-body">
      				<h5 class="card-title"><%= Database.runQuery("SELECT * FROM users WHERE UPPER(username) LIKE UPPER(\""+request.getParameter("name")+"\");").get(0).get("username") %></h5>
      				<p class="card-text">Nothing here. We haven't added user descriptions yet.</p>
      				<a href="javascript:void(0);" class="btn btn-primary" onclick="copytext('<%= request.getRequestURL()+"?"+request.getQueryString() %>')">Copy User Link</a>
      			</div>
      		</div>
      	<% } %>
      <% } %>
      <jsp:include page="/static/js/norefresh.js"></jsp:include>
      <jsp:include page="/elements/footer.jsp"></jsp:include>
	</body>
</html>