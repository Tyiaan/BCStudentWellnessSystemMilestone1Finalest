package za.ac.bc.backend;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnector {
    public static Connection connect() throws Exception {
        String url = "jdbc:postgresql://localhost:5432/WellnessDB";
        String user = "postgres";
        String password = System.getenv("PGPASSWORD");  // Secure password placeholder

        if (password == null) {
            throw new RuntimeException("Environment variable PGPASSWORD is not set.");
        }

        Class.forName("org.postgresql.Driver");
        return DriverManager.getConnection(url, user, password);
    }
}
