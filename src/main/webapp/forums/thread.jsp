<%@page import="org.commonmark.renderer.html.AttributeProvider"%>
<%@page import="java.util.HashMap"%>
<%@page import="net.tkdkid1000.armiworldweb.Database"%>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Collections" %>
<%@page import="net.tkdkid1000.armiworldweb.Config" %>
<%@page import="net.tkdkid1000.armiworldweb.User" %>
<%@page import="java.sql.Timestamp" %>
<%@page import="org.commonmark.node.Node" %>
<%@page import="org.commonmark.parser.Parser" %>
<%@page import="org.commonmark.renderer.html.HtmlRenderer" %>
<%@page import="java.util.concurrent.ThreadLocalRandom" %>
<!doctype html>
<html>
	<head>
		<jsp:include page="/elements/static_imports.jsp"></jsp:include>
		<title><%= Config.get("servertitle", "Armi's World") %> - Thread - <%= request.getParameter("id") %></title>
	</head>
	<body>
		<jsp:include page="/elements/navbar.jsp"></jsp:include>
		<jsp:include page="/elements/alert.jsp"></jsp:include>
		<% if (request.getMethod().equalsIgnoreCase("post")) { 
			Database.runCommand(String.format("INSERT INTO comments(id,thread,author,content,date,rep) VALUES(%s,%s,\"%s\",\"%s\",\"%s\",%s)",
					ThreadLocalRandom.current().nextInt(10000, 99999 + 1),
					request.getParameter("forumid"),
					session.getAttribute("email"),
					request.getParameter("comment"),
					new Timestamp(System.currentTimeMillis()),
					1));
		} %>
		<%
		if (request.getParameter("id") != null) {
			List<HashMap<String, Object>> threads = Database.runQuery("SELECT * FROM threads WHERE id="+request.getParameter("id")+";");
			if (threads.size() != 0) {
				HashMap<String, Object> thread = threads.get(0);
				List<HashMap<String, Object>> comments = Database.runQuery("SELECT * FROM comments WHERE thread="+thread.get("id")+";");
				%>
				<div class="card mx-auto" style="width: 36rem;">
					<div class="card-body">
						<h5 class="card-title"><%= thread.get("title") %></h5>
						<p class="card-text">
							<strong><span class="float-end"><%= User.from((String)thread.get("author")).getUsername() %> <img class="rounded" height="30px" width="auto" src="<%= User.from((String)thread.get("author")).getIcon() %>"></span></strong>
						</p>
						<br />
						<span class="card-text threadtext">
							<%
							Parser parser = Parser.builder().build();
							Node document = parser.parse((String)thread.get("content"));
							HtmlRenderer renderer = HtmlRenderer.builder().escapeHtml(true).sanitizeUrls(true).build();
							out.println(renderer.render(document));
							%>
						</span>
					</div>
				</div>
				<div class="card mx-auto" style="width: 36rem;">
					<div class="card-body">
						<h6 class="card-title">Comments</h6>
						<form class="form-horizontal" method="POST">
							<div class="form-group">
								<input id="forumid" name="forumid" value="<%= request.getParameter("id") %>" style="display: none;">
								<textarea required class="form-control" id="comment" name="comment"></textarea>
								<div class="d-grid gap-2">
									<button type="submit" class="btn btn-primary">Comment</button>
								</div>
							</div>
						</form>
						<p class="card-text">
							<%
							List<Timestamp> dates = new ArrayList<Timestamp>();
							for (HashMap<String, Object> comment : comments) {
								dates.add(Timestamp.valueOf((String)comment.get("date")));
							}
							Collections.sort(dates);
							Collections.reverse(dates);
							for (Timestamp date : dates) {
								HashMap<String, Object> comment = Database.runQuery("SELECT * FROM comments WHERE date=\""+date.toString()+"\"").get(0);
								System.out.println((String)comment.get("content"));
								%>
								<span class="float-end"><a href="<%= User.from((String)comment.get("author")).getUrl() %>"><%= User.from((String)comment.get("author")).getUsername() %></a> <img class="rounded" src="<%= User.from((String)comment.get("author")).getIcon() %>" height="20px" width="auto"></span>
								<span class="card-text threadtext">
									<%
									Parser commentparser = Parser.builder().build();
									Node commentdocument = commentparser.parse((String)comment.get("content"));
									HtmlRenderer commentrenderer = HtmlRenderer.builder().escapeHtml(true).sanitizeUrls(true).build();
									out.println(commentrenderer.render(commentdocument));
									%>
								</span>
								<hr/>
								<%
							}
							%>
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
      	<script>
    		var simplemde = new SimpleMDE({
    		element: document.getElementById("comment"),
    		forceSync: true,
  		  	showIcons: ["code", "table", "heading-smaller", "heading-bigger", "quote", "clean-block"],
   		  	previewRender: function(md, preview) {
     			setTimeout(function() {
  	 	  			preview.innerHTML = marked(md);
     			}, 250);
     			return "Rendering...";
     		}
   			});
     	</script>
		<jsp:include page="/static/js/norefresh.js"></jsp:include>
     	<jsp:include page="/elements/footer.jsp"></jsp:include>
	</body>
</html>