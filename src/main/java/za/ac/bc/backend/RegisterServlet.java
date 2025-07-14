package za.ac.bc.backend;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet{

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String studentNumber = request.getParameter("student_number");
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        // Basic Validation
        if (studentNumber.isEmpty() || name.isEmpty() || surname.isEmpty() ||
                email.isEmpty() || phone.isEmpty() || password.isEmpty()) {
            request.setAttribute("error", "All fields are required.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        String hashedPassword = PasswordUtil.hashPassword(password);

        try (Connection conn = DBConnector.connect()) {
            // Check if email already exists
            PreparedStatement checkStmt = conn.prepareStatement("SELECT email FROM users WHERE email = ?");
            checkStmt.setString(1, email);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                request.setAttribute("error", "Email already exists.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            // Insert user
            PreparedStatement stmt = conn.prepareStatement(
                    "INSERT INTO users (student_number, name, surname, email, phone, password) VALUES (?, ?, ?, ?, ?, ?)");
            stmt.setString(1, studentNumber);
            stmt.setString(2, name);
            stmt.setString(3, surname);
            stmt.setString(4, email);
            stmt.setString(5, phone);
            stmt.setString(6, hashedPassword);

            stmt.executeUpdate();

            request.setAttribute("message", "Registration successful!");
            request.getRequestDispatcher("login.jsp").forward(request, response);

        } catch (Exception e) {
            throw new ServletException("Database error: " + e.getMessage());
        }
    }
}
