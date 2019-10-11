                                          *********  
                                       ***  Array  ***
                                          *********  
---------------------------------------------------------------------------------------------------
Introduction:-
=============
An array is an index collection of fixed number of homogeneous data element.
The main advantage of array is we can represent huge number of value by using single variable so that readabilities
of the code will be imporoved But the main disadvantage of array is fixed in size i.e once we creates an array
There is no chance of increasing or decreasing sized base our requirement
Hence to use array concept compulsory we should know the size in advanced,which may not possible always 

Array Declaration:-
=================
one dimensional array declaration:-
----------------------------------
    int[] x;----->recomended[because name is clearly seprated from type]
    int []x;----->valid
    int x[];----->valid
At the time of declaration we can't spacify the size otherwise we will get compile time error
Example:-
--------
    int[6] x;[invalid]
    int[] x;[valid]

two dimensional array declaration:-
----------------------------------
    int[][] x;     |
    int     [][]x; |
    int     x[][]; |
    int[]   []x;   |[all are valid]
    int[]   x[];   |
    int[]   x[];   |
    int     []x[]; |
Example:-
--------
    int[]   a,b;a-->1
                b-->1
    int[]   a[],b[];a-->2
                    b-->2
    int[]   []a,b;  a-->2
                    b-->2
    int[]   []a,b[];a-->2    
                    b-->3
    int[]   []a,[]b;---->CE
==>If we wanto spacify dimension before the variable before the variable that facility is aplicable only for first variable in a declaration.if we are trying to apply for remaining variable we will get compile time error

int [] []a,[]b,[]c;
       |   ------------[invalid]
       +-valid
Three dimensional array:-
-----------------------
    int[][][]a;
    int     [][][]a;
    int[]   a[][][];
    int[]   [][]a;
    int[]   []a[];
    int[][] [];
    int[][] a[];
    int     [][]a[];
    int []a[][];

Array creation:-
===============
Every array in java is an object only hence we can create arrays by using new operator 
Example:-
--------
int[] a = new int[3]

For Every array type corresponding classes are available and these classes are partof java
language and not available to the programmer level.
Example:-
--------
        int[] a = new int[3];

| Array type | corresponding class name |
|------------+--------------------------|
| int[]      | [I                       |
| int[][]    | [[I                      |
| double[]   | [D                       |
| short[]    | [S                       |
| byte[]     | [B                       |
| boolean    | [Z                       |
Example:-
--------
        boolean[] b = new boolean[3];
        System.out.println(b.getClass().getName());
1:At the time of array creation compulsory we should spacified size otherwise we will get compile
time error.
Example:-
--------
        int[] x = new int[];[invalid]
        int[] x = new int[6];
2:It is legal to have an array with size 0 in java.
Example:-
--------
        int[] x = new int[0];
3:if we are trying to spacify array size with some negative int value then we will get run time    
Exception saying negative array size exception 
Example:-
--------
        int[] x = new int[3];:RE:Negativearraysize
4:To spacify array size the allowed data types are.
byte,short,char,int if we are trying to spacify any other type then we will get compile time error
Example:-
--------
        int[] x = new int[10];
        int[] x = new int['a'];
        byte[] b= 20;
        int[] x = new int[b];
        short x = 20;
        short[] x = new short[s]
        int[] x = new int[s];
        int[] x = new int[10l];--->CE:possible loss precession
                                        found:long
                                        required:int

note:
The maximum allowed array size in java is 2147483647 which is the maximum value of int data type
2147483648
Example:-
--------
        int[] x = new int[2147483647];
        int[] x = new int[2147483648];CE:integer number too large
Even in the first case we make at run time exception if substrance heap memory not availabe 

Two Dimensional Array:-
=====================
two dimensional array creation:-
-------------------------------
In java two dimensional array not implemented by using matrix style sun people followed array of 
array approach for multi dimensional array creation.
Them main advantage of this approach is memory utilization will be improved  
Example:-
--------
        int[][] x = new int[2][];   
                x[0] = new int[2];   +--+--------+
                x[1] = new int[3];x->|  |        |
                                     +--+--------+
                                       ^      ^     +---+----+----+
                                       |      |     |   |    |    |
                                       |      +-----+   |    |    |
                                  +--+-------++     +---+----+----+
                                  |  |        |
                                  +--+--------+





                               +---+------+----------------+
                   x-------->  |          |                |
                               +---+------+--------+-------+
                                |                  |
                                |             +----++------+
                             +--+---+--+      |     |      |
int[][][] x = new int[2][][];|  |   |  |      +---+-+-----++
x[0] = new int[3][];         +--+---+--+          +-----+ +---------+-------+
x[0][0] = new int[1];         |    |   |       +-----+ +-+--+      |   |   |
x[0][1] = new int[2];         |    +--++-------+     | |  |  |      +---+---+
x[0][2] = new int[3];      +--+--+  +-+---+    +-----+ +--+--+
x[1] = new int[2][2];      +-----+  +-----+

Q:which is the following array declaration are valid?

int[]a = new int[]; invalid
int[]a = new [3];   valid
int[][]a = new int[][]; invalid
int[][]a = new int[3][]; valid
int[][]a = new int[][4]; invalid
int[][]a = new int[3][4]; valid
int[][][] = new int[3][4][5]; valid
int[][][]a = new int[3][][5]; invalid
int[][][]a = new int[][4][5];invalid

Array intialization:-
====================

once we create an array every element by default intialized with default values
int[] x = nw int[3];
System.out.println(x);--->[I@3e25a6
System.out.println(x[0])--->0

note1:
When we are trying to print any reference variable internally to string method will be called 
which is implemented by default to return the string in the following form.
+----------------------------------------+
|classname@hashCod in_hexdadecimal form  |
+----------------------------------------+
Example:-
--------
        int[][] x = new int[2][3];
        System.out.println(x);-->[I@je25a6
        System.out.println(x[0]);--->[I@19284f [this is the reference of x[0]]
        System.out.println(x[0][0])--->0

Example:-
--------
        int[][]  x = new int[2][];
        System.out.println(x);--->[[I@3e2d5a
        System.out.println(x[0])--->null;
        System.out.println(x[0][0])--->RE:NPE

If we are trying to perform any operation on null then we will get null time exception saying 
null pointer exception 

once we creates an array a every element by default intialized with default values if we are not
satisfied with default value then we can override these value with our customized value.
Example:-
--------
        int[]   x = new int[6];
        x[0] = 10;
        x[1] = 20; +------------------+
        x[2] = 30; |10|20|30|40|50|60 |  
        x[3] = 40; +------------------+
        x[4] = 50;   
        x[5] = 60;   
        x[6] = 70;RE:ArrayIndexOutOfBoundException
        x[-6]= 80;RE:ArrayIndexOfBoundException
        x[2.5] = 90;CE:possible loss procession

if we are trying to access array element with out of range index[either +ve value or -ve value int]
then we will get run exception saying array index out of bound exception

Array Declaration ,creation and intialization in a single line:-
---------------------------------------------------------------
We can declare create and intialize an array in a single line[shortcut representation]
int[] x;        |
x = new int[3]; |
x[0]=10; +------+
x[1]=20; |             int[] x = {10,20,30};
x[2]=30; |             char ch = {'a','b','c','d'};
         |             String s = {"A","AA","AAA"};
We can extends this shortcut for multi dimensional array also.

int[][]  x={{10,20},{30,40,50}}            +---------+--------------+
                                      x--->|         |              |
                                           +---+-----+-------+------+
                                               |             |       
                                         +----++-------+  +--+---+-----+
                                         |10  |20      |  |30|40 |50   |
                                         +----+--------+  +------+-----+

int[][] x = {{{10,20,30},{40,50,60}},{{70,80},{90,100,110}}};

System.out.println(x[0][1][2])---->60               +-----------+--------------+
System.out.println(x[1][0][1]);--->80     x------>  |           |              |
System.out.println(x[2][0][0]);---->:RE             +---+-------+---------+----+
System.out.println(x[1][2][0]);---->:RE                 |                 |
System.out.println(x[1][1][1]);---->100                 |                 |
System.out.println(x[2][1][0])----->RE           +-----++------+    +-----+---+------------+
                                                 |     |       |    |         |            |
                                                 +---+-+----+--+    +-----+---+-------+----+
                                                     |   *   |            |           |
                                           +--+----+-+--+* +-++--+--+  +--+-+----+ +--+-+-----+---+
                                           |10|20  |30  |* |40|50|60|  |70  |80  | |90  |100  |110|
                                           +--+----+----+* +--+--+--+  +----+----+ +----+-----+---+
if we want to use this shortcut compulsory we should perform all activity in a single line.
if we are trying to divide into multiple line then we will get compile time error.
Example:-
--------
        int [] x = {10,20,30,40};

        int [] x;

        x = {10,20,30};CE:ilegal start of expression

length Vs length():-
=================
length is final variable applicable for array.
length variable represent the size of array.
Example:-
--------
        int[] x = new int[6];
        System.out.println(x.length())-->CE:cannot find symbol
                                            symbol:method length()
                                            location:class int[I
        System.out.println(x.length)-->6;
length() method is a final method applicable for string object length() method return no of character present in the String.
Example:-
--------
        String s = "durga";
        System.out.println(s.length)-->CE:cannot find symbol
                                       Symbol:variable length 
                                       location:class string
        System.out.println(s.length);--->5;
note:
length variable applicable for array But not for String object where as length() method applicable
for String object but not for arrays.
Example:-
--------
        String[] s = {"A","AA","AAA"};

        System.out.println(s.length);--->3
        System.out.println(s.length());CE:cannot find symbol
                                         symbol:method length()
                                         location:class String[]
        System.out.println(s[0].length);CE:cannot find symbol
                                         symbol:variable length
                                         location:java.lang.String
        System.out.println(s[0].length());--->1

In multi dimensional array length variable represent only base size but not total size.
Example:-
--------
int[][]     x = new int[6][3];
System.out.println(x.length);--->6
System.out.println(x[0].length);--->3;

There is no direct way to find total lenght of multi dimensional array but indirectly we can 
find as follows.
        x[0].length+x[1].length+x[2]....

Anonymous Array:-
===============
Some time we can declare an array without name such type of nameless array are called anonymous
arrays.
The main purpose of anonymous array is just for instant use[one time uses]

We can create anonymous array as fllows:-
                                 +------------------------+
                                 | new int[]{10,20,30,40} |
                                 +------------------------+
Whhile creating anonymous array we can't spacifes the size other wise we will get compile time
error
  +-----------------------+
  | new int[3]{10,20,30}; |-->invalid
  +-----------------------+
  +---------------------+
  |new int[]{10,20,30}; |-->valid
  +---------------------+

We can create multi dimensional array also.
+-------------------------------+
|new int[][]{{10,20}{30,40,50}} |
+-------------------------------+

Based on our requirement we can give the name for our anonymous array then it is no longer
anonymous
+--------------------------------+
|int[] x = new int[]{10,20,30};  |
+--------------------------------+
Example:-
--------
       class Test
        {
            public static void main(String[]args)
            {
                sum(new int[]{10,20,30,40});
            } 
            public static void sum(int[]x)
            {
                int total=0;
                for(int x,:x)
                    {
                        total = total +x;
                     }
                System.out.println("The sum of:+total);
                }
            }
in the above example just to call sum method we required an array but after compliting some method
call we are not using that array any more.
Hence for this one time requirement anoymous array is the best choice. 

Array Element Assignment:-
========================
case1:
In the case of primitive type array as array element we can provide any type which can be 
implicitly promoted to declared type

Example1:-
--------
        int[]   x = new int[5];
        x[0]  =10;
        x[1]  ='a';
        
        byte b = 20;
        x[2] =b;
        
        short s = 30;
        x[s] = s;
        x[4] = 10l:CE:possible loss precession
                    found:long
                    required:int
Example2:-
--------
        In the case of float type array the allowed data type are.
         byte,short,char,int,long,float
case2:
-----
object type arrays as array element we can provide either declare type object or its child class
object 
Example:-
--------
        Object[] a = new Object[];
        
        a[0] = new Object(); |
        a[1] = new String(); +-->allowed 
        a[2] = new Integer();|
 -------------------------------------                            Number
                                                      +----+----+-----+-----+------+
        Number[]   n = new Number[10];                |    |    |     |     |      |
        n[0] = new Integer(10);                       |B   |S   |I    |L    |F     |D
        n[1] = new Double(10.5);
        n[2] = new String("durga");CE:incompatible type
                                  found:java.lang.String
                                  required:java.lang.Number
case3:
For interface type array as array element its implementation class object are allowed.

Runnable[]  r = new Runnable[10];

r[0] = new Thread();
r[i] = new String("durga");CE:incompatible 

            | Array Type            | Allowed Element Type            |
            |-----------------------+---------------------------------|
            | primitive Arrays      | Any array type whic can be      |
            |                       | implictly promoted to declare   |
            |                       | type                            |
            |-----------------------+---------------------------------|
            | Object Type Arrange   | Either declared type or its     |
            |                       | child class object              |
            |-----------------------+---------------------------------|
            | Abstract class Type   | its child class object          |
            |-----------------------+---------------------------------|
            | interface type  Array | its implementation class object |
            | Array                 | are allowed                     |
            |-----------------------+---------------------------------|

Array Variable Assignment:-
=========================
Element level pormotion are not applicable yet array level
Example:-
--------
        char element can be promoted to int type where as char array cannot be promoted to int 
        array
        int[] x = {10,20,30,40};
        char[] ch={'a','b','c','d'};
   ------------------------------------------
        int[] b=x;
        int[] c=ch;CE:incompatible type
                   found:char[]
                   required:int[]
Q:which of the following promotion will be performed Automatically.
     +------------------------------+
     |  char--->int;valid           |
     |  char[]--->int[]invalid      |   
     |  int--->double  valid        | 
     |  int[]--->double[]  invalid  |   
     |                              |
     |  float--->int  invalid       |   
     |  float[]---->int[] invalid   |   
     |  string----->Object valid    | 
     |  String[]---->Object[] valid | 
     |                              |
     +---------------------------+--+
But in the case of object type array child class type array can be promoted to parent class
type array.
Example:-
--------
        String[] s ={"A","B","C"};
        Object[] a = s;
When ever we are assingig one array to another array internal elements won't be copy just references variable will be
reassigned 
Example:-
--------
        int[]   a={10,20,30,40,50,60};
        int[]   b={70,80};
------------------------------------------------
        a = b; valid
        b = a; valid

case3:
    Whenever we are assigning one array to another Dimension must be matched 
    For example in the place of one dimensional int array array we should provide one dimensional array only
    If we are trying to provide any dimension then we will get compile  time error.

Example:-
--------
       in[][] a = new int[3][];
       
       a[0] = new int[4][3];CE:incompatible type
                               found:int
                               required:int[]

       a[0] = 10;CE:incompatible typ
                    found:int[][]
                    required:int[]

       a[0] = new int[2];valid
WhenEver we are assigning one array to another array both dimensions and type must be matched but sized are not
required to matched
Example:-
--------
        class Test
        {
            pubic static void main(String[]args)
            {
                for(int i=0;i<=args.length;i++)
                    {
                        System.out.println(args[i]);
                        }
                }
            }
    $>java Test A B C---->A B C RE:
    $>java Test A B----->A B RE
    $>java Test--->RError

Example:-
--------
        class Test
        {
            public static void main(String[]args)
            {
                 String[] argh={"x","y","z"};
                 args = argh;
                                                          +--> 1obj <--+  +--> 1obj <---+
                 for(String s : args)                     |    |       |  |    |    +---+
                     {                                    | a[0][4]    |  | a[1][2] |
                     System.out.println(s);               +--+---+--+--+ +-----+-----+
                     }                             2gc---|  |   |  |  | |     |     | ---->3gc 
            }                                             +--+---++-+--+ +-+---+-----+
            }                                                     |        |
               int[][] a= new int[4][3];---->5                 +--+---+----+-+-----+---+
                                                        a[4]   |      |      |     |   | --->1gc--->1obj 
                   a[0] = new int[4];---->1                    +--+---+--+---+---+-+-+-+
                   a[1] = new int[2];---->1                       |      |       |   +--------+---+---+--+
                  a = new int[3][2];------>4                +--+--++--+ +++--+-+ +--+--+--+   |   |   |  |
            --------------------------------------- 4gc<---|  |   |  | | |  | | |  |  |  |   +---+---+--+
            1:Total how many object created? 11             +--+---+--+ +-+--+-+ +--+--+--+    a[4][3]
                                                            a[4][3]     a[4][3]  a[4][3]          |
            2:Total how many objet eligible for GC? 7           |          |        |             7gc
                                                                4gc        5gc     6gc             |
                                                                |           |       |              |
                                                               2obj       3obj  4obj    obj--->int[4][3]=5


                                                         +------+--------+------+-----+
                                                a[3][2]  |      |        |            | a[3]--->1obj 
                                                         +-+----+------+-+------+--+--+
                                                           |           |           |
                                                       +---+-----+  +--+-+-----+   +-----+-----+
                                                       |   |     |  |    |     |   |     |     |
                                                       +---+-----+  +----------+   +-----+-----+
                                                           |             |                |
                                                           |             |                |
                                                           2obj          3obj             4obj --a[3][2]=4

                                                
