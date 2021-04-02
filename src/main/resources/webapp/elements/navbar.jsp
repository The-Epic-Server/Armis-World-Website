<%@page import="java.util.HashMap"%>
<%@page import="net.tkdkid1000.armiworldweb.Database"%>
<%@page import="java.util.List" %>
<div class="w3-top">
   <div class="w3-bar w3-card-4 w3-gray w3-large w3-padding-12">
      <a href="/" class="w3-bar-item w3-button w3-mobile w3-center"><img src="static/images/armiworld.png" height=30px, width=auto></a>
      <a href="/store" class="w3-bar-item w3-button w3-mobile w3-centered">Store</a>
      <a href="/rules" class="w3-bar-item w3-button w3-mobile w3-centered">Rules</a>
      <a href="/support" class="w3-bar-item w3-button w3-mobile w3-centered">Support</a>
      <a href="/support" class="w3-bar-item w3-button w3-mobile w3-centered">Support</a>
      <% if (session.getAttribute("email") == null) {
         %>
      <a href="/login" class="w3-bar-item w3-button w3-mobile w3-text-orange w3-hover-text-red">Login</a>
      <a href="/register" class="w3-bar-item w3-button w3-mobile w3-text-orange w3-hover-text-red">Register</a>
      <%
         } else {
         	%>
      <div class="w3-mobile w3-dropdown-hover">
         <button class="w3-button"><%
            List<HashMap<String, Object>> users = Database.runQuery("SELECT * FROM users WHERE email=\""+session.getAttribute("email")+"\"");
            if (users.size() != 0) {
                  		HashMap<String, Object> user = users.get(0);
                  		%>
                  			<img class="w3-image w3-circle" style="width: 50px; height: auto;" alt="Icon" src=<%= user.get("icon") %>>
                  		<%
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
</div>
<br />
<br />