<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <head>
    <title>Smart Hostel Management System</title>
    <style>
    body {
        margin: 0;
        padding: 0;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        height: 100vh;
        overflow: hidden;
        position: relative;
    }

    /* Fullscreen Background Image */
    .bg-image {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        object-fit: cover;
        z-index: -1;
        filter: brightness(0.4); /* darkens image for readability */
    }

    .container {
        position: relative;
        z-index: 1;
        background-color: rgba(255, 255, 255, 0.1);
        padding: 40px 60px;
        border-radius: 20px;
        text-align: center;
        color: white;
        backdrop-filter: blur(10px);
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
        max-width: 600px;
        margin: auto;
        top: 50%;
        transform: translateY(-50%);
    }

    h1 {
        font-size: 32px;
        color: #fffb00;
        margin-bottom: 20px;
    }

    p {
        font-size: 18px;
        margin-bottom: 30px;
    }

    a {
        display: inline-block;
        text-decoration: none;
        background-color: #ffffff;
        color: #4facfe;
        padding: 12px 25px;
        margin: 0 10px;
        border-radius: 30px;
        font-weight: bold;
        transition: all 0.3s ease;
    }

    a:hover {
        background-color: #fffb00;
        color: #000;
        transform: scale(1.05);
    }
</style>

</head>
    
</head>

    <body>
    <!-- Background Image -->
    <img src="https://images.unsplash.com/photo-1580587771525-78b9dba3b914?auto=format&fit=crop&w=1500&q=80" class="bg-image" alt="Hostel Background">

    <!-- Foreground Container -->
    <div class="container">
        <h1>Welcome to Smart Hostel Management System</h1>
        <p>This portal is used by Students, Wardens, and Admins to manage hostel activities.</p>
        <a href="login.jsp">Login</a> 
        <a href="signup.jsp">Signup</a>
    </div>
</body>



</html>
