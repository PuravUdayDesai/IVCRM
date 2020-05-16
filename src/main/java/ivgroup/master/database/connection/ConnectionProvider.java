package ivgroup.master.database.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {
	private static Connection c;
	public static Connection getConnection() throws ClassNotFoundException, SQLException
	{
		
		Class.forName("org.postgresql.Driver");
		c = DriverManager.getConnection("jdbc:postgresql://<AUTO-BLANK>:5432/<AUTO-BLANK>", "<AUTO-BLANK>", "<AUTO-BLANK>");
		c.setAutoCommit(false);
		return c;
	}

}
