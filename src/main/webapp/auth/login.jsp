<%@page import="java.util.HashMap"%>
<%@page import="net.tkdkid1000.armiworldweb.Database"%>
<%@page import="java.util.List" %>
<%@page import="net.tkdkid1000.armiworldweb.Config" %>
<!doctype html>
<html>
   <head>
      <jsp:include page="/elements/static_imports.jsp"></jsp:include>
      <title><%= Config.get("servertitle", "Armi's World") %></title>
   </head>
   <body>
      <jsp:include page="elements/navbar.jsp"></jsp:include>
      <jsp:include page="elements/alert.jsp"></jsp:include>
      <h1>Login</h1>
      <% if (request.getMethod().equalsIgnoreCase("get")) { %>
        <div class="container card">
        	<form class="form-horizontal" method="POST">
      			<div class="form-group">
      				<label class="control-label col-sm-2">Email</label>
        			<input required class="form-control" type="email" id="email" name="email">
        			<label class="control-label col-sm-2">Password</label>
        			<input required class="form-control" type="password" id="password" name="password">
      			</div>
      			<p></p>
      			<div class="d-grid gap-2">
      				<button type="submit" class="btn btn-primary btn-block">Login</button>
      			</div>
      			<p></p>
      		</form>
        </div>
      <% } else { %>
      <%
         List<HashMap<String, Object>> users = Database.runQuery("SELECT * FROM users WHERE email=\""+request.getParameter("email")+"\"");
         if (users.size() != 0) {
        	 HashMap<String, Object> user = users.get(0);
        	 if (user.get("password").equals(request.getParameter("password"))) {
        		 session.setAttribute("email", request.getParameter("email"));
        		 response.sendRedirect("/?message=Successfully%20logged%20in.");
        	 } else {
        		 response.sendRedirect(request.getServletPath()+"?message=The%20password%20you%20used%20is%20incorrect!");
        	 }
         } else {
        	response.sendRedirect(request.getServletPath()+"?message=There%20is%20no%20account%20registered%20with%20that%20name!");
         }
         %>
      <% } %>
      <jsp:include page="static/js/norefresh.js"></jsp:include>
      <jsp:include page="elements/footer.jsp"></jsp:include>
   </body>
</html>