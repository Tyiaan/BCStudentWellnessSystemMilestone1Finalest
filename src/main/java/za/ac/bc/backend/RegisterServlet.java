package za.ac.bc.backend;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String student_number = request.getParameter("student_number");
        String surname = request.getParameter("surname");

         // 1. Validate inputs
        if (name == null || surname == null || email == null || username == null || password == null || student_number == null ||
            name.isEmpty() || surname.isEmpty() || email.isEmpty() || username.isEmpty() || password.isEmpty() || student_number.isEmpty()) {
            response.sendRedirect("register.jsp?error=Please+fill+in+all+fields");
            return;
        }
        // 2. Validate email format
        if (!email.matches("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
            response.sendRedirect("register.jsp?error=Invalid+email+format");
            return;
        }

        // 3. Validate password strength
        if (password.length() < 8 || !password.matches(".*\\d.*") || !password.matches(".*[A-Z].*")) {
            response.sendRedirect("register.jsp?error=Password+must+be+8+chars+long,+contain+a+number+and+uppercase");
            return;
        }

        try (Connection conn = DBConnector.connect()) {

            // Check if user exists (by email or username or student number)
            String checkSql = "SELECT 1 FROM users WHERE email = ? OR username = ? OR student_number = ?";
            PreparedStatement checkStmt = conn.prepareStatement(checkSql);
            checkStmt.setString(1, email);
            checkStmt.setString(2, username);
            checkStmt.setString(3, student_number);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                response.sendRedirect("register.jsp?error=User+already+exists");
                return;
            }

            // Hash the password
            String hashedPassword = PasswordUtil.hashPassword(password);

            // Insert new user
            String sql = "INSERT INTO public.users (student_number, name, surname, email, username, password_hash) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, student_number);
            ps.setString(2, name);
            ps.setString(3, surname);
            ps.setString(4, email);
            ps.setString(5, username);
            ps.setString(6, hashedPassword);

            ps.executeUpdate();
            System.out.println("User registered!");

            response.sendRedirect("login.jsp?success=true");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("register.jsp?error=Registration+failed");
        }
    }
}
