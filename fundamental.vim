                             Langauge Fundamental
                             ====================
A name in java program is called identifier which can be used for identification purpose it can be method
name or variable name class name or label name 

Example:-
--------    1:|                       +--4:-
clas Test---+           +-2:- +---3:- |
{                       |     |       |
    public static void main(String[]args)
    {                         |
        int x = 10;           +-------predefine javac class-
        }   |
    }       +--5: Total five identifiers

Rules for defining java identifiers:-
====================================
1:The only allowed character in java identifier are 
    .a-z
    .A-Z
    .0-9
    .$
    ._

1:if we are using any other character we will get compile time error
Example:-
--------
Total_=valid
Total#=invalid
toal12=valid

2:identifier can't start with digit
Example:-
--------
 total123 = valid
 123total = invalid

3:java identifier are case sensitive offcourse java language itself is treaded as case sensitive programming language.
Example:
--------
 int number = 10;|
 int Number = 10;|
 int NUMBER = 10;|we can differentate with case
                 |
4:There is not lenght limit for java identifiers but it is not recommended  to take to lengthei identifiers
5:we can't used reserved word as identifiers
Example:-
--------
int x = 10;valid
int if = 20;invalid

6:All predefined java class name and interface name we can used as indentifiers 
Example:-
--------
class Test
{
public static void main(String[]args)
{
    int String = 888; |
    int runable = 999;| valid all
    }                 |
    }                 |

Even thow it is valid but it is not good programming practice because it is reduces readabilities and create confusion.

Q:which of the following are valid java identifier?
        toal_number;
        123number;
        _$_$_$_;valid
        abc@gma;invalid
        Int;valid
        INT;valid
        int;invalid
        java2hare;valid

In java some words are reserved to represent some meaning or functionality such type of word are called 
reserved words

                                RESERVED WORD
                                    |
                                    |
                 +-------------------------------------------+
                 |                                           |
                 |                                           |
                 |                                           |[Reserved Literals(3)
      [keyword(50)|                                                     |
         |                                                             |
         |                                                             +->true 
         |                                                             +->false 
+--------+---------------+                                             +->null 
|                        |                                             
|[used word(48)]         |[unused workd(2)                                              
     |                         |
     |                         |
  +--+                         +[got,const]
if|  |                                     
    +(else)                                    

note1:
 keyword:-if the reserved word associated with functinality it is called keyword
 literal: if the reserved word associated with only value not functionality it is called Literals


Keywords for Data Type:-
=======================
byte
short
int
long
float
double
boolean
char

Keyword for Fllow Control:-
============================
if
else
switch
case
default
while
do
for
break
continue
return

Keyword for Modifier:-
======================
public
private
protected
static
final
abstract
synchronized
native
strictfp(1.2v)
transicent
volatile

Keyword for Exception Handling:-
==============================
try
cache
finally
throw
throws
assert(1.v)

Class Related keyword:-
======================
class
interface
extends
implements
package
import

Object Related Keyword:-
========================
new
instanceof
super
this

void return Type Keyword:-
=========================
void
In java return type is mandatory if a method won't return anything then we have to declare that method with void 
return type
But in C-language  return type is optional default return type is int

unused keyword:-
===============
goto: uses of created several problem in old language and hence SUN people ban this keyword in java
const: use final instead of const 
note:
got and const are unused keywords and if we are trying to used we will get compile time error 

Reversed Literals:-
===================
true,false:value for boolean data type
null:default value for object reference

enum:we can used enum to define a group of named constant's 
example:-
--------
1:enum Beerbohm
{
    KF,Ko,Rc,Fo
 }

2: enum motnth
 {
 Jan,Feb,Mar
 }

Conculusion:-
1:All 53 reserved word in java contain only lower case alphabet symbol
2:In java we have only new keyword and there is no delete keyword because distruction of useless object is the 
responsibilities of garbage collector
       +-----------------------------------+
       |>strictfp butnot strictFp          |
       |>instanceof butnot instanceOf      |
       |>synchronized butnot synchronize   |
       |>extends butnot extend             |
       |>implements butnot implement       |
       |>import butnot imports             |
       |>const butnot constant             |
       +-----------------------------------+
************************************************************************************************************

                                  Data Type
                                  ========
In java Every variable and Every Expression has some type 
each and every data type is clearely define EVery assigment
should be checked by compiler for type compatibility
Because of above reason we can conclude java language is 
strongly typed programming langauge.

Java is not considerd as pure object oriented programming language Because several oops features are satisfaied by 
java [like operator Overloading,multiple inheritance]etc

More over we are depending on primitive data type which are non object 

Primitive Data Type:-
====================
                                            primitive data
                                                |
                                                |
                                                |
                        +-----------------------+------------------+
                        |                                          |
                        |                                          |
                        |[numric data type]                       |[non numeric data type]             
                                |                                               |
                                |                                               |
                +---------------+ ----------------+                       +-----+ -------+
                |                                 |                       |              |
                |                                 |                  char>+              +>boolean
                |Integral data                    |
                 --+----------                    |Floating point
                   |                                     |
                   +->byte                  +------------+----------+
                   |                        |                       |
                   +->int                   |                       |
                   |                        |                       |
                   +->long                  |float                  |double

Accept boolean and char remaining data type considerd as singed data type.                             
Because we can represent both postive[+ve] and negative[-ve]numbers


byte:
size 1 byte(8 bits)--+   +----------------+
maxvlaue = +127      +-->|x|1|1|1|1|1|1|1 |  
minvalue = -128          +---------------+
range = -128 to 127       |            
                          +-(msb)[sign bits] 64+32+16+8+4+2+1=127
                         The most significant bits access sign bits 0-->+ve
                                                                    1-->-ve
                         +ve number will be represented directly in the memory
                         where as -ve number will represented in 2's compliment form[-128]


Example:-
byte x = 10;

byte b = 127;

byte c = 128;CE:possible loss of precesion  |
                                            |
byte b = 10.5;CE:P L P                      |
              found:double                  |
              required:byte                 |make sure remember which error for which things                            
                                            |
byte b = ture;CE:incompatible type          |
              found:boolean                 |
              required:byte                 |
                                            |
byte b = "dugra";CE:incompatiable type              

byte is best choice if we want to handle data in terms of streams either from file or from the network[file supported 
form or network supported form is byte]

short:
======
This is most rarely used data type in java.
size:2 bytes
range = [-2^15 to 2^15 - 1]==>-32768 to 32767
Example:-
--------
short x = 32767;
short x = 32678;CE:possible loss precession 

short x = 10.5;CE:incompatible

short data type best suitable for 16bit processor like 8085But these processor are completely outdated and hence 
corresponding sort data type is also outdated data type.

int:-
=====
The most commonly used data type is int.
size 4;bytes[32bits]

range:[-2^31 to 2^31 -1]-2147483648 to 2147483647
Example:-
--------
int x =2147483647; 
int x = 2147483648;CE:integer numer too large

int x = 2147483648l;CE:possible lossy conversion from long to int

int x = true;CE:incompatible types: boolean cannot be converted to int

instanceof operator:-
====================
We can use instanceof operator to check whether the given object is of particular type of not
Example:-
--------
object o = l.obj(0)
 if(o instanceof Student)
     {
        Student s = (Student)o;
        //perfrom student spacific funtionality
        }
 else if(o instanceof Customer)
     {
     Customer c = (Customer)o;
       //perfrom customer spacific funtionality 

       }

syntax:
      +-----------------+
      | r instanceof X  |
      +-^------------^--+
        |            |
        |            |
   +----+            +-----+
   |object reference       +class|interface name

                                                                  runnable
Thread t = new Thread();                                         /
System.out.println(t instanceof Thread);true            object  /
System.out.println(t instanceof object);true;              |   /
System.out.println(t instanceof runnable);ture             |  /
                                                           | /
Thread is a child of object thread implement runnable      |/
                                                           Thread
Example:
class Test
{
    public static void main(String[]args) +-------[here thread is child of object]
    {                                     | 
        Thread t = new Thread();          | 
        System.out.println(t instanceof thread);
        System.out.println(t instanceof object);
        System.out.println(t instanceof runnable);

To use instance of operator compulsory there should be some relational between argument type[either child to parent,parent to child or same type]otherwise we will get compile time error saying inconvertable type

Examp:

Thread t = new Thread()
System.out.prinlnt(t instanceof String);CE:incompatiable type
                                        found:
note:                       +------------------------------------+
For any class or interface X|null instance of X is always false  |
                            +------------------------------------+
System.out.println(null instance of X);false


                               Bitwise Operator(&,|,^)
                               ======================
& ----->return True iff both argument is true 
| ----->return True iff atlreast one agument is true
^ ----->return True iff both argument is different 
Example:-
--------
sop(true&false);false
sop(true|false);true
sop(true|false);true

We can apply these operators for integral type also 
Example:-
--------
sop(4&5)------->100 
               101
             ---------
              1 0 0 ==>4

sop(4|5) ------>100 
                101
             ----------
                101 ==>5

sop(4^5) ------->100 
                 101
               ---------
                 001==>1

Bitwise complement Operator(~):-
==============================
We can apply this operator only for integral type but not for boolean type if we are trying to apply for boolean type
then we will get compile time error.

Example:-
--------
System.out.println(~true);falseCE
System.out.prinlnt(~4);-5
                
                    4==>00000....0100[32bits]
                    ~4==>1111....1011

                         0000....0100
                                    1
                       -------------------
                                 1 0 1   ==>5
The most significant bit access sign bit
0 means positive number 1 means negative number
positive number will be represented directly in the memory where as negative number will represented 2 indirectly in
the memory in 2's complement form


boolean Complement Operator(!):-
============================
we can apply this operator only for boolean type but not for integral types

System.out.prinlnt(!4)==>CE:operator !cannot be applied
System.out.prinlnt(!false)==>true
                             +----------------------------------------------------------------------+
                             |       & |                                                            |
                             |       | |applicable for both boolean & integral type                 |
                             |       ^ |                                                            |
                             |                                                                      |
                             |       ~==>applicable for only integral type butnot for boolean type  |
                             |                                                                      |
                             |       !==>applicable only for boolean but not  for integral          |
                             +----------------------------------------------------------------------+

Literals:-
=========

Any constant value which can be assign to the variable is called literal
Example:-
---------
int x = 10; <--------[liteal]-
|   |
|   +-[name of variable-
|[data type]

integral literals:-
------------------
For integral data type [byte,short,int,long]we can spacifiy literal value in the following base

1:decimal form[base 10 allowed digit are :0-9]
Ex:
    int x  = 10;
2:octal form[base 8 allowed digit are:0-7]octal value should be prefix with zero[0]
Ex:
    int x = 010;
3:hexadecimal form:-allowed digit are 0-9,a,f we can use both lower case and uppercase characters this is onle of 
very few area where java is not casesensitive 
The literal value should be prefex with 0x or 0 X
Ex:
int x = 0x10;
int x = 0X10;

These are only possible way to spacify literal value for integral data type.

Q:Which of the following declaration are valid?
    
        int x = 10;
        int x = 0786;CE:[because octal range is 0-7 but you are using 8 also]
        int x = 777;
        int x = 0XFace;
        int x = 0XBeef;
        int x = 0Xbeer;CE:
Example:-
--------
class Test
{
    public static void main(String[]args)
    {
        int x = 10;
        int y = 010;
        int z = 0X10;
        System.out.println(x+"  "+y+" "+z)==>10 8 16 [jvm always provide value in decimal form.]
        }
    }
By default Every integral literal is off int typ but we can spacify expilictly as long type by suffix with small l or L
Example:-
--------
        int x = 10;
        long l = 10;
        int x = 10l;CE:[because how 8bytes assing into 4 bytes[int]]
        long l = 10;

There is no direct way to spacify byte and short literals expilictly but indirectly we can spacify whenever we are 
assining integral literal to the byte variable and if the value within the range of byte then compiler treates it
automatically as byte literals. Similarly short literals also 

Example:-
--------
        byte b = 10;
        byte b = 127;
        byte b =128;CE
        short i = 32767;
        short i = 32768;CE:possible loss precession
                            found:int[default every integral value is int type]
                            required:byte

Floating Poing Literals:-
========================
By default Every floating point literals is of double type and hence we can't assign directly to the float variable
But we can spacify floating point literals as float type by suffix with small f or capital F.

float f = 123.456;CE:possible loss precession [it is not possible to assing 8 bytes value to the 4 bytes]
                        found:double
                        required:float
float f = 123.457f
double f = 123.456;

We can spacify expilictly floating point literal as double type by suffix with small d or capital D
offcourse this convention is not required 

Example:-
--------
        double d = 123.456D;
        float  f = 123.456d;CE:possible loss of precession
                                found:double
                                required:float
We can spacify floating point literals only in decimal form and we can't spacify  in octal form and hexadecimal

Example:-
--------
        double d = 123.456;
        double d = 0123.456;[it is tread as decimal literals not octal]
        double d = 0x123.456;CE

We can assign integral literal directly to floating point variable and that integral literal can be spacified either
in decimal or octal or hexa decimal forms.

Example:-
--------
        double d = 0786;CE:[tread as octal and octal 8 is not allowed]
        double d = 0xface;[valid:Because tread as hexa]
        double d = 0786.0;[valid not tread as ocatal because of .0]
        double d = 0xFace.0;[invalid]
        double d = 10;[vali]d
        double d = 0777;[valid]

We can't assign floating point literal to integral types.
Example:-
--------
        double d = 10;
        int x = 10.0[invalid]
We can spacify floating point literal even in exponential form[scientific notation]
Example:-
--------
        double d = 1.2e3;
        System.out.println(d)==>1.2e3
                                =1.2*10^3
                                =1.2*1000;
                                 -----------
                                 1200.0

        flaot f = 1.2e3;[invalid]
        float f = 1.2e3f;

Boolean Literal Data Type:-
==========================
The only allowed value for boolean data type are true or false.

Example:-
--------
        boolean b = true;
        boolean b = 0;CE[incompatiable type
                        found:int
                        required:boolean
        boolean b = True;
                    cannot find symbol
                    symbol:variable True
                    location:class Test
        boolean b = "true"
                      incompatiable types
                      found:variable string
                      required:boolean
int x = 0;
if(x) < ---------------------------------[incompatiable type
    {                                    found:int
        System.out.println("Hello");     required:boolean
        }
else
    {
    System.out.println("Hi");
    }

Char Literal  Data Type:-
========================
We can spacifiy char literal as single character within single quote[' '] char ch = 'a';
Example:-
--------
        char ch = 'a';
        char ch = a;CE:cannot find symbol
                    symbol: variable a
                    location:class Test
        class ch = 'ab';CE
                    unclosed char literals 
We can spacify char literal as integral literal which represent unicode value  of the character and that integral
literal can be spacify either in decimal or octal or hexadecimal forms.

But allowed range is 0 to 65535

    char ch = 97;
    System.out.println(ch)==>a
    char ch = oxface;
    char ch = 0777;
    char ch = 65535;
    char ch = 65536:CE:possible loss precession
                        found:int
                        required:char
we can represent char literal in unicode representation which is nothing but single quote '\uxxxx'[4-digit hexa num]
Example:-
        char ch = '\u0061';
        System.out.println(ch);==>a
Every escape character is a valid char literal.
Ex:
    char ch = '\n';
    char ch = '\t';
    char ch = '\m';CE:illegal escape character
Escape character:-
==================
        \n-------->new line
        \t-------->Horizental tab
        \r-------->carriage return
        \b-------->back space
        \f-------->form feed
        \'-------->single quote
        \'-------->double quote
        \\-------->Backslash
Q:Which of the following are valid?

        char ch = 65536[invalid]
        char ch = 0xBeer;[invalid]
        char ch = \Uface;[invalid]
        char ch = '\ubeef';
        char ch = '\m'[invalid]
        char ch = '\iface'[invalid]

String Literal:-
===============
Any sequence of character within double quote[" "]is tread as String Literal
Example:-
--------
        String s = "dugra";

1.7 version inhashment with respect to literals 

1:Binary Literals:-
------------------
For integral data type until 1.6 version we can spacify literals value in the following base 
1:decimal form
2:octal form
3:hexa decimal form

But form 1.7 version onwards we spacify literals value even binary form also
allowed digit are 0 and 1 Literal value should be prefix with 0b or 0B

Example:-
--------
        int x = 0B1111;==>15
uses of _ symbol in numric literals:-
------------------------------------
from 1.7 version onward we can use _ symbol between digit of numric literals
Example:-
--------
        double d = 123456.789;
        double d = 1_23_456.7_8_9;
        double d = 123_466.78_9;
The main advatage of this approach is readiabilities of the code will be improved 
At the time of compilation these _ symbol will removed automatically hence after compilation the above line becomes
double d = 123456.789;

We can use more then one _ symbol also between the digit 
    double d = 1__23_343_653;
    double d = 1___2___3___4_5_6.7_8_9;

we can use the _ symbol only between the digit if we are using anywhere else we will get compile time error.
Example:-
        double d = _1_23_456.7_8_9;
        double d = 1_23_456.7_8_9;
        double d = 1_23_456.7_8_9_;

byte------>short\
                 \
                  \ int---->long---->float---->double
                  /
char-------------/

8 byte long value we can assign to 4 byte float variable because both are following different memory representation internally
float f = 10l;
System.out.println(t);10.0;

