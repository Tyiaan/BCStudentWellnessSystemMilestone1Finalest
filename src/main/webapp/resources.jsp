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
    <title>Wellness Resources</title>
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
    <h1>Student Wellness Resources</h1>
    <p>Hi, <%= studentName %>! Here are some helpful resources to support your wellness and studies at Belgium Campus.</p>

    <ul>
        <li><a href="https://www.belgiumcampus.ac.za/student-support/">Student Support Services</a></li>
        <li><a href="https://www.belgiumcampus.ac.za/contact/">Contact an Advisor</a></li>
        <li><a href="https://www.belgiumcampus.ac.za/blog/">Wellness Blog & Tips</a></li>
        <li><a href="https://www.belgiumcampus.ac.za/courses/">Available Courses</a></li>
    </ul>

    <p>Stay informed, stay healthy, and don’t hesitate to reach out when you need help!</p>
</main>

<footer>
    &copy; 2025 Belgium Campus Student Wellness |
    <a href="https://www.belgiumcampus.ac.za/">Visit Belgium Campus</a>
</footer>

</body>
</html>