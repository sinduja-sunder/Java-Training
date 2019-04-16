public class Dep2 implements Empl{
	public void Hike_Calc(int Salary, int Standard_Value) {
	int Added_Value=6;
	int allowances=8000;
	double amount;
	amount=Standard_Value+Added_Value;
	double total= amount/100*Salary;
	double Total_Amount=Salary+total;
	System.out.println("The hike after added value of "+Added_Value+ " is "+(Total_Amount+allowances));
}
	public static void main(String[] args) {
		Empl E1=new Dep1();
		Empl E2=new Dep2();
		E1.Hike_Calc(350000,5);
		E2.Hike_Calc(450000,6);
	}
}