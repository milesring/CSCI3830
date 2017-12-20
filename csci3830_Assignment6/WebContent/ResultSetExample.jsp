<%@ page import="java.sql.*, com.apress.jdbc.*" %>
<html>
    <head>
        <title>ResultSet Example</title>
    </head>
    <body>
        <h1>ResultSet Example</h1>
        <%
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rset = null;
                    try {
                        conn = JdbcManager.getConnection();
                        stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                                ResultSet.CONCUR_READ_ONLY);

                        String sqlcmd = "select * from CUSTOMER";
                        rset = stmt.executeQuery(sqlcmd);
                        if (rset.next()) {

        %>
        <p>On first row, expected value of isFirst() is true
        <p>isFirst() = <%= rset.isFirst()%>
        <p>Now calling next() twice, expected value of getRow() is 3
            <% rset.next();
                                        rset.next();%>
        <p>getRow() = <%= rset.getRow()%>

        <p>Moving to row 4, customer num, name, and email are
            <% rset.next();%>
        <p>Row <%= rset.getRow()%>:
            <%= rset.getString("CUSTOMER_ID")%>,
            <%= rset.getString("NAME")%>,
            <%= rset.getString("EMAIL")%>
        <p>Now calling last() to move to last row, expected value of isLast() is true
            <% rset.last();%>
        <p>isLast() = <%= rset.isLast()%>, row number is <%= rset.getRow()%>
        <p>Now calling previous(), expected value of isLast() is false
            <% rset.previous();%>
        <p>isLast() = <%= rset.isLast()%>, row number is <%= rset.getRow()%>
        <p>Now calling beforeFirst()
            <% rset.beforeFirst();%>
        <p>isBeforeFirst() = <%= rset.isBeforeFirst()%>,
            isFirst() = <%= rset.isFirst()%>
            <%
                                    } else {
            %>
            No rows found by query
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