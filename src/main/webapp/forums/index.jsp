<%@page import="java.util.ArrayList"%>
<%@page import="net.tkdkid1000.armiworldweb.Config" %>
<!doctype html>
<html>
   <head>
      <jsp:include page="/elements/static_imports.jsp"></jsp:include>
      <title><%= Config.get("servertitle", "Armi's World") %> - Forums</title>
   </head>
   <body>
      <jsp:include page="/elements/navbar.jsp"></jsp:include>
      <jsp:include page="/elements/alert.jsp"></jsp:include>
      <br />
      <hr />
      <jsp:include page="/static/js/norefresh.js"></jsp:include>
      <jsp:include page="/elements/footer.jsp"></jsp:include>
   </body>
</html>