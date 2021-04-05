<%@page import="java.util.HashMap"%>
<%@page import="net.tkdkid1000.armiworldweb.Database"%>
<%@page import="java.util.List" %>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container-fluid">
		<a class="navbar-brand" href="/"><img src="/static/images/armiworld.png"></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item">
					<a href="/shop" class="nav-link" aria-current="page"><i class="fas fa-shopping-cart fa-2x"></i> Shop</a>
				</li>
				<li class="nav-item">
					<a href="/rules" class="nav-link" aria-current="page"><i class="fas fa-book fa-2x"></i> Rules</a>
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
							<img class="rounded" style="width: auto; height: 35px;" src=<%= user.get("icon") %>>
							<br>
							<span><%= user.get("username") %></span>
						</a>
						<ul class="dropdown-menu" aria-labelledby="accountDropdown">
							<li>
								<a href="/account" class="nav-link" aria-current="page"><i class="fas fa-user-circle fa-2x"></i> Account</a>
							</li>
							<li>
								<a href="/user?name=<%= user.get("username") %>" class="nav-link" aria-current="page"><i class="fas fa-gamepad fa-2x"></i> Profile</a>
							</li>
							<li>
								<a href="/logout" class="nav-link" aria-current="page"><i class="fas fa-sign-out-alt fa-2x"></i> Logout</a>
							</li>
						</ul>
					</li>
				<% }} %>
			</ul>
			<div class="d-flex flex-row-reverse input-group float-end">
				<form class="d-flex flex-row-reverse" action="/user">
					<input list="users" required oninput="setCustomValidity('')" oninvalid="this.setCustomValidity('Please enter a username!')" class="form-control me-2 py-2 border-right-0 border" type="search" placeholder="Search users..." aria-label="Search users..." name="name">
					<datalist id="users">
						<% 
						List<HashMap<String, Object>> allusers = Database.runQuery("SELECT * FROM users;");
						for (HashMap<String, Object> usr : allusers) {
							%>
							<option><%= usr.get("username") %></option>
							<%
						}
						%>
					</datalist>
					<span class="input-group-append">
						<button class="btn btn-outline-secondary border-left-0 border" type="submit">
							<i class="fa fa-search"></i>
						</button>
					</span>
				</form>
			</div>
		</div>
	</div>
</nav>
<br />
<br />