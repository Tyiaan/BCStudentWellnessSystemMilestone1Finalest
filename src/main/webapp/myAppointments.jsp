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
    <title>My Appointments</title>
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
    <h1>My Booked Appointments</h1>
    <p>Hi, <%= studentName %>! Here you’ll find a list of your upcoming wellness appointments.</p>

    <!-- Example placeholder: you’ll replace this later with real data -->
    <ul>
        <li>📅 <strong>25 July 2025</strong> at 10:00 AM — Counseling Session</li>
        <li>📅 <strong>01 August 2025</strong> at 2:30 PM — Stress Management</li>
    </ul>

    <p>Need to make changes? Please contact student support or cancel through your advisor.</p>
</main>

<footer>
    &copy; 2025 Belgium Campus Student Wellness |
    <a href="https://www.belgiumcampus.ac.za/">Visit Belgium Campus</a>
</footer>
</body>
</html>