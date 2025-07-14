package za.ac.bc.backend;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String hashedPassword = PasswordUtil.hashPassword(password);

        try (Connection conn = DBConnector.connect()) {
            PreparedStatement stmt = conn.prepareStatement(
                    "SELECT name, student_number FROM users WHERE email = ? AND password = ?");
            stmt.setString(1, email);
            stmt.setString(2, hashedPassword);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("name", rs.getString("name"));
                session.setAttribute("student_number", rs.getString("student_number"));
                response.sendRedirect("dashboard.jsp");
            } else {
                request.setAttribute("error", "Invalid credentials.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

        } catch (Exception e) {
            throw new ServletException("Login error: " + e.getMessage());
        }
    }
}
