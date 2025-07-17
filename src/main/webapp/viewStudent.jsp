<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*,com.smarthostel.entity.Student" %>
<%@ page session="true" %>
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String status = (String) request.getAttribute("status");
    String msg = (String) request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
    <title>All Students - Smart Hostel Management System</title>
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
            margin-bottom: 20px;
        }

        .alert {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
            max-width: 700px;
            margin: 20px auto;
            padding: 15px 20px;
            border-radius: 8px;
            font-size: 16px;
            background-color: rgba(255, 0, 0, 0.2);
            color: #ff4c4c;
            border-left: 5px solid #ff4c4c;
            backdrop-filter: blur(4px);
        }

        .alert img {
            width: 24px;
            height: 24px;
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
            background-color: rgba(255, 255, 255, 0.2);
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
    <img src="https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=1470&q=80" class="bg-image" alt="Students Background">

    <div class="container">
        <h2>All Registered Students</h2>

        <% if ("fail".equals(status) && msg != null) { %>
            <div class="alert">
                <img src="https://cdn-icons-png.flaticon.com/512/463/463612.png" alt="Error">
                <span><%= msg %></span>
            </div>
        <% } %>

        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Username</th>
                <th>Room ID</th>
                <th>Room Number</th>
            </tr>
            <%
                List<Student> students = (List<Student>) request.getAttribute("students");
                for (Student s : students) {
            %>
            <tr>
                <td><%= s.getStudentId() %></td>
                <td><%= s.getName() %></td>
                <td><%= s.getUsername() %></td>
                <td><%= s.getRoomId() %></td>
                <td><%= s.getRoomNumber() != null ? s.getRoomNumber() : "Not Allotted" %></td>
            </tr>
            <%
                }
            %>
        </table>

        <br>
        <a href="adminDashboard.jsp" class="back-link">← Back to Dashboard</a>
    </div>

</body>
</html>
