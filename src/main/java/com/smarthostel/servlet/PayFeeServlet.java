package com.smarthostel.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smarthostel.dao.FeeDAO;

@WebServlet("/payFee")
public class PayFeeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        double amount = Double.parseDouble(request.getParameter("amount"));

        try {
            FeeDAO dao = new FeeDAO();
            dao.payFees(studentId, amount);
            response.sendRedirect("feeStatus.jsp"); // refresh page after payment
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Payment failed: " + e.getMessage());
        }
    }
}

