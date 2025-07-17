<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    String studentName = null;
    if (session != null) {
        studentName = (String) session.getAttribute("studentName");
    }
    if (studentName == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update My Profile</title>
    <link rel="stylesheet" href="CSS/style.css">
</head>
<body>

<header>
    <div class="logo">
        <img src="images/BelgiumCampusLogo.jpg" alt="Belgium Campus Logo" height="40">
        Belgium Campus
    </div>
    <nav>
        <a href="dashboard.jsp">Dashboard</a>
        <a href="logout">Logout</a>
    </nav>
</header>

<main>
    <h1>Update My Profile</h1>
    <p>Keep your student information up to date. This helps us to support you better!</p>
<%
    String error = request.getParameter("error");
    String success = request.getParameter("success");
%>

<% if (error != null) { %>
    <div style="color: red;"><%= error %></div>
<% } %>

<% if (success != null) { %>
    <div style="color: green;"><%= success %></div>
<% } %>
    <!-- Profile update form -->
    <form action="UpdateProfileServlet" method="post">
        <label>Phone Number:</label><br>
        <input type="text" name="phone" placeholder="Enter new phone number" required><br><br>

        <label>Email:</label><br>
        <input type="email" name="email" placeholder="Enter new email" required><br><br>

        <button type="submit">Update Profile</button>
    </form>

    <p>If you need to update other details, please contact student admin for help.</p>
</main>

<footer>
    &copy; 2025 Belgium Campus Student Wellness |
    <a href="https://www.belgiumcampus.ac.za/">Visit Belgium Campus</a>
</footer>

</body>
</html>