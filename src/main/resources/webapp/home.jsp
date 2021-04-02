<%@page import="java.util.ArrayList"%>
<%@page import="net.tkdkid1000.armiworldweb.Config" %>
<html>
   <head>
      <jsp:include page="elements/static_imports.jsp"></jsp:include>
      <title><%= Config.get("servertitle", "Armi's World") %></title>
   </head>
   <body>
     <jsp:include page="elements/navbar.jsp"></jsp:include>
      <img class="logo" src="static/images/armiworld.png">
      <% if (request.getParameter("message") != null) {
    	  %>
    	  <p class="message"><% out.println(request.getParameter("message")); %></p>
    	  <%
      } %>
      <br />
      <% out.println(session.getAttribute("email")); %>
      <jsp:include page="static/js/norefresh.js"></jsp:include>
   </body>
</html>