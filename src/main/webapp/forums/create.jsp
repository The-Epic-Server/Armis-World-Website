<%@page import="java.util.HashMap"%>
<%@page import="net.tkdkid1000.armiworldweb.Database"%>
<%@page import="java.util.List" %>
<%@page import="net.tkdkid1000.armiworldweb.Config" %>
<%@page import="java.util.concurrent.ThreadLocalRandom" %>
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
     <h1>Create Thread</h1>
     <% if (session.getAttribute("email") == null) {
    	 response.sendError(403);
     }
     %>
     <% if (request.getMethod().equalsIgnoreCase("get")) { %>
     	<div class="container card">
        	<form class="form-horizontal" method="POST">
      			<div class="form-group">
      				<select required name="forum" id="forum" class="form-select" aria-label="Select a forum">
      					<%
      					List<HashMap<String, Object>> forums = Database.runQuery("SELECT * FROM forums;");
      					for (HashMap<String, Object> forum : forums) {
      						String name = (String)forum.get("name");
      						name = name.substring(0, 1).toUpperCase() + name.substring(1);
      						%>
      						<option value="<%= forum.get("name") %>"><%= name %></option>
      						<%
      					}
      					%>
      				</select>
      				<label class="control-label col-sm-2">Title</label>
        			<input required class="form-control" type="text" id="title" name="title">
        			<label class="control-label col-sm-2">Content</label>
        			<textarea required class="form-control" id="content" name="content"></textarea>
      			</div>
      			<p></p>
      			<div class="d-grid gap-2">
      				<button type="submit" class="btn btn-primary btn-block">Post</button>
      			</div>
      			<p></p>
      		</form>
        </div>
     <% } else {
    	 List<HashMap<String, Object>> categories = Database.runQuery("SELECT * FROM categories;");
         List<HashMap<String, Object>> forums = Database.runQuery("SELECT * FROM forums;");
         List<HashMap<String, Object>> threads = Database.runQuery("SELECT * FROM threads;");
         List<HashMap<String, Object>> comments = Database.runQuery("SELECT * FROM comments;");
         int forumid = -1;
         for (HashMap<String, Object> forum: forums) {
        	 if (((String)forum.get("name")).equalsIgnoreCase(request.getParameter("forum"))) {
        		 forumid = (int)forum.get("id");
        	 }
         }
         if (forumid != -1) {
        	 int threadid = ThreadLocalRandom.current().nextInt(10000, 99999 + 1);
        	 System.out.println(String.format("INSERT INTO threads(id,title,author,content,date,forum) VALUES(%s,\"%s\",\"%s\",\"%s\",\"%s\",%s);", threadid, request.getParameter("title"), session.getAttribute("email"), request.getParameter("content"), new Timestamp(System.currentTimeMillis()), 1));
             Database.runCommand(String.format("INSERT INTO threads(id,title,author,content,date,forum) VALUES(%s,\"%s\",\"%s\",\"%s\",\"%s\",%s);", threadid, request.getParameter("title"), session.getAttribute("email"), request.getParameter("content"), new Timestamp(System.currentTimeMillis()), 1));
             response.sendRedirect("/forums?message=Post%20sent%20successfully!");
         } else {
        	 response.sendRedirect("/forums/create.jsp?message=That%20forum%20does%20not%20exist.");
         }
     } %>
     <script>
    	var simplemde = new SimpleMDE({
    	element: document.getElementById("content"),
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