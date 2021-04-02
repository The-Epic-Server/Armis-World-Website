<div class="w3-container darkmodeexempt">
  	<ul class="w3-ul w3-card-4">
      <%
      if (request.getParameterValues("message") != null) {
    	  for (String message : request.getParameterValues("message")) {
        	  %>
        	  	<li class="w3-display-container"> <%= message %>
  					<span onclick="this.parentElement.style.display='none'"
  					class="w3-button w3-display-right">&times;</span>
				</li>
        	  <%
          }
      }
      %>
	</ul>
</div>