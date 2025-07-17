package com.smarthostel.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smarthostel.dao.ComplaintDAO;
import com.smarthostel.entity.Complaint;

@WebServlet("/viewComplaints")
public class ViewComplaintsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ComplaintDAO dao = new ComplaintDAO();
        List<Complaint> list = dao.getAllComplaints();
        request.setAttribute("complaints", list);
        request.getRequestDispatcher("viewComplaints.jsp").forward(request, response);
    }
}

