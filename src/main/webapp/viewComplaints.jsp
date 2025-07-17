<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.smarthostel.entity.Complaint" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Complaints - Smart Hostel Management System</title>
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

        .status-pending {
            color: #ffa500;
            font-weight: bold;
        }

        .status-resolved {
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

    <!-- ✅ Background Image -->
    <img src="https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=1470&q=80" class="bg-image" alt="Complaint Background">

    <div class="container">
        <h2>All Complaints</h2>

        <table>
            <tr>
                <th>ID</th>
                <th>Student</th>
                <th>Description</th>
                <th>Status</th>
                <th>Created At</th>
            </tr>
            <%
                List<Complaint> complaints = (List<Complaint>) request.getAttribute("complaints");
                for (Complaint c : complaints) {
                    String statusClass = c.getStatus().equalsIgnoreCase("resolved") ? "status-resolved" : "status-pending";
            %>
            <tr>
                <td><%= c.getComplaintId() %></td>
                <td><%= c.getStudentName() %></td>
                <td><%= c.getDescription() %></td>
                <td class="<%= statusClass %>"><%= c.getStatus() %></td>
                <td><%= c.getCreatedAt() %></td>
            </tr>
            <% } %>
        </table>

        <br>
        <a href="adminDashboard.jsp" class="back-link">← Back to Dashboard</a>
    </div>

</body>
</html>
