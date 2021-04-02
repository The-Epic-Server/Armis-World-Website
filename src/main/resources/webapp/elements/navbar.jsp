<%@page import="java.util.HashMap"%>
<%@page import="net.tkdkid1000.armiworldweb.Database"%>
<%@page import="java.util.List" %>
<div class="w3-container">
   <div class="w3-bar w3-card-4 w3-gray w3-large w3-padding-12">
      <a title="Home" href="/" class="w3-bar-item w3-button w3-mobile w3-center"><img src="/static/images/armiworld.png" height=38px width=auto></a>
      <a title="Store" href="/store" class="w3-bar-item w3-button w3-mobile w3-centered"><i class="fas fa-shopping-cart fa-2x"></i><span class="w3-hide-medium"> Store</span></a>
      <a title="Rules" href="/rules" class="w3-bar-item w3-button w3-mobile w3-centered"><i class="fas fa-book fa-2x"></i><span class="w3-hide-medium"> Rules</span></a>
      <a title="Forums" href="/forums" class="w3-bar-item w3-button w3-mobile w3-centered"><i class="fas fa-globe fa-2x"></i><span class="w3-hide-medium"> Forums</span></a>
      <a title="Support" href="/support" class="w3-bar-item w3-button w3-mobile w3-centered"><i class="fas fa-medkit fa-2x"></i><span class="w3-hide-medium"> Support</span></a>
      <% if (session.getAttribute("email") == null) {
         %>
      <a href="/login" class="w3-bar-item w3-button w3-mobile w3-text-orange w3-hover-text-red"><i class="fas fa-key fa-2x"></i><span class="w3-hide-medium"> Login</span></a>
      <a href="/register" class="w3-bar-item w3-button w3-mobile w3-text-orange w3-hover-text-red"><i class="fas fa-door-open fa-2x"></i><span class="w3-hide-medium"> Register</span></a>
      <%
         } else {
         	%>
      <div class="w3-mobile w3-dropdown-hover">
         <button title="User info" class="w3-button w3-mobile w3-centered"><%
            List<HashMap<String, Object>> users = Database.runQuery("SELECT * FROM users WHERE email=\""+session.getAttribute("email")+"\"");
            if (users.size() != 0) {
                  		HashMap<String, Object> user = users.get(0);
                  		%>
                  			<img class="w3-image w3-circle" style="width: 50px; height: auto;" alt="Icon" src=<%= user.get("icon") %>>
                  			<span class="w3-hide-medium"><%= user.get("username") %></span>
                  		<%
                  	} %> <i class="fa fa-caret-down"></i></button>
         <div class="w3-dropdown-content w3-bar-block w3-card-4">
            <a title="Account info and passwords" href="/account" class="w3-bar-item w3-button"><i class="fas fa-user-circle fa-xl"></i> Account</a>
            <a title="Logout" href="/logout" class="w3-bar-item w3-button"><i class="fas fa-sign-out-alt fa-xl"></i> Logout</a>
         </div>
      </div>
      <%
         } %>
   </div>
</div>
<br />
<br />