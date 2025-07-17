package za.ac.bc.backend;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;

@WebServlet("/BookAppointmentServlet")
public class BookAppointmentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("studentNumber") == null) {
            response.sendRedirect("login.jsp?error=Please+log+in+first");
            return;
        }

        String studentNumber = (String) session.getAttribute("studentNumber");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String reason = request.getParameter("reason");

        try (Connection conn = DBConnector.connect()) {
            String sql = "INSERT INTO appointments (student_number, date, time, reason) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, studentNumber);
            stmt.setDate(2, Date.valueOf(date));
            stmt.setTime(3, Time.valueOf(time+":00"));
            stmt.setString(4, reason);
            stmt.executeUpdate();

            response.sendRedirect("dashboard.jsp?success=Appointment+booked+successfully");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("bookAppointment.jsp?error=Booking+failed");
        }
    }
}