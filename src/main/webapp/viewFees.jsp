<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="com.smarthostel.dao.FeeDAO" %>
<%@ page import="com.smarthostel.entity.Fee" %>
<%@ page import="com.smarthostel.dao.StudentDAO" %>
<%@ page import="com.smarthostel.entity.User" %>
<%@ page session="true" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"admin".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }

    FeeDAO feeDAO = new FeeDAO();
    StudentDAO studentDAO = new StudentDAO(); // Optional for future use
    List<Fee> feeList = feeDAO.getAllFees();
%>

<!DOCTYPE html>
<html>
<head>
    <title>All Students Fee Status - Admin View</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            height: 100vh;
            overflow: auto;
            position: relative;
        }

        .bg-image {
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            width: 100%;
            object-fit: cover;
            z-index: -1;
            filter: brightness(0.5);
        }

        .container {
            position: relative;
            z-index: 1;
            padding: 40px;
            color: white;
            text-align: center;
        }

        h2 {
            color: #fffb00;
            margin-bottom: 25px;
        }

        table {
            width: 90%;
            margin: auto;
            border-collapse: collapse;
            background-color: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(5px);
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
        }

        th, td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
            color: white;
        }

        th {
            background-color: rgba(255, 255, 255, 0.2);
            color: #fffb00;
        }

        tr:hover {
            background-color: rgba(255, 255, 255, 0.1);
        }

        .status-paid {
            color: #4cff4c;
            font-weight: bold;
        }

        .status-partial {
            color: #ffa500;
            font-weight: bold;
        }

        .status-unpaid {
            color: #ff4c4c;
            font-weight: bold;
        }

        .back-link {
            margin-top: 30px;
            display: inline-block;
            text-decoration: none;
            padding: 10px 20px;
            background-color: #ffffff;
            color: #4facfe;
            border-radius: 25px;
            font-weight: bold;
            transition: all 0.3s ease;
        }

        .back-link:hover {
            background-color: #fffb00;
            color: #000;
            transform: scale(1.05);
        }
    </style>
</head>
<body>

    <!-- Background Image -->
    <img src="https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=1470&q=80" class="bg-image" alt="Fee Status Background">

    <div class="container">
        <h2>All Students Fee Status</h2>

        <table>
            <tr>
                <th>Student ID</th>
                <th>Total Fee</th>
                <th>Paid Amount</th>
                <th>Pending Amount</th>
                <th>Status</th>
            </tr>
            <%
                for (Fee fee : feeList) {
                    double pending = fee.getTotalFee() - fee.getPaidAmount();
                    String statusClass = "";
                    switch (fee.getStatus().toLowerCase()) {
                        case "paid": statusClass = "status-paid"; break;
                        case "partial": statusClass = "status-partial"; break;
                        case "unpaid": statusClass = "status-unpaid"; break;
                    }
            %>
            <tr>
                <td><%= fee.getStudentId() %></td>
                <td>₹<%= fee.getTotalFee() %></td>
                <td>₹<%= fee.getPaidAmount() %></td>
                <td>₹<%= pending %></td>
                <td class="<%= statusClass %>"><%= fee.getStatus() %></td>
            </tr>
            <% } %>
        </table>

        <br>
        <a href="adminDashboard.jsp" class="back-link">← Back to Admin Dashboard</a>
    </div>

</body>
</html>
