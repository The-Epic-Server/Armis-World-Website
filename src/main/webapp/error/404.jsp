<%@page import="net.tkdkid1000.armiworldweb.Config" %>
<!doctype html>
<html>
   <head>
      <jsp:include page="/elements/static_imports.jsp"></jsp:include>
      <title><%= Config.get("servertitle", "Armi's World") %> - 404</title>
   </head>
   <body>
      <jsp:include page="/elements/navbar.jsp"></jsp:include>
      <jsp:include page="/elements/alert.jsp"></jsp:include>
      <h2>404 - Not Found</h2>
      <jsp:include page="/static/js/norefresh.js"></jsp:include>
      <jsp:include page="/elements/footer.jsp"></jsp:include>
   </body>
</html>