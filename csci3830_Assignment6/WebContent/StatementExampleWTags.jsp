<%@ page import="java.sql.*, com.apress.jdbc.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<html>
    <head>
        <title>Statement Example</title>
    </head>
    <body>
        <h1>Statement Example with Tags</h1>
        
        <sql:update var="result" scope="request" dataSource="jdbc/assign6">
        	INSERT INTO stock_tbl VALUES ("${param.symbol}", "${param.name}")
    	</sql:update>
    	
    	<c:choose>
    		<c:when test="${result == 1}">
    			Data successfully inserted into database
    		</c:when>
    		<c:otherwise>
    			Data was not inserted into database. Reason for failure is unknown
    		</c:otherwise>    	
    	</c:choose>
    </body>
</html>