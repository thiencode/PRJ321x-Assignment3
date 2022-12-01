package context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {
	
	public Connection getConnection() throws ClassNotFoundException, SQLException {
		String url = "jdbc:sqlserver://" + serverName + ":" + portNumber + "\\" + instance + ";databaseName=" + dbName;
        if (instance == null || instance.trim().isEmpty()) {
            url = "jdbc:sqlserver://" + serverName + ":" + portNumber + ";databaseName=" + dbName;
        }
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url, userID, password);
	}
	
	private final String serverName = "localhost";
	private final String portNumber = "1433";
    private final String dbName = "ShoppingDB";
	private final String userID  = "sa";
	private final String password = "123456";
	private final String instance = ""; //leave this one empty if your SQL is single instance
}
