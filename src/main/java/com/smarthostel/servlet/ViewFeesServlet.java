package com.smarthostel.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smarthostel.dao.FeeDAO;
import com.smarthostel.entity.Fee;

@WebServlet("/viewFees")
public class ViewFeesServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        FeeDAO dao;
		try {
			dao = new FeeDAO();
			List<Fee> list = dao.getAllFees();
	        request.setAttribute("fees", list);
	        request.getRequestDispatcher("viewFees.jsp").forward(request, response);
	   
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
         }
}

