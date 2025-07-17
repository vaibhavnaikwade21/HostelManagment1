/*
 * package com.smarthostel.servlet; import java.io.IOException; import
 * java.util.List;
 * 
 * import javax.servlet.ServletException; import
 * javax.servlet.annotation.WebServlet; import javax.servlet.http.HttpServlet;
 * import javax.servlet.http.HttpServletRequest; import
 * javax.servlet.http.HttpServletResponse; import
 * javax.servlet.http.HttpSession;
 * 
 * import com.smarthostel.dao.FeeDAO; import com.smarthostel.entity.Fees; import
 * com.smarthostel.entity.User;
 * 
 * @WebServlet("/feeStatus") public class FeeStatusServlet extends HttpServlet {
 * protected void doGet(HttpServletRequest request, HttpServletResponse
 * response) throws ServletException, IOException { HttpSession session =
 * request.getSession(); User user = (User) session.getAttribute("user");
 * 
 * if (user == null || !"student".equals(user.getRole())) {
 * response.sendRedirect("login.jsp"); return; }
 * 
 * FeeDAO dao = new FeeDAO(); List<Fees> feeList =
 * dao.getFeesByUserId(user.getUserId());
 * 
 * request.setAttribute("fees", feeList);
 * request.getRequestDispatcher("feeStatus.jsp").forward(request, response); } }
 * 
 */