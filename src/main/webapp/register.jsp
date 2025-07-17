<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="CSS/style.css">
</head>
<body>
    <h2>Register</h2>
    <form action="register" method="post">
        <label>Student Number:</label><br>
        <input type="text" name="student_number" required><br><br>
        
        <label>First Name:</label><br>
        <input type="text" name="name" required><br><br>
        
        <label>Surname:</label><br>
        <input type="text" name="surname" required><br><br>
        
        <label>Email:</label><br>
        <input type="email" name="email" required><br><br>
        
        <label>Username:</label><br>
        <input type="text" name="username" required><br><br>
        
        <label>Password:</label><br>
        <input type="password" name="password" required><br><br>
        
        <label>Confirm Password:</label><br>
        <input type="password" name="confirm_password" required><br><br>
        
        <button type="submit">Register</button>
    </form>
    <p><a href="index.jsp">Back to Home</a></p>
</body>
</html>
