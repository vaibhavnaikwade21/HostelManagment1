<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.smarthostel.entity.User" %>
<%@ page session="true" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"admin".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard - Smart Hostel Management System</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            height: 100vh;
            overflow: hidden;
            position: relative;
        }

        .bg-image {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            z-index: -1;
            filter: brightness(0.5);
        }

        .dashboard {
            position: relative;
            z-index: 1;
            background-color: rgba(255, 255, 255, 0.1);
            padding: 40px 50px;
            border-radius: 15px;
            text-align: center;
            color: white;
            backdrop-filter: blur(10px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.4);
            max-width: 600px;
            margin: auto;
            top: 50%;
            transform: translateY(-50%);
        }

        h2 {
            color: #fffb00;
            margin-bottom: 20px;
        }

        h3 {
            margin-bottom: 20px;
            font-size: 22px;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        ul li {
            margin: 10px 0;
        }

        ul li a {
            text-decoration: none;
            padding: 12px 25px;
            background-color: #ffffff;
            color: #4facfe;
            border-radius: 30px;
            font-weight: bold;
            transition: all 0.3s ease;
            display: inline-block;
        }

        ul li a:hover {
            background-color: #fffb00;
            color: #000;
            transform: scale(1.05);
        }
    </style>
</head>
<body>

    <!-- ✅ Verified Absolute Background Image -->
    <img src="https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=1470&q=80" class="bg-image" alt="Admin Background">

    <div class="dashboard">
        <h2>Welcome Admin: <%= user.getUsername() %></h2>
        <h3>Admin Actions</h3>
        <ul>
            <li><a href="viewStudents">View All Students</a></li>
            <li><a href="viewRooms">Manage Rooms</a></li>
            <li><a href="assignRoom.jsp">Assign Room to Student</a></li>
            <li><a href="viewComplaints">View Complaints</a></li>
            <li><a href="viewFees">View Fees Status</a></li>
            <li><a href="index.jsp">Logout</a></li>
        </ul>
    </div>

</body>
</html>
