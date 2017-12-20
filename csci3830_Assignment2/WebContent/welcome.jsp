<%@ page errorPage="/WEB-INF/errorPage.jsp"
	import="java.util.Iterator,csci3830_Assignment2.*" %>

<%
	User user = (User) session.getAttribute("user");
	String reqType = request.getParameter("reqType");
	if (user == null && reqType == null) {
%>
		<jsp:forward page="registrationform.html"/>
<%
	} else if (user == null && reqType != null){
%>
	<jsp:forward page="registration.jsp">
		<jsp:param name="submitTime"
					value="<%=(new java.util.Date()).toString()%>" />
	</jsp:forward>
<%
	}
%>
<html>
	<head>
		<title>Java FAQ Welcome Page</title>
	</head>
<body>
	<h1>Java FAQ Welcome Page</h1>
	Welcome to the Java FAQ

<%! FaqCategories faqs = new FaqCategories(); %>
Click a link below for answers to the given topic.
<%
		Iterator categories = faqs.getAllCategories();
		while (categories.hasNext()) {
			String category = (String) categories.next();
%>
			<p><a href="<%= replaceUnderscore(category) %>.jsp">
			<%= category %></a></p>
<%
		}
%>
Submit a question:</br>
<form action="questions.jsp" method="POST">
<input type="text" name="userQuestion" length="70"/>
<input type="submit" value="Submit"/>
</form>

<%@ include file="/WEB-INF/footer.jspf" %>

	</body>
</html>

<%!
public String replaceUnderscore(String s) {
	return s.replace(' ','_');
}
%>