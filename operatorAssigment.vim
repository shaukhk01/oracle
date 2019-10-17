                             Operator & Assignment
                             =====================
Increment and Decrement Operator.
Arithmatic Operator.
String concatenation Operator.
Relational Operator.
equality Operator.
instanceof Operator.
bitwise Operator.
short circuit Operator.
assignment Operators.
new Operator.
[]Operator.
operator precedence.
Evaluation order of operands.
new Vs newInstance()
instanceof Vs isInstance()
ClassNotFoundException Vs Noclass DefFoundError.
---------------------------------------------------------------------------------------------------

Increment and Decrement Operator.
===============================

1:We can apply increment and dcrement operators only for variables but not for constant value.
  if we are trying to aplay for constant value then we will get compile time error.

Example:-                          |
--------                           | int x = 10;
       int x = 10;                 | int y = ++10;
       int y = ++x;                | System.out.println(y);CE:unexpected type 
       System.out.println(y);==>11 |                       found:value
                                   |                       reuired:variable

==>nesting of increment and decrement operators not allowed 
Example:-
--------            +-------[it will become constant after braces]
        int x =10;  |
        int y = ++(++x);
        System.out.println(y);CE unexpected type
                              required:variable
                              found:value

for final variable we can't applay increment and decrement operator.
Example:-
--------
        final int x =10;
            x++
            System.out.pritnln(x);CE:cannot assign a
                                    value to x
==>we can applay increment and decrement operator for every primitive type except boolean.
Example:-
--------                                                       |  double d = 10.5;
        int x = 10;               |char ch = 'a';              |          d++;
            x++;                  |      ch++;                 |         System.out.println(d);11.0
        System.out.println(x);11  |    System.out.println(ch);b|
                                  |                            |

        boolean b = true;
                b++
            System.out.println(b);CE:operator ++ cannot to boolean

Difference between b++ and b=b+1:-
--------------------------------
if we applay any arithmatic operator between two variable a and b the result type is always
                       +-----------------------------+
                       |max(int,type of a,type of b) |
                       +-----------------------------+
Example:-
--------
        byte a = 10;
        byte b = 20;
        byte c = a+b;
             System.out.println( c);CE:incompatiable type:possible lossy conversion from int to byt

         byte c = (byte)(a+b);
             System.out.println(c);30
Example:-
--------
       byte b = 10;
      b = b+1;
        Syste.out.println(b);CEpossible lossy conversion from int to byte
        sol:
        ---
        b = (byte(b+1);
        System.out.println(b);11[valid]
But in the case of increment and decrement operator internal type casting will be performed automat-ically.
Example:-
--------
        b++ 
     +------------------------+
     |  b = (true of b)(b+1); |
     +------------------------+
     byte b = 10;
        b++;
        System.out.println(b);11

Arithmatic Operator:-
===================
if we applay any arithmatic operator between two variable a and b the result type is always
                       +-----------------------------+
                       |max(int,type of a,type of b) |
                       +-----------------------------+
byte + byte  = int
byte + short = int
short + short= int
byte + longa = long

long + double = double
float + long  = float
char + char   = int
char + double = double
Example:-                       +--[98]
--------                        |
        System.out.println('a'+'b');-->195
                            |
                            +-[97]

        System.out.println('a'+0.89);-->97.89

        
        byte-->short\
                     \
                      \int-->long-->float-->double
                      \
                      /
        char---------/

infinity:-
--------
In integral arithmatic [byte,short,int,log]there is no way to represent infinity hence if infinity
is the  result  we will get the arithmatic exception in integral arithmatic 
Example:-
--------
System.out.println(10/0);RE:AE:/ division by zero

But in floating point arithmatic[float,double]there is a way to represent infinity

Float and Double classes

POSITIVE_INFINITY;
NEGATIVE_INFINITY;
hence even thow result is infinity we won't get any arithmatic exception in floating point arithmat-ic
Example:-
--------
        System.out.println(10/0.0);Infinity
        System.out.println(-10.0/0);Infinity
In integral arithmatic [byte,short,int,long]there is no way to represent undefined results hence
if the result is undefined we will get run time exception saying arithmatic exception 
Example:-
--------
        System.out.println(0/0);RE
But in floating point arithmetic[float,double]there is a way to represent undefined results for 
this float and double classes contains NaN constant hence if the result is undefined we won't get 
any arithmatic exception in floating point arithmatic.
Example:-
--------
        System.out.println(0.0/0);NaN
        System.out.println(-0.0/0);NaN
note:
For any x value including NaN[not a number] the following expression return false.
Example:-
--------
        x<NaN  |
        x<=NaN |
        x>NaN  | false
        x>=NaN |
        x==Nan |

for any x value including NaN the following expression returns true
Example:-
--------
        x !=NaN-->true
        System.out.println(10<Float.Nan);false
        
        System.out.println(10<=Float.NaN);false

        System.out.println(10>Float.NaN);false

        System.out.println(10>=Float.NaN);false
        System.out.println(10==Float.NaN);false

        
        System.out.println(Float.NaN=Float.NaN);false
        System.out.println(10!=Float.NaN);true
        System.out.println(Float.NaN !=Float.NaN);true

Arithmatic Exception:-
===================    |
                       +--->1:it is runtime exception but not compile time.
ArithmaticException--->+--->2:it is possible only in integral arithmatic but not in floating point
                       +--->3:The only operatos which cause AE are.
                       |
String Concatenation Operator(+):-
================================
The only overloaded operator in java is + operator sometimes it access arithmatic addition operator and sometime it
access string concatenation operator.

==>if at least one argument is string type then + operator access concatenation operator and if both argument are
   number type then + operator access arithmatic addition operator.
Example:-
--------
        String a = "durga";
        int b = 10,c=20,d=10;                         +--------------------+
                                                     || a + b + c + d      |
        System.out.println(a+b+c+d);durga102030      ||                    |
        System.out.println(b+c+d+a);60durga          || "durga" + c + d    |
        System.out.println(b+c+a+d);30durga30        || "durga1020"+d      |
        System.out.println(b+a+c+d);10durga2030      || "durga102030"      |
        System.out.println(b+a+c+d);10durga2030      |+--------------------+

Example:-
--------
Consider the following declaration.

        String  = "durga";
        
        int b = 10,c=20,d=30;
     ---------------------------
     which of the following expression are valid.
    
     a = b + c + d;RE:incompatiable type[how you can assing string into int[a is string in above exprsion]
     a = a + b + c;   found:int
                      required:java.lang.String
     b = a + c + d;CE:incompatiable type
     b = b + c + d;    found:int

Relational Operators:(<,<=,>,>=)
===================
we can applay relational operator for every primitive type accept boolean   
Example:-
--------
        System.out.println(10 < 20);true
        System.out.println('a' < 10);false

        System.out.println('a' < 97.6);true
        System.out.println('a' > 'A');true

        System.out.println(true > false);CE

==>We can't apply relational operator for object type.
Example:-
--------
        System.out.println("durga123" > "durga");
                                      |
                                      |
                                      +----CE:bad operands for binary-

===>nesting of relational operators is not allowed otherwise we will get compile time error.
Example:-
--------
        System.out.println( 10 < 20 < 30);
                            true < 3--+
                                      +---CE:bad operand types for binary operator
Equality Operator:-(==,!=)
=================
We can applay equality operators for every primitive type including boolean type also.
Example:-
--------
        System.out.println(10 == 20);False
        System.out.println('a' == 'b');False

        System.out.println('a' == 97.0);true
        System.out.println(false == false);true

==>we can applay equality operator for object type also.
==>For object reference r1,r2

        r1 == r2; ==>true
if and only if both referneces pointing to the same object.

        references comparison or address comparison.

   r1-----+-    *******   
          +-> **       ** 
              *         * 
          +-> **       ** 
   r2-----+     *******   
                                                        obj 1
Example:-
--------                                   t1\           *******   
       Thread t1 = new Thread();              \       ***       ***
       Thread t2 = new Thread();               \      *           *
                                                /---> ***       ***
       Thread t3 = t1;                         /         *******   
                                              /
      System.out.println(t1 == t2);false   t3/            obj 2
                                                            *******    
      System.out.println(t1 == t3);true                  ***       *** 
                                                 ------> *           * 
                                                /        ***       *** 
                                               /            *******    
                                            t2/

==>if we applay equality operator for object type then compulsories there should be some relational between argument
    type.[either child to parent or parent to child or same type]otherwise we will get compile time error saying 
    incompatiable type 
Example:-                                          t------>   *******           s\           *******   
--------                                                    **       **           \       ***       ***
        Thread t = new Thread();                            *         *            -----> * durga     *
        Object o = new Object();                            **       **                   ***       ***
                                                              *******                        *******   
        String s = new String("durga");            o\         *******                                  
                                                     \     ***       *** 
        System.out.println(t == o);false              ---> *           * 
        System.out.println(o == s);false                   ***       *** 
                                                              *******    
        System.out.println(s == t);CE:incomptable type:java.lang.string nd java.lang.Thread

Q:Difference between == operator and .equals()        


==>In General we can used == operator for reference comparison [address comparison] and .equals() method for containt
   comparison                                            
                                                          vbj1
Example:-                                                   *******   
--------                                         s1\      **       ** 
        String s1 = new String("durga");            \     *         * 
        String s2 = new String("durga");             ---->**       ** 
                                                            *******   
        System.out.println(s1 == s2);false
        System.out.println(s1.equals(s2));true           obj2
                                                  s2\        *******   
                                                     \     **       ** 
                                                      \    *         * 
                                                       --->**       ** 
                                                             *******   
note:
for any object reference are,
    r == null;false

But null == null;true

Example:-
--------                                   |                                   |
        String s = new String("durga");    | String s = null;                  |
        System.out.println(s == null);false| System.out.println(s == null);true| System.out.println(null == null);true
                                           |                                   |
------------------------------------------------------------------------------------------------------------

instanceof operator:-
===================
We can use instance of operator to check whether the given object is a particular type or not.
Example:-
--------
       Object o = l.get(0);                      +--++----+-----+---+--+
                                             l   +   |    |     |   |  |
       if(o instanceof Student)                  +---+----+-----+---+--+
           {
           Student s = (Student)o;
           //perform student spacific functionality
           }

        else
            {
            if(o instanceof customer)
                {
                Customer c = (Customer)o;
                //perform Customer spacific functionality
                }
            }


Syntax:
-----
        r instanceof x
        |            |
        |            +-----[class|interface name]
        +--[obj reference]
Example:-
--------                                                      Object   /Runnable(I)
        Thread t  = new Thread();                               |     /
                                                                |    /
        System.out.println(t instanceof Thread);true            |   /
        System.out.println(t instanceof Object);true            |  /
                                                                | /
        System.out.println(t instanceof Runnable);true          |/
                                                                Thread
    
To used instance of operator compulsories there should be some relational between argument type either child to parentparent to child or same type otherwise we will get compile time error inconvertable type.

Example:-
--------
        Thread t  = new Thread();
        System.out.println(t instanceof String);-->CE:incompatiable type
        
note:-
For any class or interface X null instanceof X is always False.

            System.out.println(null instanceof Thread);false
            System.out.println(null instanceof Runnable);false

short-circuit operator(&&,||):-
-----------------------------
These are exactly same as bitwise operator[&,|]except the fllowing difference.

| & ,1                                     | &&,II                                                 |
|------------------------------------------+-------------------------------------------------------|
| both argument should be evaluated always | second argument evaluation is optional                |
| Relatively performance is low            | Relatively performance is high                        |
| Applicable for both boolean and integral | Applicable only for boolean but not for integral type |

note:-
x && y ==> y will be evaluated
            if x is true
            i.e if x is false
            then y won't be evaluated.
x || y ==>y will be evaluated
          if x is false
          i.e if x is true then
          y won't be evaluated.             +--------+------------------+
Example:-                                   |        |                  |
--------                                    |     x  |     y            |
        int x = 10;, y = 15;                +---+----+------------------+
                                            | & |  11|     17           |
        if(++x<10 || ++y>   15)             +---+----+------------------+
            {                               |   |    |                  |
                x++;                        |&& |  11|     16           |
            }                               |   |    |                  |
        else                                +---+----+------------------+
            {                               |   |    |                  |
            y++;                            | | | 12 |    16            |
            }                               +---+----+------------------|
            System.out.println(a+"   "+y);  ||| | 12 |    16            |
                                            +---+----+------------------+

int x = 10;
if(++x < 10 && (x/0 > 10)
    {
    System.out.println("Hello");
    }
else
    {
  System.out.println("Hi"); -->Hi;
  }
    
==>If we replace &&,with single & then we will get  run time exception saying  arithmatic exception division by zero

Type Cast Operator:-
-------------------
There are two types of type casting 
1:implicit type casting:-
2:Explicit type castring:-

implicit type castring:-
----------------------
1:Compiler is responsible to perform implicit type casting.
2:whenever we are assigning smaller data type value to bigger data type variable implicit type casting will be perform
3:it is also known as widening or upcasting.

4:There is no loss of information in this type casting.
5:The following are various possible conversion where implicit type casting will be performed.

    byte-->short\
                 \
                 ------>int---->long---->float--->double
                / 
    char-- --->/
Example:-                          +--+                                                                ---+
--------                           | compiler converts char to int automatically by implicit typecasting  |
        int x = 'a';               |                                                                      |
            System.out.println(x); |                                                                      |
                                   +--+                                                                +--+
Example2:-                                +-----                                                                  ---+
--------                                  |                                                                          |
        double d = 10;                    | compiler convert int to double automatically by implicit type casting    |
               System.out.println(d);10.0 |                                                                          |
                                          |                                                                          |
                                          +-----                                                                  ---+
Explicit Type Casting:-
----------------------
1:programmer is responsilbe to perform explicit type casting.
2:whenever we are assigning bigger data type value to smaller data type variable then explicit type casting is require
3:it is also known as Narowing or down casting.
4:There may be a chance of loss of information in this type casting.

The following are various possibilities where Explicit type casting is required.

byte<-----short\
                \
                 \int<-----long<-----float<-----double
                /
               /
char<---------/     R-->L==>Explicit Type casting.

Exmple:-
-------
        int x = 130;
        byte b = x;CE:possible loss conversion from int to byte

        byte b = (byte)x;
        System.out.println(b);-->-126
==>Whenever we are assigning Bigger data type value to smaller data type variable by Explicit type casting the most
   Significant bits will be last we have to considered only least significant bits [LSB].

Explain:-
--------
        int x  = 130;==>0000.....010000010  [32 bits for 130]

        byte b = (byte)x;==>10000010[take 8 bits from 32 bits]
                                          |
                         +->-10000010     +--[because byte store only 1 bytes == 8 bits]
                         +-----+
                               |
                               +--convert into 2's complement because msb is -ve
                             1111101
                                  11
                           ---------------
                           1 1 1 1 1 1 0
                       ------------------------
                       64+32+16+8+4+2+0=126
Example:-
--------                                |
        int x = 150;                    |  int x = -150;
        short s = (short)x;             |  short s = (short)x;==>000....010010110
        System.out.println(x);150       |                        |      ----+----
                                        |                        +-+ve[     |
        byte b = (byte)x;               |                                   |150
        System.out.println(b);-->-106   |
                                        |  byte b = (byte)x;==>10010110[8 bits from int x]
                                        |                      |
                                        |                      |
                                                               +--[2's complement from because msb is -ve]

                                                               1 1 0 1 0 0 1
                                                                         1 1
                                                          -----------------------
                                                               1 1 0 1 0 1 0

                                                               64+32+8+2+==106
==If we assign floating point value to the integral types by explicit type casting the digit after the decimal point
  will be lost
Example:-
--------
        double d = 130.456;
        int x = int()d;
        System.out.println(x);==>130

        byte b = (byte)d;
        System.out.println(b);==>-126
----------------------------------------------------------------------------------------------------

Assignment Operator:-
====================
There are 3 types of assignment  operator:-
-----------------------------------------
1:simple assignment[int x = 10;]
2:chained assignment
Example:-
--------
        int a,b,c,d;
        a = b = c = d = 20;
        System.out.println(a+"  "+b+  +c"   "+d);20 20 20  20

==>we can't perform chained assignment directly at the time of declaration
Example:-
--------
        int a = b = c =  20;
            |   |    |
            |   |    |
            icannot find symbol
            symbol:varable c
            int a = b = c = 10;
        
        int b,c,d;
        int a = b = c = d = 20;[valid]

compound:-
--------
sometimes assignment operator mixed with some other operator such type of assignment operator are called compund assig-nment operator.
Example:-
--------
        int a =10;
        a +=20;
        System.out.println(a);=>30
        

The following are all possible compound Assignment operator in Java.

             +------+    +--------+
             |  +=  |  &=|  >>=   |
             |  -=  |  |=|  >>>=  |
             |  *=  |  ^=|  <<=   |
             |  /=  |    |        |
             |  %=  |    +--------+
             +------+
==>In the case of compound assignment operator internal type casting will be performed automatically 
Example:-                       |                               |                                |
--------                        | byte b = 10;                  | byte b = 10;                   |
        byte b = 10;            | b++; < ------[b = (byte)(b+1)]|      b +=1;<----(byte)(b+1)]   |
        b = b+1;                | System.out.println(b)==>10    | System.out.println(b);==>11    |
        System.out.println(b);CE|                               |                                |
                                |                               |                                |
                                |                               |                                |
Example:-
--------
        int a,b,c,d;
        a = b = c = d = 10;
        a += b -= c *= d /= 2;
        System.out.println(a+"  "+b+"  "+c+"  "+d");-160 -180 200 10
Conditional Operator:-[?:]
=====================
The only possible ternary operator in java is conditional operator.
Example:-
--------
        int x = (10 < 20) ? 30:40;
             System.out.println(x);-->30
we can perform nesting of conditional operator also .

        int x = (10 > 20) ? 30:((40 > 50) ? 60 : 70);
             System.out.println(x);==>70

new Operator:-
============
we can use new operator to create object.
Example:-
--------
        Test t = new Test();
note:-
After creating an object constructor will be executed to perform intialization of an object hence constructor is not
for creating of object and it is for intialization of an object. 

==>In java we have only new keyword but not delete keyword Because destruction of useless object is the responsibiliti  -es of garbage collector.

[] operator:-
===========
We can used this operator to declare and create arrays.

int[] x = new int[10];
-----------------------------------------------------------------------------------------------------------

Opertor Precedence:-
===================
            
    1:Unary operators:
        .[],x++,x--
        .++x,--x,~,!
    2:Arithmatic operators:
        .*,/,%
        .+,-
    3:Shift operators:
        .>>,>>>,<<
    4:Comparison operators:
        .<,<=,>,>=,instanceof
    5:equality operators:
       .==,!=
    6:Bitwise operator:
       .&
       .^
       .|
    7:Short circuit operators-
       .&&
       .||
    8:Conditional operator:
       .?:
    9:Assignment operators:
       .=, +=, -=, *= .....

Evaluation order of java operands:-
=================================
In java we have only operators precedence but not operands precedence before applaying any operator all operands will
be evaluated from  left to right.
Example:-
--------
        class Test
        {
        public static void main(String[]args)
        {
            System.out.println(m1(1)+m1(2)*m1(3)/m(4)+m1(5)*m1(6));
            }
        public static int m1(int i)
        {
            System.out.println(i);  o/p: 1           1 + 2 * 3 /4 + 5 * 6
            return i;                    2
        }                                3           1 + 6/4 + 5 * 6
                                         4           1 + 1 + 5 * 6
        }                                5           1 + 1 + 30
                                         6           2+30
                                         32          32

**************************************************************************************************************

                                 Interview Question:-
                                 ******************

new Vs newInstance:-
====================
we can use new operator to create an object if we know class name at the begning.
Example:-
--------
        Test t =  new Test();
        Student s  = new Student();
        Customer c = new Customer();
1:newInstance is a method present in classClass
2:we can use newInstance method to create object if we don't know class name at the beggning and it is available,
dynamic at run time.

Example:-
--------
        class Student
        {
        }
        class Customer
        {
        }
        class Test
        {
        public static void main(String[]args)throws Exception
        {
        Object o = Class.forName(args[0]).newInstance());
        System.out.println("Object created for:"+o.getClass().getName());
        }
        }
        $>java Test student [Execute java8]
        o/p:object created for Student        
        $>java Test Customer
        o/p:Object created for Customer
        $>java Test java.lang.String
        o/p:Object created java.lang.String
==>In the case of new operator based on our requirement we can invoke any constructor.
Exmple:-
--------
        Test t = new Test();
        Test t1 = new Test(10);
        Test t2 = new Test("durga");

==>But new instance method internally calls no argument constructor hence to used newInstance method compulsories 
   corresponding class should contain no argument constructor,otherwise we will get run time exception
   ,InstanctationException

==>while using new operator at rum time if the corresponding .class file is not available then we will get run time
   exception saying NoClassDefFoundError:Test 

Example:-
--------
        Test t = new Test();
        at run time if Test.class file not available then we will get run time exception saying
        NoClassDefFoundError:Test

==>While using newInstance method at run time if the corresponding .class file not available then we will get run time
   exception saying 
   classNotFoundException
Example:-
-------+-------------------------------------------------+
       |Object o = Class.ForName(args[0]).newInstance(); |
       +-------------------------------------------------+

       $>java Test Test1234

       At run time if Test1234.class not available then we will get run time exception saying 
       ClassNotFoundException:Test1234

                        Difference Between new and newInstance
                        ======================================
|            new                      |          newInstance   
+-------------------------------------+------------------------++----------------------------------------+
|1:It is operator in java             |It is a method present in java.lang.class                         |
|2:We can use new operator to create  +------------------------------------------------------------------+
|  object if we know class name at the|2:we can use this method to create object if we                   |
|  beginning                          |  don't know class name at the begnning and if                    |
|3:To use new operator class not requi|  is available dynamically at runtime                             |
|  -red to contain no-arg constructor +------------------------------------------------------------------+
|4:At runtime if class file not avail |3:To use newInstance() compulsory class should contain no-arg     |
|  -able then we RE:NoClassDefFoundErr|  constructor otherwise we will get                               |
|                                     |      RE:InsantiationException                                    |
|                                     +------------------------------------------------------------------+
|                                     |4:At run time if corresponding .class file not available          |
+-------------------------------------+  then we will get run time exception saying class not            |
|                                         found exception saying.                                        |
|                                         ClassNotFoundException which is checkd.                        |
+--------------------------------------------------------------------------------------------------------+


                       Difference Between classNotFoundException Vs NoclassDefFoundError:-
                       =================================================================
For Hard-coded class name at run time if the corresponding .class file is not available then we will get run time Exce-ption saying:
            NoClassDefFoundError,which unchecked
Example:-
--------
        Test t  = new Test();
        Yet run time if Test.class file is not available then we will get runtime Exception

        NoClassDefFoundError:Test
===>For Dynamic provided class name Yet run time if the corresponding .class file is not available then we will get
    run time Exception 
                        ClassNotFoundException,which checked Exception.
Example:-
--------
        Object o = Class.ForName(args[0]).newInstance();

        $>java Test Student
        Yet run time If Student.class file is not available then we will get run time Exception 
        saying.
                ClassNotFoundException:Student        
        
==>Instanceof is an operator in java we can use instance of two check whether the given object is of pariticular type
   or not and we know type at the bignning.
Example:-
--------
        Thread t = new Thread();
        System.out.println(t instanceof Runnable);
        System.out.println(t instanceof Object);

===>isInstance is a method present in java.lang.class we can use isInstance method  to check whethere the given object
    is a particular type or not and we don't know the type ot the bignning and it is available dynamically at run time    
Example:-
--------
        class Test
        {
        public static void main(String[] args)throws Exception
        {
        Thread t = new Thread();
        System.out.println(Class.forName(args[0]).isInstance(t));
        }
        }
        
        $>java Test Runnable;
            o/p:true
        $>java Test String
            o/p:false
==>insInstance() method is a method equvalent of instance of operaotr

            
