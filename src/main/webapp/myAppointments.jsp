<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*, za.ac.bc.backend.DBConnector" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    String studentName = (String) session.getAttribute("studentName");
    String studentNumber = (String) session.getAttribute("studentNumber");

    if (studentName == null || studentNumber == null) {
        response.sendRedirect("login.jsp?error=Please+log+in");
        return;
    }

    String error = request.getParameter("error");
    String success = request.getParameter("success");
%>

<!DOCTYPE html>
<html>
<head>
    <title>My Appointments</title>
    <link rel="stylesheet" href="CSS/style.css">
    <style>
        main {
            padding: 20px;
        }

        table {
            width: 80%;
            border-collapse: collapse;
            margin: 20px auto;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #2c3e50;
            color: white;
        }

        tr:hover {
            background-color: #f9f9f9;
        }

        .message {
            text-align: center;
            font-weight: bold;
            margin: 15px;
        }

        .error { color: red; }
        .success { color: green; }

        button {
            padding: 5px 10px;
            background-color: #c0392b;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #e74c3c;
        }
    </style>
</head>
<body>

<header>
    <div class="logo">
        <img src="images/BelgiumCampusLogo.jpg" alt="Belgium Campus Logo" height="40">
        Belgium Campus
    </div>
    <nav>
        <a href="dashboard.jsp">Dashboard</a>
        <a href="bookAppointment.jsp">Book Appointment</a>
        <a href="logout">Logout</a>
    </nav>
</header>

<main>
    <h1>My Booked Appointments</h1>
    <p>Hi, <%= studentName %>! Below is a list of your upcoming wellness appointments.</p>

    <% if (error != null) { %>
        <div class="message error"><%= error %></div>
    <% } else if (success != null) { %>
        <div class="message success"><%= success %></div>
    <% } %>

    <table>
        <tr>
            <th>Date</th>
            <th>Time</th>
            <th>Reason</th>
            <th>Action</th>
        </tr>

        <%
            try (Connection conn = DBConnector.connect()) {
                String sql = "SELECT id, date, time, reason FROM appointments WHERE student_number = ? ORDER BY date, time";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, studentNumber);
                ResultSet rs = stmt.executeQuery();

                boolean hasResults = false;
                while (rs.next()) {
                    hasResults = true;
                    int apptId = rs.getInt("id");
                    String apptDate = rs.getDate("date").toString();
                    String apptTime = rs.getTime("time").toString();
                    String reason = rs.getString("reason");
        %>
        <tr>
            <td><%= apptDate %></td>
            <td><%= apptTime %></td>
            <td><%= reason %></td>
            <td>
                <form action="CancelAppointmentServlet" method="post" style="display:inline;">
                    <input type="hidden" name="id" value="<%= apptId %>">
                    <button type="submit" onclick="return confirm('Are you sure you want to cancel this appointment?')">
                        Cancel
                    </button>
                </form>
            </td>
        </tr>
        <%
                }

                if (!hasResults) {
        %>
        <tr>
            <td colspan="4" style="text-align:center;">You have no appointments yet.</td>
        </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
        %>
        <tr>
            <td colspan="4" class="error">Error loading appointments. Please try again later.</td>
        </tr>
        <%
            }
        %>
    </table>
</main>

<footer>
    &copy; 2025 Belgium Campus Student Wellness |
    <a href="https://www.belgiumcampus.ac.za/">Visit Belgium Campus</a>
</footer>

</body>
</html>
