import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;

public class Employee {
	
	void Emp() {
	 try
	 {
		 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		 Connection con = DriverManager.getConnection("jdbc:sqlserver://IMCHLT061\\SQLEXPRESS;username=root;password=password123;");
		 Statement st = con.createStatement(); 
		 ResultSet rs1 = st.executeQuery("USE EmployeeManagement; SELECT * FROM EMPLOYEE;");
		 ResultSetMetaData rsmd1 = rs1.getMetaData();
		 System.out.println(rsmd1.getColumnName(1)+" "+rsmd1.getColumnName(2)+" "+rsmd1.getColumnName(3)+" "+rsmd1.getColumnName(4)+" "+rsmd1.getColumnName(5)+" "+rsmd1.getColumnName(6)+" "+rsmd1.getColumnName(7));
		 while(rs1.next()){
			 
			 System.out.println(rs1.getInt(1)+ " "+rs1.getString(2)+" "+rs1.getString(3)+" "+rs1.getInt(4)+" "+rs1.getFloat(5)+" "+rs1.getInt(6)+" "+rs1.getInt(7));
			 System.out.println();
		}
	 }
	 catch(Exception e){
		 System.out.println(e);
	     }
	 }
}
