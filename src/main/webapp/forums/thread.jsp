<%@page import="java.util.HashMap"%>
<%@page import="net.tkdkid1000.armiworldweb.Database"%>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Collections" %>
<%@page import="net.tkdkid1000.armiworldweb.Config" %>
<%@page import="net.tkdkid1000.armiworldweb.User" %>
<%@page import="java.sql.Timestamp" %>
<!doctype html>
<html>
	<head>
		<jsp:include page="/elements/static_imports.jsp"></jsp:include>
		<title><%= Config.get("servertitle", "Armi's World") %> - Create Thread</title>
	</head>
	<body>
		<jsp:include page="/elements/navbar.jsp"></jsp:include>
		<jsp:include page="/elements/alert.jsp"></jsp:include>
		<%
		if (request.getParameter("id") != null) {
			List<HashMap<String, Object>> threads = Database.runQuery("SELECT * FROM threads WHERE id="+request.getParameter("id")+";");
			if (threads.size() != 0) {
				HashMap<String, Object> thread = threads.get(0);
				List<HashMap<String, Object>> comments = Database.runQuery("SELECT * FROM comments;");
				%>
				<div class="card mx-auto" style="width: 36rem;">
					<img class="card-img-top" src="<%= User.from((String)thread.get("author")).getIcon() %>">
					<div class="card-body">
						<h5 class="card-title"><%= thread.get("title") %></h5>
						<p class="card-text text-center">
							<span class="float-end">By: <%= User.from((String)thread.get("author")).getUsername() %></span>
							<br />
							<span><%= thread.get("content") %></span>
						</p>
					</div>
				</div>
				<%
			} else {
				%>
				<h1>The specified thread does not exist!</h1>
				<p class="text-center">Return to <a href="/forums">forums home</a> page</p>
				<%
			}
		} else {
			%>
			<h1>The specified thread does not exist!</h1>
			<p class="text-center">Return to <a href="/forums">forums home</a> page</p>
			<%
		} %>
		<div class="d-grid gap-2">
      		<a class="btn btn-primary" href="/forums/create" role="button">Create Thread</a>
      	</div>
		<jsp:include page="/static/js/norefresh.js"></jsp:include>
     	<jsp:include page="/elements/footer.jsp"></jsp:include>
	</body>
</html>