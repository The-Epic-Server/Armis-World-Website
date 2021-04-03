<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="net.tkdkid1000.armiworldweb.Database"%>
<%@page import="java.util.List" %>
<%@page import="net.tkdkid1000.armiworldweb.Config" %>
<%@page import="net.tkdkid1000.armiworldweb.User" %>
<!doctype html>
<html>
   <head>
      <jsp:include page="elements/static_imports.jsp"></jsp:include>
      <title><%= Config.get("servertitle", "Armi's World") %></title>
   </head>
   <body>
      <jsp:include page="elements/navbar.jsp"></jsp:include>
      <jsp:include page="elements/alert.jsp"></jsp:include>
      <br />
      <h1>Profile</h1>
      <% if (request.getMethod().equalsIgnoreCase("get")) { %>
      <div class="container card">
        	<form class="form-horizontal" method="POST">
      			<div class="form-group">
      				<label class="control-label col-sm-2">Current Email</label>
        			<input readonly class="form-control" type="email" id="email" name="email" value="<%= session.getAttribute("email") %>">
        			<label class="control-label col-sm-2">New Username</label>
        			<input class="form-control" type="text" id="username" name="username">
        			<label class="control-label col-sm-2">New Password</label>
        			<input class="form-control" type="password" id="password" name="password">
        			<label class="control-label col-sm-2">Current Password</label>
        			<input required class="form-control" type="password" id="oldpassword" name="oldpassword">
      			</div>
      			<p></p>
      			<div class="d-grid gap-2">
      				<button type="submit" class="btn btn-primary btn-block">Update Account</button>
      			</div>
      			<p></p>
      		</form>
        </div>
      <% } else {
    	  
   		List<HashMap<String, Object>> users = Database.runQuery("SELECT * FROM users WHERE email=\""+request.getParameter("email")+"\"");
    	if (users.size() != 0) {
    		User user = User.from((String)session.getAttribute("email"));
    		if (((String)request.getParameter("oldpassword")).equals(user.getPassword())) {
    			if (!(((String) request.getParameter("username")).equals(""))) {
        			user.setUsername((String)request.getParameter("username"));
        		}
        		if (!(((String) request.getParameter("password")).equals(""))) {
        			user.setPassword((String)request.getParameter("password"));
        		}
        		response.sendRedirect("/account?message=Successfully%20updated%20your%20account%20data.");
    		} else {
    			response.sendRedirect("/account?message=Your%20old%20password%20is%20incorrect.");
    		}
    	} else {
    		response.sendRedirect("/account?message=An%20unexpected%20error%20occured.%20Please%20contact%20a%20site%20admin.");
    	}
      } %>
      <jsp:include page="static/js/norefresh.js"></jsp:include>
      <jsp:include page="elements/footer.jsp"></jsp:include>
   </body>
</html>