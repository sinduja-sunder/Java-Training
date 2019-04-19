import java.util.Scanner;
public class MysqlCon {
	 public static void main(String[] args) {
		 
		 System.out.println("Are you Human? (Y|N)");
		 Scanner in=new Scanner(System.in);
		 char c = in.next().charAt(0);
	     try {
	     if(c=='N') 
				 throw new MyException("You are not allowed to access this!");
	     
	     
		 Department D=new Department();
		 Employee E=new Employee();
		 skills S=new skills();		 
		 D.trial();
		 D.Dep();
		 E.trial();
		 E.Emp();
		 S.trial();
		 S.ski();
	     }catch(Exception e) {
	    	 System.out.println(e);
	     }
		 		 
		 }
	 }
