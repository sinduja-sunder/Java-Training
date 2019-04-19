import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;

public class Department {
	
	public void Dep() {
		
		
		 try
		 {
			 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			 Connection con = DriverManager.getConnection("jdbc:sqlserver://IMCHLT061\\SQLEXPRESS;username=root;password=password123;");
			 Statement st = con.createStatement(); 
			 ResultSet rs2 = st.executeQuery("USE EmployeeManagement; SELECT * FROM DEPARTMENT;");
			 ResultSetMetaData rsmd2 = rs2.getMetaData();
			 System.out.println(rsmd2.getColumnName(1)+" "+rsmd2.getColumnName(2)+" "+rsmd2.getColumnName(3));
			 while(rs2.next()){
				 
				 System.out.println(rs2.getInt(1)+ " "+rs2.getString(2)+" "+rs2.getString(3));
				 System.out.println();
			 }
				
	
			 } 
		 catch(Exception e){
			 System.out.println(e);
		 }

}}
