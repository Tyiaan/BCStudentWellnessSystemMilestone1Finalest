package za.ac.bc.backend;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // ✅ Basic validation
        if (email == null || password == null || email.isEmpty() || password.isEmpty()) {
            response.sendRedirect("login.jsp?error=Please+enter+both+email+and+password");
            return;
        }

        try (Connection conn = DBConnector.connect()) {
            String sql = "SELECT * FROM users WHERE email = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String hashedPassword = rs.getString("password_hash");

                if (hashedPassword.equals(PasswordUtil.hashPassword(password))) {
                    // ✅ Create a session
                    HttpSession session = request.getSession();
                    session.setAttribute("studentName", rs.getString("name"));
                    session.setAttribute("studentNumber", rs.getString("student_number"));
                    session.setAttribute("email", rs.getString("email"));

                    // ✅ Redirect to dashboard
                    response.sendRedirect("dashboard.jsp");
                    return;
                }
            }

            // ❌ Login failed
            response.sendRedirect("login.jsp?error=Invalid+email+or+password");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=Login+failed");
        }
    }
}
