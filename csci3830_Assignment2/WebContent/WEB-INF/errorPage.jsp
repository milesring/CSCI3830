<%@ page isErrorPage="true" import="java.io.PrintWriter" %>

<html>
	<head>
		<title>Error</title>
	</head>
	<body>
		<h1>Error</h1>
		There was an error somewhere.
		<p>Here is the stack trace
		<p>
			<%request.setAttribute("ex", exception); %>
			<jsp:include page="formatStackTrace.jsp" />
		<%@ include file="/WEB-INF/footer.jspf" %>
	</body>
</html>