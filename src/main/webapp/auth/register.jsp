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
      <div class="w3-container">
      	<div class="w3-card-4">
      		<div class="w3-container w3-gold">
      			<form class="w3-container" method="POST">
      				<label>Email</label>
         			<input required class="w3-border w3-round w3-input" type="email" id="email" name="email">
      				<label>Username</label>
         			<input required class="w3-border w3-round w3-input" type="text" id="username" name="username">
         			<label>Password</label>
         			<input required class="w3-border w3-round w3-input" type="password" id="password" name="password">
         			<button type="submit" class="w3-input w3-btn w3-blue-grey">Login</button>
      			</form>
      		</div>
      	</div>
      </div>
      <% } else {
    	  
   		List<HashMap<String, Object>> users = Database.runQuery("SELECT * FROM users WHERE email=\""+request.getParameter("email")+"\"");
    	if (users.size() == 0) {
    		new User(request.getParameter("email"), request.getParameter("username"), request.getParameter("password")).register();
    		response.sendRedirect("/login?Successfully%20registered%20you.%20Please%20login.");
       		
    	} else {
    		response.sendRedirect("/register?message=There%20is%20already%20an%20account%20registered%20with%20that%20email!");
    	}
      } %>
      <jsp:include page="static/js/norefresh.js"></jsp:include>
      <jsp:include page="elements/footer.jsp"></jsp:include>
   </body>
</html>