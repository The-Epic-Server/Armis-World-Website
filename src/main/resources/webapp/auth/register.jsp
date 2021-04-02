<%@page import="net.tkdkid1000.armiworldweb.User" %>
<%@page import="net.tkdkid1000.armiworldweb.Config" %>
<!doctype html>
<html>
   <head>
      <jsp:include page="elements/static_imports.jsp"></jsp:include>
      <title><%= Config.get("servertitle", "Armi's World") %></title>
   </head>
   <body>
      <jsp:include page="elements/navbar.jsp"></jsp:include>
      <h1>Register</h1>
      <% if (request.getMethod().equalsIgnoreCase("get")) { %>
      <form method="POST">
         <input type="email" id="email" name="email">
         <input type="text" id="username" name="username">
         <input type="password" id="password" name="password">
         <input type="submit" value="Register">
      </form>
      <% } else {
   	  new User(request.getParameter("email"), request.getParameter("username"), request.getParameter("password")).register();
      response.sendRedirect("/login?message=Successfully%20registered%20you%20for%20Armis%20World%20Forums.%20Please%20login.");
      } %>
      <jsp:include page="static/js/norefresh.js"></jsp:include>
   </body>
</html>