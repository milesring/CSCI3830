<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
  <head>
    <title>Echoed Request Parameters</title>
  </head>

  <body>
    <h1>Echoed Parameters:</h1>

<%-- The four lines after this comment contain special expression syntax
     needed to display a literal ${} in the output of a JSP. This is done
     by using an expression to evaluate the literal '${'. That is, the
     expression ${ '${' } evaluates to ${, and whatever follows the
     expression is treated as normal template text.
--%>
    <p>"${pageContext.request.requestURI}"</p>
    <p>Dropdown selection:${param.dropdown}</p>
    <p>Radio selection: ${param.radio}</p>
    <p>Checkbox: 
    <c:forEach items="${paramValues.checkbox}" var="checkbox">
    	 	<p>${checkbox}</p>
    </c:forEach>
    
    <p>Textbox1: ${param.textbox1 }</p>
    <p>Textbox2: ${param.textbox2 }</p>
    <form action="clientpage.jsp" method="post">
    	<input type="hidden" name="textbox1" value="${param.textbox1}">
    	<input type="hidden" name="textbox2" value="${param.textbox2}">
    	<input type="hidden" name="dropdown" value="${param.dropdown}">
    	<input type="hidden" name="radio" value="${param.radio}">
    	<c:forEach items="${paramValues.checkbox}" var="checkbox">
    	 	<input type="hidden" name="${checkbox}" value="${checkbox}">
    	</c:forEach>
    	<input type="hidden" name="checkbox" value="placeholder">
    	<input type="submit" value="Go back">
    </form>
  </body>
</html>