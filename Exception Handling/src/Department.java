
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

public class Department extends Trial{
	
	public void Dep() {
		
		
		 try
		 {
			 
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
		 }finally{
			 System.out.println("Exiting the database\n");
		 }

}}
