package com.apress.servlet;

import javax.servlet.http.*;
import java.io.*;

public class Login extends HttpServlet {
  public void doPost(
    HttpServletRequest request,
    HttpServletResponse response)
  {
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    HttpSession session = request.getSession(true);
    session.setAttribute("username", username);
    session.setAttribute("password", password);
    try {
      response.setContentType("text/html");
      PrintWriter writer = response.getWriter();
      writer.println("<html><body>");
      writer.println(
        "Thank you, " + username + ". You are now logged into the system");
     //String newURL = response.encodeURL("GetSession");
      String newURL = "login.html";
      writer.println(
        "Click <a href=\"" + newURL + "\">here</a> for another servlet");
     
      writer.println("</body></html>");
      writer.close();
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}
