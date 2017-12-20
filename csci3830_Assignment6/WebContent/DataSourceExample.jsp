<%@ page import="java.sql.*, com.apress.jdbc.*" %>
<html>
    <head>
        <title>DataSource Example</title>
    </head>
    <body>
        <h1>DataSource Example</h1>
        <%
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rset = null;
                    try {
                        conn = JdbcManager.getConnection();
                        stmt = conn.createStatement();
//conn.createStatement(resultSetType, resultSetConcurrency);
//conn.createStatement(resultSetType, resultSetConcurrency, resultSetHoldability)
                        rset = stmt.executeQuery("select * from CUSTOMER");
                        if (rset.next()) {
        %>
        <table width="100%" border="1">
            <tr align="left">
                <th>Customer Num</th><th>Name</th><th>email</th>
            </tr>
            <%
                        do {
            %>
            <tr>
                <td><%= rset.getString("CUSTOMER_ID")%></td>
                <td><%= rset.getString("NAME")%></td>
                <td><%= rset.getString("EMAIL")%></td>
            </tr>
            <%
                        } while (rset.next());
            %>
        </table>
        <%
                } else {
        %>
        No results from query
        <%        }
            } catch (SQLException e) {
        %>
        <%= e.getMessage()%>
        <%
                        e.printStackTrace();
                    } finally {

                        JdbcManager.close(rset);
                        JdbcManager.close(stmt);
                        JdbcManager.close(conn);
                    }
        %>
    </body>
</html>
