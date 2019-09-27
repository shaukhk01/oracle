class Bike
{
    String Engine_Displ;
    String Fuel_Type;
    String Head_Lamp;
    String Tyre_Type;
    String Gear_Box;
    String Mileage;
    String Power;
    Bike(String Engine_Displ,String Fuel_Type,String Head_Lamp,String Tyre_Type,String Mile,String Gear,String Pow)
    {
    this.Engine_Displ  = Engine_Displ;
    this.Fuel_Type     = Fuel_Type;
    this.Head_Lamp     = Head_Lamp;
    this.Tyre_Type     = Tyre_Type;
    Mileage       = Mile;
    Gear_Box      = Gear;
    Power         = Pow;
    }
    
}
class Emp extends Bike
{
    int empno;
    String ename;
    String job;
    int deptno;
    Emp(String Engine_Displ,String Fuel_Type,String Head_Lamp,String Tyre_Type,String Mile,String Gear,String Pow,int empno,String ename,String job,int deptno)
    {
        super(Engine_Displ,Fuel_Type,Head_Lamp,Tyre_Type,Mile,Gear,Pow);
        this.empno = empno;
        this.ename = ename;
        this.job   = job;
        this.deptno= deptno;
    }
    void disp()
    {empinfo();
    System.out.println("Specification Of Bike");
    System.out.println("------------------------------------");
    System.out.println("Engine_Displ"+"            :"+Engine_Displ);
    System.out.println("Fuel_Type               :"+Fuel_Type);
    System.out.println("Head_Lamp               :"+Head_Lamp);
    System.out.println("Tyre_Type               :"+Tyre_Type);
    System.out.println("Gear_Box                :"+Gear_Box);
    System.out.println("Mileage                 :"+Mileage);
    System.out.println("Power                   :"+Power);

    }
    void empinfo()
    {
    System.out.println();
    System.out.println("Employee Details");
    System.out.println("------------------------------------");
    System.out.println("Employee Empno          :"+empno);
    System.out.println("Employee Name           :"+ename);
    System.out.println("Employee Job            :"+job);
    System.out.println("Employee Deptno         :"+deptno);
    System.out.println();
    }
    public static void main(String[]args)
    {
    
        Emp o = new Emp("346 cc","Petrol","NA","Tubeless","NA","5-Speed","NA",24312,"Annie","Oracle",10);
        o.disp();
}
}
/*class Test
{
public static void main(String[]args)
    {
        o.disp();

    }
}*/

