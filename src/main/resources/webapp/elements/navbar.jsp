<%@page import="java.util.HashMap"%>
<%@page import="net.tkdkid1000.armiworldweb.Database"%>
<%@page import="java.util.List" %>
<div class="w3-bar w3-gray">
  <a href="/" class="w3-bar-item w3-button"><img src="static/images/armiworld.png" height=25px, width=auto></a>
  <a href="/store" class="w3-bar-item w3-button w3-mobile">Store</a>
  <a href="/rules" class="w3-bar-item w3-button w3-mobile">Rules</a>
  <a href="/support" class="w3-bar-item w3-button w3-mobile">Support</a>
  <a href="/support" class="w3-bar-item w3-button w3-mobile">Support</a>
  <% if (session.getAttribute("email") == null) {
		%>
		<a href="/login" class="w3-bar-item w3-button w3-mobile account">Login</a>
		<a href="/register" class="w3-bar-item w3-button w3-mobile account">Register</a>
		<%
	} else {
		%>
		<div class="w3-mobile w3-dropdown-hover">
    		<button class="w3-button"><%
			List<HashMap<String, Object>> users = Database.runQuery("SELECT * FROM users WHERE email=\""+session.getAttribute("email")+"\"");
			if (users.size() != 0) {
         		HashMap<String, Object> user = users.get(0);
         		out.println((String)user.get("username"));
         		
         	} %> <i class="fa fa-caret-down"></i></button>
    		<div class="w3-dropdown-content w3-bar-block w3-card-4">
	      		<a href="/account" class="w3-bar-item w3-button">Account</a>
	      		<a href="/logout" class="w3-bar-item w3-button">Logout</a>
    		</div>
  		</div>
		<%
	} %>
</div>
