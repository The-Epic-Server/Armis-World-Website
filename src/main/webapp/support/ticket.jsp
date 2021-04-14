<%@page import="java.util.HashMap"%>
<%@page import="net.tkdkid1000.armiworldweb.Database"%>
<%@page import="java.util.List" %>
<%@page import="net.tkdkid1000.armiworldweb.Config" %>
<%@page import="java.util.concurrent.ThreadLocalRandom" %>
<%@page import="net.tkdkid1000.armiworldweb.Ticket" %>
<!doctype html>
<html>
   <head>
      <jsp:include page="/elements/static_imports.jsp"></jsp:include>
      <title><%= Config.get("servertitle", "Armi's World") %> - Home</title>
   </head>
   <body>
      <jsp:include page="/elements/navbar.jsp"></jsp:include>
      <jsp:include page="/elements/alert.jsp"></jsp:include>
	  <% if (request.getMethod().equalsIgnoreCase("get")) { %>
	  	<% if (session.getAttribute("email") != null) { %>
        <div class="container card">
        	<form class="form-horizontal" method="POST">
      			<div class="form-group">
      				<label class="control-label col-sm-2">Title</label>
        			<input required class="form-control" type="text" id="title" name="title">
        			<label class="control-label col-sm-2">Content</label>
        			<textarea required class="form-control" id="content" name="content"></textarea>
      			</div>
      			<p></p>
      			<div class="d-grid gap-2">
      				<button type="submit" class="btn btn-primary btn-block">Send</button>
      			</div>
      			<p></p>
      		</form>
        </div>
        <% } else {
			response.sendError(403);
        } %>
      <% } else { %>
      <%
      new Ticket((String)session.getAttribute("email"), request.getParameter("title"), request.getParameter("content")).create();
      response.sendRedirect("/support/ticket?message=Ticket%20sent%20successfully!");
      %>
      <% } %>
      <jsp:include page="/static/js/norefresh.js"></jsp:include>
      <jsp:include page="/elements/footer.jsp"></jsp:include>
   </body>
</html>