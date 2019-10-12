                                                Types Of Variable
                                                =================
Division1:

Based on type of value represented by a variable  all variable divided into two types.

1:primitive variable:
====================
Can be used to represent primitive values
Example:-
--------
        int x = 10;
2:Reference variable:-
====================                    *******   
Can be used to refer object           **       ** 
Example:-        +--------------------*         * 
--------         |                    **       ** 
        Student s = new Student();      *******   

Based on position of declaration and behavior all variable divided into 3 types.

1:instance variable
2:static variable
3:local variable

instance variable:-
=================
1:If the value of variable is the varid from object to object such type of variable are called instance variables.
2:For every object a seprate copy of instance variable will be created 

3:instance should be declare within the class directly but outside of any method or block or constructor.

4:instance variable will be created and the time of object creation and destoryed at the time of object distraction
hence the scope of instance variable is a exactly same as the scope of object.

5:instance variable will be stored in the heap memory as a part of object. 

6:We cant access instance variable directly from static area but we can access by using object reference.

7:But we can access instance variable directly from instance area.
Example:-
--------
         class Test
         {
            int x = 10;
            public static void main(String[]args)
            {
                System.out.println(x);---->CE:non static variabe x canot be reference from a static context
            Test t = new Test()
            System.out.println(t.x);-->10;
            }
          public void m1()
          {
          System.out.println(x)--10;
            }
          }

For instance variable JVM will always provide default value and we are not required to perform intialization expilict--y.
Example:-
--------
        class Test
        {
            int x;
            double d;
            boolean b;
            String s;
            public static void main(String[]args)
            {
                Test t1 = new Test();
                System.out.println(t1.x);-->0
                System.out.println(t1.d);-->0.0
                System.out.println(t1.b);-->false
                System.out.println(t1.s);-->null
                }
            }
instance variable also known as object level variables or attributes.

static variable:-
================
1:If the value of variable is not varied from object to object then it is not recomended to declare variable as
instance variable we have declare such type of variable at class level by using static modifier. 

2:In the case on instance variable for every object a seprate copy will be created but in the case of static variable
a single copy will be created at class level and shared by Every Object of the class. 

3:static variable should be declared within the class directly but outside of any method or block or constructor.

4:static variable will be created at the time of class loading and destoried at the time of class unloading 
hence scope of static variable is exactly same as scope of .class file.

                                java Test.java
                                -------------

                                1:start jvm

                                2:create and start main Thread

           +----------------+   3:locate Test.class file
           |static variable |
           |   creation ----|-->4:load Test.class 
           +----------------+
                                5:Execute main() method
          +-----------------+
          | static variable |-->6:unload Test.class
          |     destruction |
          +-----------------+   7:Terminate main Thread

                                8:Shutdown jvm

==>static variable will be stored in method area.
==>we can access static variable either by object reference or by class name but recommended to use class name.
==>within the same class it is not required to used class name and we can access directly.

Example:-
--------
        class Test
        {
            static int x =10;
            public static void main(String[]args)
            {
                Test t = new Test();
                System.out.println(t.x);
                System.out.println(Test.x);
                System.out.println(x);
            }
        }
==>we can access static variable directly from both instance and static area.
Example:-
--------
        class Test
        {
            static int x = 10;
            public static void main(String[]args)
            {
                System.out.println(x);
            }
        public void m1()
        {
            System.out.println(x);
        }
    }
==>for static variable JVM will provide default value and we are not required to perform intialization expilictly.

Example:-
--------
        class Test
    {   
        static int x;
        static double d;
        static String s;
        public static void main(String[]args)
        {
            System.out.println(x);0
            System.out.println(d);0.0
            System.out.println(s);null
        }
    }
==>static variable also known as class level variable or Fields.
Example:-
--------
        class Test
        {
            static int x = 10;
            int y = 20;
        public static void main(String[]args)
        {
            test t1 = new Test();
            t1.x = 888;
            t1.y = 999;
            Test t2 = new Test();

            System.out.println(t2.x+"    "+t2.y);---->888       20
            }
        }

Local Variable:-
===============
1:Some times to  meet temporaries requirement of the prograrmmer we can declare variables inside a
 method or block or constructor such type of variable are called local variable/Temporary variable/
 stack variable/Automatic variable
2:Local variable will be stored inside stack memory.

3:local variable will be created while executing the block in which we declared it once block 
 execution complete automatically local variable destoried hence the scope of local variable is
 the block in which we declare it
Example:-
--------
        class Test
        {
            public static void main(String[]args)
            {
                int i=0;
                for(int j=0;j<3;j++)
                    {
                        i = i+j;
                        }
                System.out.println(i+"----"+j):
                }                           |
                                            +----CE:cannot find symbol
    }                                               symbol:variable j
                                                    location:class Test

==>For local varible JVM won't provide default value compulsorie we should provide intialization
   Expilictly before using that variable i.e if we are not using then it is not required to
   perform intialization.
Example:-
--------                                         |class Test
        class Test                               |{
        {                                        |  public static void main(String[]args)
            public static void main(String[]args)|  {
            {                                    |      int x;
                int x;                           |     System.out.println(x);CE:variable x might 
                System.out.println("Hello");     |   }                       not have been intiliz
            }                                    |   }
        }                                        |
-------------------------------------------------+-------------------------------------------------
        class Test                               |class Test
        {                                        |{
            public static void main(String[]args)|  public static void main(String[]args)
            {                                    |   {
                int x;                           |      int x;
            if(args.length >0)                   |     if(args.length >0)
                {                                |       {
                x=10;                            |          x=10;
                }                                |         }
                System.out.println(x);CE         |         else
            }                                    |         {
            }                                    |           x=10;}
                                                 |  System.out.println(x);
                                                 |  }
                                                 |  }
                                                 |  $>java Test A B C
                                                 |      o/p:10
                                                 |  $>java Test
                                                        o/p:20

1:it is not recomended to perform intialization for local variable inside logical blocks because
  there is no gurantee for execution of these block always at run time.
2:it is highly recomended to perform intialization for local variable at the time of declaration
 at least with default value.

3:The only applicable modifier for local variable is final by mistake if we are trying to apply
 any other modifier then we will get compile time error.
Example:-
--------
        class Test
        {
        public static void main(String[]args)
        {
            public int x=10;      \
            private int x=10;     |\
            protected int x =10;  | ilegal start of expression
            static int x =10;     | /
            transient x = 10;     |/
            volatile x = 10;      /

        final int x = 10;valid
note:-
    if we are not declaring with any modifier then by default it is default but this rule is
    applicable only for instance and static variable but not for local variable
conculusion:-
------------
==>for instance and static variable jvm will provide default value and we are not required to perfo-rm 
intialization expilictly but for local variable JVM won't provide default value compulsories we
should perform intialization expilictly Before using that variable.

==>Instance and static variable can be accessed by multiple thread w simultaneously and hence these -are not thread safe but in the case of local variable for every thread a seprate copy will be cre-ated
and hence local variable are thread safe.


                Type of variable    |is Thread-safe
               ---------------------------------------
                1:instance  variable| no
                2:static variable   | no
                3:local variable    | yes

==>Every variable in java should be either instance or static or local.
==>Every variable in java should be either primitive or reference hence various possible combinatio-n of variable in java are?.
                                      +---------------> 
                            instance--+-+---------> primitive
                                   +--+ |+--------> 
                            static-+-+--++
                                   | +- +---------->reference
                            local--+ +------------->  ^
                                   +------------------+
Example:-
--------
        class Test
        {
        int x = 10; ----->instance--->primitive 
        static String s = "durga"; --->static--->reference
        public static void main(String[]args)
        {
            int[] y = new int[3]; -->local--->reference 
            }
        }

unintialized Arrays:-
===================
Example:-                                          |instance level:
--------                                           |-+-----------
        class Test                                 | 1: int[] x;
        {                                          |         System.out.println(obj.x);null
            int[] x;                               |         System.out.println(obj.x[0]);RE:NPE
            public static void main(String[]args)  |
            {                                      |
                Test t = new Test();               | 2:
                System.out.println(t.x);null       |   int[] x = new int[3];
                System.out.println(t.x[0]);RE:NPE  |           System.out.println(obj.x);[I@3234
                }                                  |           System.out.println(obj.x[0]);0
            }                                      |
                                                   |
                                                    static level:-
                                                    -------------
                                                    1:static int[] x;
                                                    System.out.println(x);null
                                                    System.out.println(x[0]);RE:NPE

                                                    2:static int[] x = new int[3]
                                                    System.out.println(x);[I@3e25
                                                    System.out.println(x[0]);0
                                                    
                                                    local level:-
                                                    -----------
                                                    1:int[] x;
                                                        System.out.println(x);CE:variable x might
                                                                             not have been intiliz
                                                    
                                                    2:int[] x = new int[3];
                                                            System.out.println(x);[I@3532e
                                                            System.out.println(x[0]);0
                                    ==>once we create any array every array element by default
                                       intialized with default value,irrespective of whether it is
                                       instance,static,or local array.




