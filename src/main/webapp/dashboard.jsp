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
    <title>Dashboard</title>
    <link rel="stylesheet" href="CSS/style.css">
</head>
<body>
    <h2>Welcome, <%= studentName %>!</h2>

    <form action="logout" method="post">
        <button type="submit">Logout</button>
    </form>
</body>
</html>
