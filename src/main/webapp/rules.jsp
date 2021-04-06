<%@page import="net.tkdkid1000.armiworldweb.Config" %>
<% response.sendRedirect("/forums/thread?id="+Config.get("rules", "12345")); %>