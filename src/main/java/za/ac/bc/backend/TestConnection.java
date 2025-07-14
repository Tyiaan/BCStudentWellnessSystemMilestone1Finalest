package za.ac.bc.backend;

import java.sql.Connection;

public class TestConnection {
    public static void main(String[] args) {
        try {
            Connection conn = DBConnector.connect();
            System.out.println("✅ Connection successful!");
            conn.close();
        } catch (Exception e) {
            System.out.println("❌ Connection failed: " + e.getMessage());
        }
    }
}
