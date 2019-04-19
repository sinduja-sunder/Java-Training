
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

public class Employee extends Trial {
	
	void Emp() {
	 try
	 {
		
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
	 finally{
		 System.out.println("Exiting the database\n");
	 }
	 }
}
