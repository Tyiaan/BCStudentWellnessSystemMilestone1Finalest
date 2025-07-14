<%@ page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("name") == null) {
        response.sendRedirect("login.jsp");
    }
%>

<h2>Welcome, <%= session.getAttribute("name") %>!</h2>
<a href="logout.jsp">Logout</a>