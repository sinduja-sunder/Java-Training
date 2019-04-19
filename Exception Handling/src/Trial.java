import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

abstract class Trial {

	Statement st=null;
	Connection con=null;
	void trial() {
		 try
		 {
			 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			 con = DriverManager.getConnection("jdbc:sqlserver://IMCHLT061\\SQLEXPRESS;username=root;password=password123;");
			 st = con.createStatement();
		 }catch(Exception e) {
			 System.out.println(e);
		 }
		 finally{
			System.out.println("Entering the Database\n");
		 }
	};
}