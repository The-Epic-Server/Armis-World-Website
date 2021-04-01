<%@page import="java.util.ArrayList"%>
<html>
   <head>
      <title>ArmiWorldWeb</title>
      <meta>
   </head>
   <body>
      <p>Hello</p>
      <br /> 
      <% out.println("<h1>hi</h1>"); %>
      <a href="/login">login</a>
      <a href="/register">register</a>
      <jsp:include page="norefresh.js"></jsp:include>
   </body>
</html>