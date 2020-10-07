package DBPKG;

import java.sql.Connection;
import java.sql.DriverManager;

public class Connector {
	
	public static Connection getConnection() throws Exception{ //throws에 exception 적으면 해당 지역에 있는 모든 exception을 같이 잡아줌
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe","system","1234");
		return con;
	}

}
