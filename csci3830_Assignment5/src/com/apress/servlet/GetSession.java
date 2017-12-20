
package com.apress.servlet;

import javax.servlet.http.*;
import java.io.*;
import java.util.*;

public class GetSession extends HttpServlet {
  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
  {
    HttpSession session = request.getSession(false);
    try {
      response.setContentType("text/html");
      PrintWriter writer = response.getWriter();
      writer.println("<html><body>");
      if (session == null) {
        writer.println("You are not logged in");
      } else {
        writer.println("Thank you, you are already logged in");
        writer.println("Here is the data in your session");
        Enumeration names = session.getAttributeNames();
        while (names.hasMoreElements()) {
          String name = (String) names.nextElement();
          Object value = session.getAttribute(name);
          writer.println("<p>name=" + name + " value=" + value);
        }
      }
      writer.println(
        "<p><a href=\"login.html\">Return" + "</a> to login page");
      writer.println("</body></html>");
      writer.close();
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}