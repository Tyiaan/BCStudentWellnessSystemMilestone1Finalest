<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="CSS/style.css">
</head>
<body>
    <header>
        <div class="logo">
            <img src="images/BelgiumCampusLogo.jpg" alt="Belgium Campus Logo">
            Belgium Campus
        </div>
        <nav>
            <a href="index.jsp">Home</a>
            <a href="login.jsp">Login</a>
            <a href="register.jsp">Register</a>
        </nav>
    </header>

    <main>
        <h1>Login</h1>
        <p>Access your personalized wellness dashboard by logging in with your email and password.</p>
  <% String error = request.getParameter("error");
   String success = request.getParameter("success");
%>

<% if (error != null) { %>
  <div style="color: red;"><%= error %></div>
<% } %>

<% if (success != null) { %>
  <div style="color: green;"><%= success %></div>
<% } %>
        <form action="login" method="post">
          
            <label>Email:</label><br>
            <input type="text" name="email" required><br><br>

            <label>Password:</label><br>
            <input type="password" name="password" required><br><br>

            <button type="submit">Login</button>
        </form>
    </main>

    <footer>
        &copy; 2025 Belgium Campus Student Wellness | 
        <a href="https://www.belgiumcampus.ac.za/">Visit Belgium Campus</a> |
        <a href="https://www.belgiumcampus.ac.za/courses/">Courses</a> |
        <a href="https://www.belgiumcampus.ac.za/contact/">Contact</a>
    </footer>
</body>
</html>