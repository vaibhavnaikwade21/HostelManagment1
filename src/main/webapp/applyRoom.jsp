<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.smarthostel.entity.Room, com.smarthostel.entity.User" %>
<%@ page session="true" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"student".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Load available rooms
    com.smarthostel.dao.RoomDAO dao = new com.smarthostel.dao.RoomDAO();
    List<Room> availableRooms = dao.getAvailableRooms();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Apply for Room</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            height: 100vh;
            background-color: #f0f2f5;
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
            filter: brightness(0.4);
        }

        .container {
            max-width: 600px;
            margin: 100px auto;
            padding: 30px;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            text-align: center;
        }

        h2 {
            color: #4facfe;
            margin-bottom: 30px;
        }

        select {
            width: 80%;
            padding: 10px;
            font-size: 16px;
            border-radius: 10px;
            border: 1px solid #ccc;
        }

        input[type="submit"] {
            margin-top: 20px;
            padding: 10px 30px;
            font-size: 16px;
            background-color: #4facfe;
            border: none;
            color: white;
            border-radius: 25px;
            cursor: pointer;
            transition: 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #38a3f1;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            color: #333;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
            color: #4facfe;
        }
    </style>
</head>
<body>

    <!-- Background Image -->
    <img src="https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=1470&q=80" class="bg-image" alt="Apply for Room Background">

    <div class="container">
        <h2>Apply for a Room</h2>

        <form action="applyRoom" method="post">
            <label for="roomId"><strong>Select a Room:</strong></label><br><br>
            <select name="roomId" required>
                <%
                    for (Room r : availableRooms) {
                %>
                    <option value="<%= r.getRoomId() %>">Room <%= r.getRoomNumber() %> (Capacity: <%= r.getCapacity() %>)</option>
                <%
                    }
                %>
            </select><br><br>

            <input type="submit" value="Apply" />
        </form>

        <a href="studentDashboard.jsp">← Back to Dashboard</a>
    </div>

</body>
</html>
