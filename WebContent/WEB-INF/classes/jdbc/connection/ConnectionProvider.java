package jdbc.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import jdbc.JdbcUtil;

public class ConnectionProvider {

    public static Connection getConnection() throws SQLException {
    	
    	String DB_URL = "jdbc:mysql://127.0.0.1:3306/myguitar?verifyServerCertificate=false&useSSL=true";
    	String USER = "root";
    	String PASSWORD = "940131";
    	
        return DriverManager.getConnection(
                DB_URL, USER,PASSWORD);
    }
}
