<ul>
	<%
	if (request.getParameterValues("message") != null) {
		for (String message : request.getParameterValues("message")) {
		%>
		<li class="list-unstyled">
			<div class="alert alert-primary alert-dismissible" role="alert">
				<%= message %>
				<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			</div>
		</li>
		<%
		}
	}
	%>
</ul>