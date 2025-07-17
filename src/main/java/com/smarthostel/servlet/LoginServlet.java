package com.smarthostel.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smarthostel.dao.UserDAO;
import com.smarthostel.entity.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
	    String password = request.getParameter("password");

	    UserDAO dao = new UserDAO();
	    User user = dao.authenticate(username, password);

	    if (user != null) {
	      HttpSession session = request.getSession();
	      session.setAttribute("user", user);
	      switch(user.getRole()) {
	        case "admin": response.sendRedirect("adminDashboard.jsp"); break;
	        case "warden": response.sendRedirect("wardenDashboard.jsp"); break;
	        case "student": response.sendRedirect("studentDashboard.jsp"); break;
	      }
	    } else {
//	      request.setAttribute("error", "Invalid credentials");
//	      request.getRequestDispatcher("login.jsp").forward(request, response);
	    	response.setContentType("text/html");
	    	response.getWriter().write(
	    	    "<!DOCTYPE html>" +
	    	    "<html>" +
	    	    "<head>" +
	    	    "<style>" +
	    	    "body { " +
	    	    "    margin: 0; " +
	    	    "    font-family: Arial, sans-serif; " +
	    	    "    background: url('https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=1470&q=80') no-repeat center center fixed; " +
	    	    "    background-size: cover; " +
	    	    "}" +
	    	    ".container { " +
	    	    "    background-color: rgba(255, 255, 255, 0.9); " +
	    	    "    max-width: 500px; " +
	    	    "    margin: 100px auto; " +
	    	    "    padding: 30px; " +
	    	    "    border-radius: 10px; " +
	    	    "    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); " +
	    	    "    text-align: center; " +
	    	    "}" +
	    	    ".error { " +
	    	    "    color: #b30000; " +
	    	    "    font-size: 20px; " +
	    	    "    font-weight: bold; " +
	    	    "    margin-bottom: 20px; " +
	    	    "}" +
	    	    "a { " +
	    	    "    display: inline-block; " +
	    	    "    margin-top: 10px; " +
	    	    "    padding: 10px 20px; " +
	    	    "    background-color: #007bff; " +
	    	    "    color: white; " +
	    	    "    text-decoration: none; " +
	    	    "    border-radius: 5px; " +
	    	    "    transition: background-color 0.3s ease; " +
	    	    "} " +
	    	    "a:hover { " +
	    	    "    background-color: #0056b3; " +
	    	    "}" +
	    	    "</style>" +
	    	    "</head>" +
	    	    "<body>" +
	    	    "  <div class='container'>" +
	    	    "    <div class='error'>Login failed.</div>" +
	    	    "    <a href='login.jsp'>Try Again</a>" +
	    	    "  </div>" +
	    	    "</body>" +
	    	    "</html>"
	    	);

	    }
	}

}
