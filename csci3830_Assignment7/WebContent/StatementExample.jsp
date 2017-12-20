<%@ page import="java.sql.*, com.apress.jdbc.*" %>
<html>
  <head>
    <title>Statement Example</title>
  </head>
  <body>
    <h1>Statement Example</h1>
<%
    Connection conn = null;
    Statement stmt = null;
    String msg = "";
    String oldrow = "";
    String newrow = "";
    String symbol = request.getParameter("symbol");
    String name = request.getParameter("name");
    try {
      conn = JdbcManager.getConnection();
      stmt = conn.createStatement();

      String query = "select * from stock_tbl where symbol = ?";
      
      PreparedStatement ps = conn.prepareStatement(query,
    		  ResultSet.TYPE_SCROLL_SENSITIVE, 
              ResultSet.CONCUR_UPDATABLE);
      ps.setString(1,symbol);
      
     ResultSet rs = ps.executeQuery();
     	newrow = "new row " + symbol + " " + name + "\n";
      
      //update row
      if(rs.next()){
    	  oldrow = "Old row "+ rs.getString("symbol") + " "+ rs.getString("name")+"\n";
      	rs.updateString("name", name);
      	rs.updateRow();
      	
      }
      //create new row
      else{
    	rs.moveToInsertRow();
   		rs.updateString("symbol", symbol);
   		rs.updateString("name", name);
   		rs.insertRow();
   		rs.moveToCurrentRow();
      }
      
    } catch (SQLException e) {
		//msg = "Data was not inserted into database. Reason for failure is unknown";		
		msg = e.getMessage();
    } finally {
      JdbcManager.close(stmt);
      JdbcManager.close(conn);
      
    }
%>
	<%= oldrow %>
	</br>
   <%= newrow %>
 	
 <%
 
 
 %>
  </body>
</html>