
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;


public class skills extends Trial {
	
	 void ski() {
	 
		 try
		 {
			 

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
		 }finally{
			 System.out.println("Exiting the database\n");
		 }
	 
    }
}
