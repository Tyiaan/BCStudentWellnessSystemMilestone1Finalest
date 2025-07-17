<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    // Get the existing session, do not create a new one
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
    <title>Student Dashboard</title>
    <link rel="stylesheet" href="CSS/style.css">
</head>
<body>
<<<<<<< HEAD
    <header>
        <div class="logo">
            <img src="images/BelgiumCampusLogo.jpg" alt="Belgium Campus Logo">
            Belgium Campus
        </div>
        <nav>
            <a href="index.jsp">Home</a>
            <a href="dashboard.jsp">Dashboard</a>
            <a href="logout">Logout</a>
        </nav>
    </header>

    <main>
        <h1>Welcome, <%= studentName %>!</h1>
        <p>This is your personal wellness dashboard. Here you can manage your wellness activities, view upcoming appointments, and stay informed about resources Belgium Campus provides to support your student life.</p>

        <p>We’re committed to helping you balance your studies and wellbeing. Explore your options, reach out for help when you need it, and take care of yourself — you deserve it!</p>
    </main>

    <footer>
        &copy; 2025 Belgium Campus Student Wellness | 
        <a href="https://www.belgiumcampus.ac.za/">Visit Belgium Campus</a> |
        <a href="https://www.belgiumcampus.ac.za/courses/">Courses</a> |
        <a href="https://www.belgiumcampus.ac.za/contact/">Contact</a>
    </footer>
=======
    <h2>Welcome, <%= studentName %>!</h2>

    <form action="logout" method="post">
        <button type="submit">Logout</button>
    </form>

</body>
</html>
