<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    // Make sure the student is logged in
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
    <title>Book Appointment</title>
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
    <h1>Book a Wellness Appointment</h1>
    <p>Hello, <%= studentName %>! Please use the form below to book your wellness session with our student support team.</p>

    <!-- Simple booking form -->
    <form action="BookAppointmentServlet" method="post">
        <label>Date:</label><br>
        <input type="date" name="date" required><br><br>

        <label>Time:</label><br>
        <input type="time" name="time" required><br><br>

        <label>Reason for Appointment:</label><br>
        <textarea name="reason" rows="4" placeholder="E.g., counseling, stress management, study help" required></textarea><br><br>

        <button type="submit">Book Appointment</button>
    </form>
</main>

<footer>
    &copy; 2025 Belgium Campus Student Wellness |
    <a href="https://www.belgiumcampus.ac.za/">Visit Belgium Campus</a> |
    <a href="https://www.belgiumcampus.ac.za/courses/">Courses</a>
</footer>

</body>
</html>