package Util;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;

public class JDBCUtil {

	private static String jdbcURL = "jdbc:mysql://localhost:3306/qldvsv";
    private static String jdbcUsername = "root";
    private static String jdbcPassword = "123456";

    public static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }

	public static void closeConnection(Connection conn) {
		try {
			if (conn != null) {
				System.out.println("Connection close");
				conn.close();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void main() {
		System.out.println(" aaaa!");
		Connection a= getConnection();
		System.out.println(" cfcfcccf!");
		
	}
	public static Date getSQLDate(LocalDate date) {
        return java.sql.Date.valueOf(date);
    }

    public static LocalDate getUtilDate(Date sqlDate) {
        return sqlDate.toLocalDate();
    }
    
    public static Timestamp getSQLTimestamp(LocalDateTime dateTime) {
        return Timestamp.valueOf(dateTime);
    }

    public static LocalDateTime getUtilDateTime(Timestamp sqlTimestamp) {
        return sqlTimestamp.toLocalDateTime();
    }
}