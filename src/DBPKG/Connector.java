package DBPKG;

import java.sql.Connection;
import java.sql.DriverManager;

public class Connector {
	
	public static Connection getConnection() throws Exception{ //throws�뿉 exception �쟻�쑝硫� �빐�떦 吏��뿭�뿉 �엳�뒗 紐⑤뱺 exception�쓣 媛숈씠 �옟�븘以�
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe","system","1234");
		return con;
	}
}
