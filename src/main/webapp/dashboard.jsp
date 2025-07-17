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
    <!-- Header with logo and nav -->
    <header>
        <div class="logo">
            <img src="images/BelgiumCampusLogo.jpg" alt="Belgium Campus Logo" height="40">
            Belgium Campus
        </div>
        <nav>
            <a href="index.jsp">Home</a>
            <a href="dashboard.jsp">Dashboard</a>
            <a href="logout">Logout</a>
        </nav>
    </header>

    <!-- Main dashboard area -->
    <main>
        <h1>Welcome, <%= studentName %>!</h1>

        <p>Welcome to your personalized student wellness dashboard.
        Here you can manage your wellbeing, book sessions, view your upcoming appointments, and access resources to help you stay balanced during your studies.</p>

        <!-- Action buttons area -->
        <div class="button-group">
            <form action="bookAppointment.jsp" method="get" style="display:inline;">
                <button type="submit">Book Wellness Appointment</button>
            </form>

            <form action="myAppointments.jsp" method="get" style="display:inline;">
                <button type="submit">View My Appointments</button>
            </form>

            <a href="resources.jsp" class="button">Wellness Resources</a>

            <a href="updateProfile.jsp" class="button">Update My Profile</a>

            <!-- Logout is included here for clarity -->
            <form action="logout" method="post" style="display:inline;">
                <button type="submit">Logout</button>
            </form>
        </div>

        <p style="margin-top: 40px;">
            Take your time to explore these options.
            Your health and peace of mind are just as important as your academic success!
        </p>
    </main>

    <!-- Footer -->
    <footer>
        &copy; 2025 Belgium Campus Student Wellness |
        <a href="https://www.belgiumcampus.ac.za/">Visit Belgium Campus</a> |
        <a href="https://www.belgiumcampus.ac.za/courses/">Courses</a> |
        <a href="https://www.belgiumcampus.ac.za/contact/">Contact</a>
    </footer>
</body>
</html>