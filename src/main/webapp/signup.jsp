<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Signup - Smart Hostel Management System</title>
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

        .signup-box {
            position: relative;
            z-index: 1;
            background-color: rgba(255, 255, 255, 0.1);
            padding: 40px 50px;
            border-radius: 15px;
            text-align: center;
            color: white;
            backdrop-filter: blur(10px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.4);
            max-width: 450px;
            margin: auto;
            top: 50%;
            transform: translateY(-50%);
        }

        h2 {
            color: #fffb00;
            margin-bottom: 25px;
        }

        input[type="text"],
        input[type="password"],
        select {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
            border: none;
            border-radius: 5px;
            outline: none;
        }

        select {
            background-color: #f0f0f0;
        }

        input[type="submit"] {
            background-color: #ffffff;
            color: #4facfe;
            padding: 10px 20px;
            margin-top: 15px;
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

        .back-link {
            display: block;
            margin-top: 20px;
            color: #fff;
            text-decoration: underline;
        }

        .back-link:hover {
            color: #fffb00;
        }
    </style>
</head>
<body>

    <!-- Working Background Image -->
    <img src="https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=1470&q=80" class="bg-image" alt="Signup Background">

    <div class="signup-box">
        <h2>Signup</h2>
        <form action="signup" method="post">
            <input type="text" name="username" placeholder="Username" required /><br>
            <input type="password" name="password" placeholder="Password" required /><br>
            
            <select name="role" required>
                <option value="">-- Select Role --</option>
                <option value="student">Student</option>
                <option value="warden">Warden</option>
                <option value="admin">Admin</option>
            </select><br>

            <input type="text" name="name" placeholder="Full Name (Student only)" /><br>

            <input type="submit" value="Register" />
        </form>
        <a href="index.jsp" class="back-link">← Back to Home</a>
    </div>

</body>
</html>
