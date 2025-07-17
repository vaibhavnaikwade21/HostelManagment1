<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Log Complaint - Smart Hostel Management System</title>
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

        .form-box {
            position: relative;
            z-index: 1;
            background-color: rgba(255, 255, 255, 0.1);
            padding: 40px 50px;
            border-radius: 15px;
            text-align: center;
            color: white;
            backdrop-filter: blur(10px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.4);
            max-width: 500px;
            margin: auto;
            top: 50%;
            transform: translateY(-50%);
        }

        h2 {
            color: #fffb00;
            margin-bottom: 25px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 10px;
            text-align: left;
        }

        textarea {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: none;
            resize: none;
            outline: none;
            font-size: 14px;
        }

        input[type="submit"] {
            background-color: #ffffff;
            color: #4facfe;
            padding: 10px 20px;
            margin-top: 20px;
            border: none;
            border-radius: 25px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #fffb00;
            color: #000;
            transform: scale(1.05);
        }
    </style>
</head>
<body>

    <!-- Background Image -->
    <img src="https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=1470&q=80" class="bg-image" alt="Complaint Background">

    <div class="form-box">
        <h2>Submit a Complaint</h2>
        <form action="submitComplaint" method="post">
            <label for="description">Description:</label>
            <textarea name="description" rows="4" cols="50" required placeholder="Describe your issue here..."></textarea><br>
            <input type="submit" value="Submit Complaint" />
        </form>
    </div>

</body>
</html>
