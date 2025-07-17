package za.ac.bc.backend;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/CancelAppointmentServlet")
public class CancelAppointmentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("studentNumber") == null) {
            response.sendRedirect("login.jsp?error=Please+log+in");
            return;
        }

        String studentNumber = (String) session.getAttribute("studentNumber");
        String idStr = request.getParameter("id");

        if (idStr == null || idStr.isEmpty()) {
            response.sendRedirect("myAppointments.jsp?error=Missing+appointment+ID");
            return;
        }

        try (Connection conn = DBConnector.connect()) {
            String sql = "DELETE FROM appointments WHERE id = ? AND student_number = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, Integer.parseInt(idStr));
            stmt.setString(2, studentNumber);
            int rows = stmt.executeUpdate();

            if (rows > 0) {
                response.sendRedirect("myAppointments.jsp?success=Appointment+cancelled");
            } else {
                response.sendRedirect("myAppointments.jsp?error=Could+not+cancel+appointment");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("myAppointments.jsp?error=Server+error");
        }
    }
}
