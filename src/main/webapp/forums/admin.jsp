<%@page import="java.util.HashMap"%>
<%@page import="net.tkdkid1000.armiworldweb.Database"%>
<%@page import="java.util.List" %>
<%@page import="net.tkdkid1000.armiworldweb.Config" %>
<!doctype html>
<html>
	<head>
		<jsp:include page="/elements/static_imports.jsp"></jsp:include>
		<title><%= Config.get("servertitle", "Armi's World") %> - Admin</title>
	</head>
	<body>
		<div class="container card">
			<form class="form-horizontal" method="POST">
				<div class="form-group">
					<select class="form-select" aria-label="Create forum or category">
						<option value="category">Category</option>
						<option value="forum">Forum</option>
					</select>
				</div>
			</form>
		</div>
	</body>
</html>