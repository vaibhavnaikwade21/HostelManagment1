package com.smarthostel.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smarthostel.dao.RoomDAO;
import com.smarthostel.entity.User;

@WebServlet("/applyRoom")
public class ApplyRoomServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int roomId = Integer.parseInt(request.getParameter("roomId"));
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        response.setContentType("text/html");

        if (user == null || !"student".equals(user.getRole())) {
            response.sendRedirect("login.jsp");
            return;
        }

        RoomDAO dao = new RoomDAO();
        int studentId = dao.getStudentIdByUserId(user.getUserId());
        boolean success = dao.assignRoom(studentId, roomId);

        if (success) {
//            response.getWriter().write("Room assigned successfully. <a href='studentDashboard.jsp'>Back to Dashboard</a>");
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
//	    	    ".error { " +
//	    	    "    color: #b30000; " +
//	    	    "    font-size: 20px; " +
//	    	    "    font-weight: bold; " +
//	    	    "    margin-bottom: 20px; " +
//	    	    "}" +
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
	    	    "    <div>Room Assigned Sucessfully</div>" +
	    	    "    <a href='studentDashboard.jsp'>Go to Dashboard</a>" +
	    	    "  </div>" +
	    	    "</body>" +
	    	    "</html>"
	    	);

        } else {
            response.getWriter().write("Room assignment failed. Please try again.");
        }
    }
}

