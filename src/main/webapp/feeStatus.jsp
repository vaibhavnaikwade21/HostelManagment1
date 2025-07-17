<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.smarthostel.entity.User" %>
<%@ page import="com.smarthostel.dao.RoomDAO" %>
<%@ page import="com.smarthostel.dao.FeeDAO" %>
<%@ page import="com.smarthostel.entity.Fee" %>
<%@ page session="true" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"student".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }

    RoomDAO roomDAO = new RoomDAO();
    int studentId = roomDAO.getStudentIdByUserId(user.getUserId());

    FeeDAO feeDAO = new FeeDAO();
    feeDAO.createFeeForStudent(studentId); // ensures a fee record exists
    Fee fee = feeDAO.getFeeByStudentId(studentId);

    double totalFee = fee.getTotalFee();
    double paidAmount = fee.getPaidAmount();
    double pendingAmount = totalFee - paidAmount;
    String status = fee.getStatus();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Fee Status - Smart Hostel</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-image: url('https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=1470&q=80');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            color: #fff;
        }

        .container {
            background: rgba(0, 0, 0, 0.75);
            max-width: 600px;
            margin: 50px auto;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 15px #333;
        }

        h2 {
            text-align: center;
            color: #00e6e6;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 12px;
            text-align: left;
            color: #fff;
        }

        th {
            background-color: #006666;
        }

        form {
            text-align: center;
            margin-top: 20px;
        }

        input[type="number"] {
            padding: 8px;
            width: 100px;
            border-radius: 4px;
            border: none;
        }

        input[type="submit"] {
            background-color: #00b3b3;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            margin-left: 10px;
        }

        input[type="submit"]:hover {
            background-color: #009999;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #00e6e6;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Fee Status for <%= user.getUsername() %></h2>

    <table>
        <tr><th>Total Fee</th><td>₹<%= totalFee %></td></tr>
        <tr><th>Paid Amount</th><td>₹<%= paidAmount %></td></tr>
        <tr><th>Pending Amount</th><td>₹<%= pendingAmount %></td></tr>
        <tr><th>Status</th><td><%= status %></td></tr>
    </table>

    <% if (!"Paid".equalsIgnoreCase(status)) { %>
        <form action="payFee" method="post">
            <label>Enter amount to pay: </label>
            <input type="number" name="amount" min="1" max="<%= pendingAmount %>" required />
            <input type="hidden" name="studentId" value="<%= studentId %>" />
            <input type="submit" value="Pay Now" />
        </form>
    <% } else { %>
        <p style="text-align:center; font-weight:bold; color:#00ff99;">No dues remaining. Fee fully paid.</p>
    <% } %>

    <div style="text-align:center;">
        <a href="studentDashboard.jsp">Back to Dashboard</a>
    </div>
</div>
</body>
</html>
