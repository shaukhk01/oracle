                                 +------------------+
                                 | native Modifier  |
                                 +------------------+
native is modifier it is aplicable only for method and we can't apply anywhere else.
The method which are implemented in non java[mostly c or c++] or called native method or foreign method.

The main objective of native keyword are:

1:To improve performance of the system
2:To acheived machine level or memory level communication 
3:To used already existing legacy non java code

pseduo code to use native keyword:-
-----------------------------------
                                                  |   class client
class Native                                      |   {
{                                                 |     public static void main(String[]args)
                                                  |      {
    static                                        |         Native n = new Native();
    {                                             |          n.m1(); 'invoke the native method'
                                                  |       }
     System.loadlibrary("Native library path");   |     }
                here loading native library       |
    }                                             ++
    public native void m1();'declare native method'|
                                                   |
    }                                              |
                                                   |
                                                   

for native method implementation is already available in old language like c or c++ and we are not responsi-ble to provide implementation hence native method declaration should ends with  ;[semicoln]

Example:-
--------
public Native void m1();==>valid
public Native void m2(){} ==>invalid cannot have body native method

For native method implementation is already available in old language but for abstract method implementation should not be available hence we can't declare native method as abstract i.e native abstract combination 
is illegal combination for methods 

we can't declare native method as strictfp Because there is not grantee old languges follow IEEE 754 standa-rd hence native strictfp combination is illegal combination for method 

The main advantage of native keyword is performance will be improved but the main disadvantage of the native keyword is it breaks platform independent nature of java.


transicent keyword:-
===================

transicent is modifier aplicable only for variable we can use transicent keyword in serialization context.
At the time of serialization if we don't want to save the value of particular variable to meet security 
constraint then we should declare that variable that as transicent

At the time of serialization JVM ignore orignal value off trainsicent variable and save default value to 
the file 
+---------------------------------------+
|hence transicent means not to serialize |
+---------------------------------------+

           *****                                   +--------------+
         **     **     serialization               |              |
        * usr:u1  * ----------------------+        |              |
   +--  * pas:123 *                       |        |              |
   |  +>*         *                       |        |   *******    |
   |  |  **     **                        |        | **       **  |
a1-+--+    *****                          +----->  ** usr:u1    **|
   |                                               * pwd:null    *|
transcient                                         **           **|
                                                   | **       **  |
           *****                                   |   *******    |
         **     **           Deserialization       |              |
        *usr:u1   *    +---------------------------|              |
        *         *    |                           |              |
        *pass:nul * <--+                           |              |
 +------>**     **                                 +--------------+
 |a2       *****                                       file.txt



Volatile:-
=========

volatile is modifier applicable only for variable and we can't apply anywhere else 
if the value of a variable keep on changing by multiple thread then there may be a chance of data inconsistancy problem we can solve this problem by using volatile modifier. 

If a variable declare as volatile then for every thread jvm will create a seprate local copy Every modifcation performed by the thread will takes place in local copy so that there is not effect on the remaining,
thread.

The main advantage of volatile is we can overcome datainconsistance  problem but the main disadvantage of
volatile keyword is creating and maintaning  a seprate copy for every thread increases complexity of program-ming and cretes performance problem hence if there is no spacific requirement it is never recommended to 
use volatile keyword and it is almost deprecated keyword

final varialbe means the value never changes where as volatile variable means the value keep on changing
hence volatile final is illegal combination for variable.


                 class                                     interface        enum
_________________ _^___________________________________________^_______________^______________________
| modifier    | outer | inner | method | variable | block | outer | inner | outer | inner | constructor |
|-------------+-------+-------+--------+----------+-------+-------+-------+-------+-------+-------------|
| public      | /     | /     | /      | /        |       | /     | /     | /     | /     | /           |
|-------------+-------+-------+--------+----------+-------+-------+-------+-------+-------+-------------|
| private     |       | /     | /      | /        |       |       | /     |       | /     | /           |
|-------------+-------+-------+--------+----------+-------+-------+-------+-------+-------+-------------|
| protected   |       | /     | /      | /        |       |       | /     |       | /     | /           |
|-------------+-------+-------+--------+----------+-------+-------+-------+-------+-------+-------------|
| <default>   | /     | /     | /      | /        |       | /     | /     | /     | /     | /           |
|-------------+-------+-------+--------+----------+-------+-------+-------+-------+-------+-------------|
| final       | /     | /     | /      | /        |       |       |       |       |       |             |
|-------------+-------+-------+--------+----------+-------+-------+-------+-------+-------+-------------|
| abstract    | /     | /     | /      |          |       | /     | /     |       |       |             |
|-------------+-------+-------+--------+----------+-------+-------+-------+-------+-------+-------------|
| static      |       | /     | /      | /        | /     |       | /     |       | /     |             |
|-------------+-------+-------+--------+----------+-------+-------+-------+-------+-------+-------------|
| synchronize |       |       | /      |          | /     |       |       |       |       |             |
|-------------+-------+-------+--------+----------+-------+-------+-------+-------+-------+-------------|
| native      |       |       | /      |          |       |       |       |       |       |             |
|-------------+-------+-------+--------+----------+-------+-------+-------+-------+-------+-------------|
| strictfp    | /     | /     | /      |          |       | /     | /     | /     | /     |             |
|-------------+-------+-------+--------+----------+-------+-------+-------+-------+-------+-------------|
| transient   |       |       |        | /        |       |       |       |       |       |             |
|-------------+-------+-------+--------+----------+-------+-------+-------+-------+-------+-------------|
| volatile    |       |       |        | /        |       |       |       |       |       |             |
|-------------+-------+-------+--------+----------+-------+-------+-------+-------+-------+-------------|

The only aplicable modifier for local variable is final. 
The only aplicable modifier for constructor are [public,private,protected,<default>]
The modifier which are aplicable only for variable [volatile and transicent]
The modifier which are aplicable for class but not for interface[final]

The modfier which are aplicable for classes but not for enum[final,abstract]
