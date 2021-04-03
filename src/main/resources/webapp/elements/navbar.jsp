<%@page import="java.util.HashMap"%>
<%@page import="net.tkdkid1000.armiworldweb.Database"%>
<%@page import="java.util.List" %>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container-fluid">
		<a class="navbar-brand" href="/"><img class="rounded" src="/static/images/armiworld.png"></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item">
					<a href="/store" class="nav-link" aria-current="page"><i class="fas fa-shopping-cart fa-2x"></i> Store</a>
				</li>
				<li class="nav-item">
					<a href="rules" class="nav-link" aria-current="page"><i class="fas fa-book fa-2x"></i> Rules</a>
				</li>
				<li class="nav-item">
					<a href="/forums" class="nav-link" aria-current="page"><i class="fas fa-globe fa-2x"></i> Forums</a>
				</li>
				<li class="nav-item">
					<a href="/support" class="nav-link" aria-current="page"><i class="fas fa-medkit fa-2x"></i> Support</a>
				</li>
				<% if (session.getAttribute("email") == null) { %>
					<li class="nav-item">
						<a href="/login" class="nav-link" aria-current="page"><i class="fas fa-key fa-2x"></i> Login</a>
					</li>
					<li class="nav-item">
						<a href="/register" class="nav-link" aria-current="page"><i class="fas fa-door-open fa-2x"></i> Register</a>
					</li>
				<% } else { 
					List<HashMap<String, Object>> users = Database.runQuery("SELECT * FROM users WHERE email=\""+session.getAttribute("email")+"\"");
		            if (users.size() != 0) {
						HashMap<String, Object> user = users.get(0);
					%>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="javascript:void(0);" id="accountDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							<img class="img-circle" style="width: 50px; height: auto;" src=<%= user.get("icon") %>>
							<span><%= user.get("username") %></span>
						</a>
						<ul class="dropdown-menu" aria-labelledby="accountDropdown">
							<li>w</li>
						</ul>
					</li>
				<% }} %>
			</ul>
		</div>
	</div>
</nav>
<br />
<br />