public class Dep1 implements Empl{
	public void Hike_Calc(int Salary, int Standard_Value) {
		int Added_Value=5;
		double amount;
		amount=Standard_Value+Added_Value;
		double total= amount/100*Salary;
		double Total_Amount=Salary+total;
		System.out.println("The hike after added value of "+Added_Value+ " is "+Total_Amount);
	}
}
