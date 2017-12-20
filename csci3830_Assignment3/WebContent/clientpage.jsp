<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%--- Implement a client web page that has numerous input elements such as text fields,
buttons, check boxes, radio buttons, and so on. Using only EL, create a JSP page that
echoes back to the caller the request parameters from the request sent by the web page. --%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Form Data</title>
</head>
<body>
<h1>Form Data Entry for Echoing</h1>

	<form action="EL_1.jsp" method="post">
		<select name = "dropdown">
			<c:choose>
				<c:when test="${param.dropdown=='dropdown1'}">
					<option value="dropdown1" selected>dropdown1</option>
				</c:when>
				<c:otherwise>
					<option value="dropdown1">dropdown1</option>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${param.dropdown=='dropdown2'}">
					<option value="dropdown2" selected>dropdown2</option>
				</c:when>
				<c:otherwise>
					<option value="dropdown2">dropdown2</option>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${param.dropdown=='dropdown3'}">
					<option value="dropdown3" selected>dropdown3</option>
				</c:when>
				<c:otherwise>
					<option value="dropdown3">dropdown3</option>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${param.dropdown=='dropdown4'}">
					<option value="dropdown4" selected>dropdown4</option>
				</c:when>
				<c:otherwise>
					<option value="dropdown4">dropdown4</option>
				</c:otherwise>
			</c:choose>
		</select>
		</br>
		<c:choose>
			<c:when test="${param.radio=='radio1' }">
				<input type="radio" name="radio" value="radio1" checked>radio1</br>
			</c:when>
			<c:otherwise>
				<input type="radio" name="radio" value="radio1">radio1</br>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${param.radio=='radio2' }">
				<input type="radio" name="radio" value="radio2" checked>radio2</br>
			</c:when>
			<c:otherwise>
				<input type="radio" name="radio" value="radio2">radio2</br>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${param.radio=='radio3' }">
				<input type="radio" name="radio" value="radio3" checked>radio3</br>
			</c:when>
			<c:otherwise>
				<input type="radio" name="radio" value="radio3">radio3</br>
			</c:otherwise>
		</c:choose>
		</br>
<!-- 	
		<input type="checkbox" name="checkbox" value="check1">check1</br>
		<input type="checkbox" name="checkbox" value="check2">check2</br>
		<input type="checkbox" name="checkbox" value="check3">check3</br>
		<input type="checkbox" name="checkbox" value="check4">check4</br>
		<input type="checkbox" name="checkbox" value="check5">check5</br>
--->
		<c:choose>
			<c:when test="${empty paramValues.checkbox}">
				<c:forEach var="i" begin="1" end="5">
					<input type="checkbox" name="checkbox" value="check${i}">check${i}</br>
				</c:forEach>
			</c:when>
			<c:otherwise>	
					<c:choose>
						<c:when test="${param.check1=='check1'}">
    	 					<input type="checkbox" name="checkbox" value="check1" checked>check1</br>
    	 				</c:when>
    	 				<c:otherwise>
    	 					<input type="checkbox" name="checkbox" value="check1">check1</br>
    	 				</c:otherwise>
    	 			</c:choose>
    	 			<c:choose>
						<c:when test="${param.check2=='check2'}">
    	 					<input type="checkbox" name="checkbox" value="check2" checked>check2</br>
    	 				</c:when>
    	 				<c:otherwise>
    	 					<input type="checkbox" name="checkbox" value="check2">check2</br>
    	 				</c:otherwise>
    	 			</c:choose>
    	 			<c:choose>
						<c:when test="${param.check3=='check3'}">
    	 					<input type="checkbox" name="checkbox" value="check3" checked>check3</br>
    	 				</c:when>
    	 				<c:otherwise>
    	 					<input type="checkbox" name="checkbox" value="check3">check3</br>
    	 				</c:otherwise>
    	 			</c:choose>
    	 			<c:choose>
						<c:when test="${param.check4=='check4'}">
    	 					<input type="checkbox" name="checkbox" value="check4" checked>check4</br>
    	 				</c:when>
    	 				<c:otherwise>
    	 					<input type="checkbox" name="checkbox" value="check4">check4</br>
    	 				</c:otherwise>
    	 			</c:choose>
    	 			<c:choose>
						<c:when test="${param.check5=='check5'}">
    	 					<input type="checkbox" name="checkbox" value="check5" checked>check5</br>
    	 				</c:when>
    	 				<c:otherwise>
    	 					<input type="checkbox" name="checkbox" value="check5">check5</br>
    	 				</c:otherwise>
    	 			</c:choose>
    		</c:otherwise>
    	</c:choose>
	
	
		</br>	
		Textbox1</br>
		<input type="text" name="textbox1" value="${param.textbox1}"></br>
		Textbox2</br>
		<input type="text" name="textbox2" value="${param.textbox2}">
		</br>
		<input type="submit" value="Submit">
	</form>
</body>
</html>