<%@page import="java.util.HashMap"%>
<%@page import="net.tkdkid1000.armiworldweb.Database"%>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import="net.tkdkid1000.armiworldweb.Config" %>
<%@page import="java.sql.Timestamp" %>
<%@page import="java.util.Collections" %>
<%@page import="net.tkdkid1000.armiworldweb.User" %>
<%@page import="org.apache.http.client.utils.URIBuilder" %>
<%@page import="java.net.URISyntaxException" %>
<!doctype html>
<html>
   <head>
      <jsp:include page="/elements/static_imports.jsp"></jsp:include>
      <title><%= Config.get("servertitle", "Armi's World") %> - Forums</title>
   </head>
   <body>
      <jsp:include page="/elements/navbar.jsp"></jsp:include>
      <jsp:include page="/elements/alert.jsp"></jsp:include>
      <%
      List<HashMap<String, Object>> categories = Database.runQuery("SELECT * FROM categories;");
      List<HashMap<String, Object>> forums = Database.runQuery("SELECT * FROM forums;");
      List<HashMap<String, Object>> threads = Database.runQuery("SELECT * FROM threads;");
      %>
      <ul class="list-group">
      	<%
      		for (HashMap<String, Object> category : categories) {
      			int categoryid = (int)category.get("id");
      			%>
      				<li class="list-group-item">
      					<h5><%= category.get("name") %> - <%= category.get("description") %></h5>
      					<%
      					for (HashMap<String, Object> forum : forums) {
      						int forumid = (int)forum.get("id");
      	      				%>
      	      				<ul class="list-group">
      	      					<%
      	      					List<Timestamp> dates = new ArrayList<Timestamp>();
      	      					for (HashMap<String, Object> thread : threads) {
      	      						if ((int)thread.get("forum") == forumid) {
      	      							dates.add(Timestamp.valueOf((String)thread.get("date")));
      	      						}
      	      					}
      	      					if (dates.size() != 0) {
      	      						Timestamp max = Collections.max(dates);
	      							HashMap<String, Object> latest = Database.runQuery("SELECT * FROM threads WHERE date=\""+max+"\";").get(0);
	      							String url = "";
									URIBuilder builder = new URIBuilder();
									builder.setPath("/forums/forumpage");
									builder.addParameter("id", ""+forumid);
									try {
										url = builder.build().toString();
									} catch (URISyntaxException e) {
										e.printStackTrace();
									}
									String latesturl = "";
									URIBuilder latestbuilder = new URIBuilder();
									latestbuilder.setPath("/forums/thread");
									latestbuilder.addParameter("id", ""+latest.get("id"));
									try {
										latesturl = latestbuilder.build().toString();
									} catch (URISyntaxException e) {
										e.printStackTrace();
									}
  	      							%>
  	      							<li class="list-group-item">
  	      								<a role="button" class="btn btn-primary" href="<%= url %>"><%= forum.get("name") %></a><span class="float-end"><a href="<%= latesturl %>"><%= latest.get("title") %></a> By <a href="<%= User.from((String)latest.get("author")).getUrl() %>"><%= User.from((String)latest.get("author")).getUsername() %></a> <i class="far fa-clock"></i> <%= latest.get("date") %></span>
  	      							</li>
      	      					<% } else {
      	      						%>
      	      						<li class="list-group-item">
      	      							<span><%= forum.get("name") %></span><span class="float-end">Forum Empty</span>
      	      						</li>
      	      						<%
      	      					} %>
      	      				</ul>
      	      			<% } %>
      				</li>
      			<%
      		}
      	%>
      </ul>
      <br />
      <hr />
      <div class="d-grid gap-2">
      	<a class="btn btn-primary" href="/forums/create" role="button">Create Thread</a>
      </div>
      <jsp:include page="/static/js/norefresh.js"></jsp:include>
      <jsp:include page="/elements/footer.jsp"></jsp:include>
   </body>
</html>