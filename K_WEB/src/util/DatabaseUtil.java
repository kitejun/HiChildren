package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtil {
//db와 연동...

	public static Connection getConnection() {
		try {
			//String dbURL = "jdbc:mysql://localhost/jspdb?useSSL=false&serverTimezone=UTC";
			String dbURL="jdbc:mysql://localhost:3306/lectureEvaluation?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "ki5786";
			Class.forName("com.mysql.jdbc.Driver");
			
			return DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
