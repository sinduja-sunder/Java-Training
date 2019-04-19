import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;

public class skills {
	
	 void ski() {
	 
		 try
		 {
			 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			 Connection con = DriverManager.getConnection("jdbc:sqlserver://IMCHLT061\\SQLEXPRESS;username=root;password=password123;");
			 Statement st = con.createStatement(); 

			 ResultSet rs3 = st.executeQuery("USE EmployeeManagement; SELECT * FROM SKILLS;");
			 ResultSetMetaData rsmd3 = rs3.getMetaData();
			 System.out.println(rsmd3.getColumnName(1)+" "+rsmd3.getColumnName(2)+" "+rsmd3.getColumnName(3)+" "+rsmd3.getColumnName(4));
			 while(rs3.next()){
	 
				 System.out.println(rs3.getInt(1)+ " "+rs3.getString(2)+" "+rs3.getString(3)+" "+rs3.getString(4));
				 System.out.println();
				} 
		 }
		 catch(Exception e){
			 System.out.println(e);
		 }
	 
    }
}
