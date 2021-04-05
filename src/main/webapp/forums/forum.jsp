<%@page import="java.util.HashMap"%>
<%@page import="net.tkdkid1000.armiworldweb.Database"%>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Collections" %>
<%@page import="net.tkdkid1000.armiworldweb.Config" %>
<%@page import="net.tkdkid1000.armiworldweb.User" %>
<%@page import="java.sql.Timestamp" %>
<%@page import="org.apache.http.client.utils.URIBuilder" %>
<%@page import="java.net.URISyntaxException" %>
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
			List<HashMap<String, Object>> forums = Database.runQuery("SELECT * FROM forums WHERE id=\""+request.getParameter("id")+"\";");
			if (forums.size() != 0) {
				HashMap<String, Object> forum = forums.get(0);
				List<HashMap<String, Object>> threads = Database.runQuery("SELECT * FROM threads;");
				%>
				<h1><%= forum.get("name") %></h1>
				<ul class="list-group">
					<%
					List<Timestamp> dates = new ArrayList<Timestamp>();
					for (HashMap<String, Object> thread : threads) {
						dates.add(Timestamp.valueOf((String)thread.get("date")));
					}
					Collections.sort(dates);
					Collections.reverse(dates);
					if (dates.size() == 0) {
						%>
						<li class="list-group-item">
							<span>There is no threads in this forum yet.</span>
						</li>
						<%
					} else {
						if (dates.size() > 20) {
							for (int x=0; x<20; x++) {
								HashMap<String, Object> thread = Database.runQuery("SELECT * FROM threads WHERE date=\""+dates.get(x)+"\";").get(0);
								%>
								<li class="list-group-item">
									<img class="rounded" height="50%" width="auto" src="<%= User.from((String)thread.get("author")).getIcon() %>">
								</li>
								<%
							}
						} else {
							for (int x=0; x<dates.size(); x++) {
								HashMap<String, Object> thread = Database.runQuery("SELECT * FROM threads WHERE date=\""+dates.get(x)+"\";").get(0);
								%>
								<li class="list-group-item">
									<%
									String url = "";
									URIBuilder builder = new URIBuilder();
									builder.setPath("/forums/thread");
									builder.addParameter("id", ""+thread.get("id"));
									try {
									url = builder.build().toString();
									} catch (URISyntaxException e) {
										e.printStackTrace();
									}
									%>
									<a role="button" class="btn btn-primary" href="<%= url %>"><%= thread.get("title") %></a>
									<span class="float-end">
										By 
										<a href="<%= User.from((String)thread.get("author")).getUrl() %>"><%= User.from((String)thread.get("author")).getUsername() %></a>
										<img class="rounded" height="50px" width="auto" src="<%= User.from((String)thread.get("author")).getIcon() %>">
									</span>
								</li>
								<%
							}
						}
					}
					%>
				</ul>
				<%
			} else {
				%>
				<h1>The specified forum does not exist!</h1>
				<p class="text-center">Return to <a href="/forums">forums home</a> page</p>
				<%
			}
		} else {
			%>
			<h1>The specified forum does not exist!</h1>
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