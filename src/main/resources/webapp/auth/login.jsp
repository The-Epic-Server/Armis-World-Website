<%@page import="java.util.Map"%>
<%@page import="net.tkdkid1000.armiworldweb.Database"%>
<!doctype html>
<html>
   <head>
      <title>ArmiWorldWeb</title>
   </head>
   <body>
      <h1>Login</h1>
      <a href="/">home</a>
      <% if (request.getMethod().equalsIgnoreCase("get")) { %>
      <% if (request.getParameter("message") != null) {
    	  %>
    	  <p class="message"><% out.println(request.getParameter("message")); %></p>
    	  <%
      } %>
      <form method="POST">
         <input type="email" id="email" name="email">
         <input type="password" id="password" name="password">
         <input type="submit" value="Login">
      </form>
      <% } else { %>
      <%
         Map<String, Object> database = Database.load();
         @SuppressWarnings("unchecked")
      	 Map<String, Object> users = (Map<String, Object>) database.get("users");
         if  (users.containsKey(request.getParameter("email"))) {
        	 @SuppressWarnings("unchecked")
        	 Map<String, Object> user = (Map<String, Object>) users.get(request.getParameter("email"));
        	 if (user.get("password").equals(request.getParameter("password"))) {
        		 %>
            	 <p><% out.println(request.getParameter("email")); %></p>
          		 <%session.setAttribute("email", request.getParameter("email"));%>
          		 <br>
          		 <p><% out.println(request.getParameter("username")); %></p>
          		 <%session.setAttribute("username", request.getParameter("username"));%>
          		 <br>
          		 <p><% out.println(request.getParameter("password")); %></p>
          		 <%session.setAttribute("password", request.getParameter("password"));%>
            	 <%
        	 } else {
        		 response.sendRedirect(request.getServletPath()+"?message=The%20password%20you%20used%20is%20incorrect!");
        	 }
         } else {
        	response.sendRedirect(request.getServletPath()+"?message=There%20is%20no%20account%20registered%20with%20that%20name!");
         }
         %>
      <% } %>
      <jsp:include page="norefresh.js"></jsp:include>
   </body>
</html>