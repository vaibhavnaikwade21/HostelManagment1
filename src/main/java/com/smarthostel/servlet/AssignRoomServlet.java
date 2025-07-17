package com.smarthostel.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smarthostel.dao.RoomDAO;

@WebServlet("/assignRoom")
public class AssignRoomServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        int roomId = Integer.parseInt(request.getParameter("roomId"));

        RoomDAO dao = new RoomDAO();
        boolean success = dao.assignRoom(studentId, roomId);

        if (success) {
            response.sendRedirect("viewStudents");
        } else {
//            response.getWriter().write("Room assignment failed. Room may be occupied.");
        	response.setContentType("text/html");
        	response.getWriter().write(
        	    "<!DOCTYPE html>" +
        	    "<html>" +
        	    "<head>" +
        	    "<style>" +
        	    "body { " +
        	    "    margin: 0; " +
        	    "    font-family: Arial, sans-serif; " +
        	    "    background: url('https://images.unsplash.com/photo-1504384308090-c894fdcc538d?auto=format&fit=crop&w=1350&q=80') no-repeat center center fixed; " +
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
        	    "    <div class='error'>Room assignment failed. Room may be full or invalid.</div>" +
        	    "    <a href='assignRoom.jsp'>Try Again</a>" +
        	    "  </div>" +
        	    "</body>" +
        	    "</html>"
        	);

        }
    }
}

