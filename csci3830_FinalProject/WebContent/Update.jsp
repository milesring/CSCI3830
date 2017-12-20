<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
  <head>
  <link rel="stylesheet" href="layoutcss.css">
    <title>Account Management</title>
  </head>
  <body>
  	Current username:  
  	<c:out value = " ${param.oldlogin }" />
	
	<form action="UserAccounts.jsp">
		Update username:
		<br>
		<input type="text" name="login">
		
		<br>
		Update password:
		<br>
		<input type="text" name="password">
		<br>
		<input type="hidden" name="oldlogin" value= "${param.oldlogin}">
		<input type="hidden" name="oldpw" value="${param.oldpassword}">
		<input type="submit" name="update" value="Update">
	</form>
  </body>
</html>
