<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
    <h2>Student Login</h2>

    <% if (request.getAttribute("error") != null) { %>
        <p style="color:red;"><%= request.getAttribute("error") %></p>
    <% } %>

    <form method="post" action="login">
        Email: <input type="email" name="email" required /><br>
        Password: <input type="password" name="password" required /><br><br>
        <input type="submit" value="Login" />
    </form>

    <p>Don't have an account? <a href="register.jsp">Register here</a></p>
</body>
</html>
