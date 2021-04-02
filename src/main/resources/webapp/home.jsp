<%@page import="java.util.ArrayList"%>
<%@page import="net.tkdkid1000.armiworldweb.Config" %>
<html>
   <head>
      <jsp:include page="elements/static_imports.jsp"></jsp:include>
      <title><%= Config.get("servertitle", "Armi's World") %></title>
   </head>
   <body>
      <jsp:include page="elements/navbar.jsp"></jsp:include>
      <br />
      <div class="w3-container w3-center">
      	<img class="logo" src="static/images/armiworld.png">
      </div>
      <% if (request.getParameter("message") != null) {
    	  %>
    	  <p class="message"><% out.println(request.getParameter("message")); %></p>
    	  <%
      } %>
      <br />
      <jsp:include page="static/js/norefresh.js"></jsp:include>
   </body>
</html>