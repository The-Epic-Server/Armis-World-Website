<%@page import="net.tkdkid1000.armiworldweb.User" %>
<%@page import="net.tkdkid1000.armiworldweb.Config" %>
<%@page import="java.util.HashMap"%>
<%@page import="net.tkdkid1000.armiworldweb.Database"%>
<%@page import="java.util.List" %>
<!doctype html>
<html>
   <head>
      <jsp:include page="elements/static_imports.jsp"></jsp:include>
      <title><%= Config.get("servertitle", "Armi's World") %></title>
   </head>
   <body>
      <jsp:include page="elements/navbar.jsp"></jsp:include>
      <jsp:include page="elements/alert.jsp"></jsp:include>
      <h1>Register</h1>
      <% if (request.getMethod().equalsIgnoreCase("get")) { %>
      <div class="container card">
        	<form class="form-horizontal" method="POST">
      			<div class="form-group">
      				<label class="control-label col-sm-2">Email</label>
        			<input required class="form-control" type="email" id="email" name="email">
        			<label class="control-label col-sm-2">Username</label>
        			<input required class="form-control" type="text" id="username" name="username">
        			<label class="control-label col-sm-2">Password</label>
        			<input required class="form-control" type="password" id="password" name="password">
      			</div>
      			<p></p>
      			<div class="d-grid gap-2">
      				<button type="submit" class="btn btn-primary btn-block">Register</button>
      			</div>
      			<p></p>
      		</form>
        </div>
      <% } else {
    	  
   		List<HashMap<String, Object>> users = Database.runQuery("SELECT * FROM users WHERE email=\""+request.getParameter("email")+"\"");
    	if (users.size() == 0) {
    		new User(request.getParameter("email"), request.getParameter("username"), request.getParameter("password")).register();
    		response.sendRedirect("/login?message=Successfully%20registered%20you.%20Please%20login.");
       		
    	} else {
    		response.sendRedirect("/register?message=There%20is%20already%20an%20account%20registered%20with%20that%20email!");
    	}
      } %>
      <jsp:include page="static/js/norefresh.js"></jsp:include>
      <jsp:include page="elements/footer.jsp"></jsp:include>
   </body>
</html>