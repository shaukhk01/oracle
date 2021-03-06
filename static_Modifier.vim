                                 +--------------------+
                                 |  Static Modifier   |
                                 +--------------------+

static keyw is modifier applicable for method and variables But not for classes we can't declare top level 
class with static modifier But we can declare inner class as static within bracket such type of inner classare called static nested classes.

In the case of instance variables for every object a seprate copy will created but in the case of static 
variable a single copy will be created at class level  and shared by every object of that class.

Example:-
--------

class Test
{
    static int i = 10;
    int y = 20;
    public static void main(String[]args)
    {
        Test t1 = new Test();
             t1.x = 888;
             t1.y = 999;
        Test t2 = new Test();
             System.out.println(t2.x+"-----"+t2.y)==>888.20;
     }                                                |
                                                      |
     }                                                 +--Because of static variable only one copy for ever                                                         -y object.-


We can't access instance member directly from static area but we can access from instance area directly,
We can access static members from both instance and static area directly.

Consider the following declaration.

1:int x = 10;
2:static int x = 10;

3:public void m1()
    {
    Sop(x);
    }

4:public static void m1()
{
    Sop(x);
};


Within the same class which of the above declaration we can take simultaneously 

    1 and 3 allowed
    2 and 3 allowed
                        +---------------------------------------------------------------------+
    1 and 4 not allowed |Error:non static variable cannot be references from  a static method |
    2 and 4 allwed      +---------------------------------------------------------------------+
                         +--------------------------------------------+
    1 and 2 invalied     |Error:variable x is already define in Test  |
                         +--------------------------------------------+
                    +--------------------------------------+
    3 and 4 invalid |Error:m1() is already defined in Test |
                    +--------------------------------------+

note1:
Overloading concept applilcable for static method including main method But JVM always call String[]arg main method only 

Example:-
--------

class Test
{
    public static void main(String[]args)
    {
        System.out.println("String[]");
   }
public static void m1()
{
    System.out.println("i+[]");
}
}

other overloaded method we have to call just like a normal method call 

note2:

Inheritance concept applicable for static method including main method hence while executing child class
if child dosen't contain main method then parent class main method will be executed. 

Example:-
--------
class P
{
    public static void main(String[]args)
{
    System.out.println("Parent main");
}
}
class C extends P
{

                                $>javac      P.java
}                                  |
                                   +--+-----------|
                                      |           |
                                  P.class     C.class 

$>java P==>parent main
$>java C==>Parent main


note3:
    class P
{
    public static void main(String[]args)<---------------+
{                                                        |
    System.out.println("Parent main");                   |
}                                                        |
}                                                        | ----->it is method hidding but not overriding. 
class C extends P                                        |
{                                                        |
    public static void main(String[]args)<---------------+
{
    super("child main");
}
}

$>javac P.java
$>java P==>Parent main

$>javac C.java
$>java C==>child main

It seems overriding concept applicable for static method but it is not overriding and it is method hidding

note:
For static method overloading and inheritance concept are applicalbe but overriding concept are not applica-ble but instead of overriding method hidding concept is applicable. 

Inside method implementation if we are using at least one instance variable then that method talks about a 
particular object hence we should declare method as instannce method

Inside method implemenation if we are not using any instance variable then this method no ware related to 
particular object hence we have to declare such type of method as static method irrespective of weather we
are using static variable or not 

Example:-

class Student
{
    String name;
    int rollno;
    int marks;
    static String cname;
   +-----------------------+
   |getStudentInfo()       |
   |{                      | --->instance method 
   |return name+----+marks;|
   +-----------------------+
  +----------------------+
  | getCollegeInfo()     |
  | {                    |
  |     return cname;    |  --->static method 
  |     }                |
  +-------------------------+
  | getAverage()            |
  | {                       |
  |     return x+y/2;       |  --->static method
  |     }                   |
  +-------------------------------------------------------+
  | getCompleteInfo()                                     |
  | {                                                     | --->instance method 
  |     return name+"----"+rollno+---"+marks+---"+cname;  |
  +-------------------------------------------------------+

For static method implementation should be available where as for abstract method implementation is not 
available hence abstract static combination is illegal for method.


SYNCHRONIZED MODIFIER:-
======================

synchronized is  the modifier applicable for method and block's but not for classes and variable.

If multiple thread trying to operate simultaneously on the same java object then there may be chance of ,
data inconsistance problem this is called race condition
we can overcome this problem by using synchronized keyword

If a method or block declare as synoronized then at a time only one thread is allowed to execute that method or block on the given object so that data inconsistance problem will be resolved.

But main disadvantage syncronized keyword is it increaseing waiting time of thread and create performance,
problem hence if there no spacific requirment then it is not recommended to use syncronized .

syncronized method should compulsory contain implementation where as abstract method  dosen't contain any,
implementation hence abstract syncronized is illegal combination of modifiers for methods.


