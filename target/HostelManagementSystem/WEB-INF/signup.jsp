<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>Signup</h2>

    <form action="SignupServlet" method="post">
        <label>Username:</label>
        <input type="text" name="username" required /><br><br>

        <label>Password:</label>
        <input type="password" name="password" required /><br><br>

        <label>Role:</label>
        <select name="role">
            <option value="student">Student</option>
            <option value="warden">Warden</option>
            <option value="admin">Admin</option>
        </select><br><br>

        <input type="submit" value="Register" />
    </form>
</body>
</html>