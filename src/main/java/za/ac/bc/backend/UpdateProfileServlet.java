package za.ac.bc.backend;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("studentNumber") == null) {
            response.sendRedirect("login.jsp?error=Please+log+in");
            return;
        }

        String studentNumber = (String) session.getAttribute("studentNumber");
        String newSNum = request.getParameter("student_number");
        String newEmail = request.getParameter("email");

        // Basic validation
        if (newEmail == null || newSNum == null || newEmail.isEmpty() || newSNum.isEmpty()) {
            response.sendRedirect("updateProfile.jsp?error=All+fields+required");
            return;
        }

        try (Connection conn = DBConnector.connect()) {
            String sql = "UPDATE users SET student_number = ?, email = ? WHERE student_number = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, newSNum);
            ps.setString(2, newEmail);
            ps.setString(3, studentNumber);

            int rows = ps.executeUpdate();
            if (rows > 0) {
                response.sendRedirect("dashboard.jsp?success=Profile+updated");
            } else {
                response.sendRedirect("updateProfile.jsp?error=Update+failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("updateProfile.jsp?error=Server+error");
        }
    }
}
