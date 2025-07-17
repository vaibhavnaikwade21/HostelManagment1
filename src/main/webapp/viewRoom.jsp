<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="com.smarthostel.entity.Room" %>
<%@ page import="com.smarthostel.dao.RoomDAO" %>

<%
    List<Room> rooms = (List<Room>) request.getAttribute("rooms");
    RoomDAO roomDAO = new RoomDAO();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Room Details - Smart Hostel Management System</title>
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
            width: 80%;
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

        .occupied {
            color: #ff4c4c;
            font-weight: bold;
        }

        .available {
            color: #4cff4c;
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

    <!-- Reliable Background Image -->
    <img src="https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=1470&q=80" class="bg-image" alt="Room Background">

    <div class="container">
        <h2>Room Details</h2>

        <table>
            <tr>
                <th>Room Number</th>
                <th>Capacity</th>
                <th>Assigned</th>
                <th>Status</th>
            </tr>

            <%
                for (Room room : rooms) {
                    int assigned = roomDAO.getAssignedStudentCount(room.getRoomId());
                    int capacity = room.getCapacity();
                    boolean isOccupied = (assigned >= capacity);
                    String status = isOccupied ? "Occupied" : "Available";
            %>
            <tr>
                <td><%= room.getRoomNumber() %></td>
                <td><%= capacity %></td>
                <td><%= assigned %></td>
                <td class="<%= isOccupied ? "occupied" : "available" %>"><%= status %></td>
            </tr>
            <% } %>
        </table>

        <br>
        <a href="adminDashboard.jsp" class="back-link">← Back to Dashboard</a>
    </div>

</body>
</html>
