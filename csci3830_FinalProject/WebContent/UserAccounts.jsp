<%@ page import="java.sql.*, com.apress.jdbc.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  

<html>
  <head>
  <link rel="stylesheet" href="layoutcss.css">
    <title>Home Page</title>
  </head>
  <body>
    <h1>User Account</h1>
	
	<sql:setDataSource dataSource="jdbc/csci3830final" />
	<c:set var="login" value="${param.login}"/>
	<c:set var="password" value = "${param.password}"/>
	<c:set var="register" value = "${param.register}"/>
	<c:set var="update" value = "${param.update}" /> 
	<c:choose>
		<c:when test = "${not empty register}">
			<sql:query var="result">
				SELECT * from users WHERE name = ?;
				<sql:param value = "${login}" />
			</sql:query>
		
			<c:choose>
				<c:when test = "${result.rowCount == 0}">
					<c:catch var="exception">
					
					<sql:update var="registeruser">
						INSERT INTO users (name, password) VALUES (?,?)
						<sql:param value="${login}" />
						<sql:param value="${password}" />	
					</sql:update>
				
					<c:if test="${not empty registeruser}">
						New user registered.
						<form action="Update.jsp">
							<input type="hidden" name="oldlogin" value= "${login}">
							<input type="hidden" name="oldpassword" value = "${password}">
			      			<input type="submit" name="update" value="Account Management">
	    				</form>
					</c:if>
					
					</c:catch>
			
					<c:if test="${exception!=null}">
						<c:out value="Unable to register user." />
					</c:if>
				</c:when>
			
				<c:otherwise>
					Error: User already exists
					<form action="HomePage.html">
			      		<input type="submit" value="Return">
	    			</form>
				</c:otherwise>
			</c:choose>
		</c:when>
		<c:when test = "${not empty update}">
				<sql:update var="update">
						UPDATE users SET name = ?, password = ?
						WHERE name = ? AND password = ?
						<sql:param value="${login}" />
						<sql:param value="${password}" />	
						<sql:param value="${param.oldlogin}" />
						<sql:param value="${param.oldpw}" />
					</sql:update>
					
					User updated.
					<form action="Update.jsp">
						<input type="hidden" name="oldlogin" value= "${login}">
						<input type="hidden" name="oldpassword" value = "${password}">
			      		<input type="submit" name="update" value="Account Management">
	    			</form>
					
		</c:when>
		<c:otherwise>
			<sql:query var="result">
				SELECT * from users WHERE name = ? AND password = ?;
				<sql:param value = "${login}" />
				<sql:param value = "${password}" />
			</sql:query>
			<c:choose>
				<c:when test = "${result.rowCount == 0}">
					User does not exist.
					
					<form action="HomePage.html">
			      		<input type="submit" value="Return">
	    			</form>
				</c:when>
				<c:otherwise>
					User logged in
					<form action="Update.jsp">
						<input type="hidden" name="oldlogin" value= "${login}">
						<input type="hidden" name="oldpassword" value = "${password}">
			      		<input type="submit" name="update" value="Account Management">
	    			</form>
					
				</c:otherwise>
			</c:choose>
		</c:otherwise>
		
	</c:choose>
  </body>
</html>