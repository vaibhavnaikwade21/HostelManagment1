<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.smarthostel.dao.FeeDAO" %>
     <%@ page import="com.smarthostel.dao.RoomDAO" %>
<%@ page import="com.smarthostel.entity.Fee" %>
<%
    FeeDAO feeDAO = new FeeDAO();
    int studentId = new RoomDAO().getStudentIdByUserId(user.getUserId());
    feeDAO.createFeeForStudent(studentId);
    Fee fee = feeDAO.getFeeByStudentId(studentId);
%>
<h3>Fee Details</h3>
<p>Total Fee: ₹<%= fee.getTotalFee() %></p>
<p>Paid Amount: ₹<%= fee.getPaidAmount() %></p>
<p>Status: <%= fee.getStatus() %></p>

<% if (!"Paid".equals(fee.getStatus())) { %>
    <form action="payFee" method="post">
        <label>Enter Amount to Pay: </label>
        <input type="number" name="amount" required min="1" max="<%= fee.getTotalFee() - fee.getPaidAmount() %>"/>
        <input type="submit" value="Pay Now">
        <input type="hidden" name="studentId" value="<%= studentId %>">
    </form>
<% } else { %>
    <p><strong>No Dues. Fee Fully Paid.</strong></p>
<% } %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>Pay Your Fees</h2>
<form action="payFee" method="post">
    Fee ID: <input type="number" name="feeId" required><br>
    Amount to Pay: <input type="number" name="amount" required><br>
    <input type="submit" value="Pay">
</form>

</body>
</html> --%>