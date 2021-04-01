<%@page import="net.tkdkid1000.armiworldweb.User" %>
<%@page import="net.tkdkid1000.armiworldweb.Database" %>
<!doctype html>
<html>
   <head>
      <title>ArmiWorldWeb</title>
   </head>
   <body>
      <h1>Register</h1>
      <a href="/">home</a>
      <% if (request.getMethod().equalsIgnoreCase("get")) { %>
      <form method="POST">
         <input type="email" id="email" name="email">
         <input type="text" id="username" name="username">
         <input type="password" id="password" name="password">
         <input type="submit" value="Register">
      </form>
      <% } else {
   	  new User("rhone@gmail.co", "rhone", "nope").register();
   	  System.out.println(Database.load());
      response.sendRedirect("/login?message=Successfully%20registered%20you%20for%20Armis%20World%20Forums.%20Please%20login.");
      } %>
      <jsp:include page="norefresh.js"></jsp:include>
   </body>
</html>