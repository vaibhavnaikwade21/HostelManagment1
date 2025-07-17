<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.smarthostel.entity.User" %>
<%@ page import="com.smarthostel.dao.RoomDAO" %>
<%@ page session="true" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"student".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }

    RoomDAO dao = new RoomDAO();
    int studentId = dao.getStudentIdByUserId(user.getUserId());
%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Dashboard - Smart Hostel</title>
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
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
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
            margin-bottom: 30px;
        }

        ul {
            list-style: none;
            padding: 0;
        }

        li {
            margin: 15px 0;
        }

        a {
            color: #ffffff;
            font-size: 18px;
            text-decoration: none;
            background-color: rgba(255, 255, 255, 0.15);
            padding: 10px 20px;
            border-radius: 20px;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #fffb00;
            color: #000;
        }

        form {
            margin-top: 30px;
        }

        input[type="submit"] {
            padding: 10px 25px;
            background-color: #ffffff;
            color: #4facfe;
            border: none;
            border-radius: 25px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #ff4c4c;
            color: white;
            transform: scale(1.05);
        }
    </style>
</head>
<body>

    <!-- Background Image -->
    <img src="https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=1470&q=80" class="bg-image" alt="Student Dashboard Background">

    <div class="container">
        <h2>Welcome, <%= user.getUsername() %> (Student)</h2>

        <ul>
            <li><a href="applyRoom.jsp">Apply for Room</a></li>
            <li><a href="ComplaintForm.jsp">Log Complaint</a></li>
            <li><a href="feeStatus.jsp">Check Fee Status & Pay</a></li>
            <li><a href="index.jsp">Logout</a></li>
        </ul>

        <form action="releaseRoom" method="post" onsubmit="return confirm('Are you sure you want to leave the room?');">
            <input type="hidden" name="studentId" value="<%= studentId %>" />
            <input type="submit" value="Leave Room" />
        </form>
    </div>

</body>
</html>
