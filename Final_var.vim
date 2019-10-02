
                                Final Variable

Final instance variable:-
========================
1:if the value of variable is varied[changed] from object to object such type of variable are called instance variable.
2:For every object a seprate copy of instance variable will be created

3:For instance variable we are not required to perform intializztion explicitly JVM always provide default 
value.

Example:-
--------
class Test
{
   int x;
   public static void main(String[]args)
   {
        Test t  = new Test();
        System.out.println(t.x);==>0;
        }
 }


4:If the instance variable declare as final then compulsory we have to perform intilization explitly whether  we are usng or not and JVM won't proivide default value

Example:-
--------

class Test
{
    final int x;
        }Error:-x variable not intializie

Rule:
    For final instance variables compulsory we should perform intialization before constructor compilition,
    i.e the following or various places for intialization.

    1:at the time of declaration:
        class Test
            {
        final int x = 10;
              }
    2:Instance block:
        class Test
        {
            final int x;
                {
                    x = 10;
                }
                }
    3:Inside constructor:
        class Test
        {
            final int x;
                Test()
                {
                    x = 10;
                    }
            } 
These are the only possible places to perform intialization for final instance variable if we are trying to
perform intialization anywhere else then we will get compile time error
   
Example:-
--------

class Test
{
    final int x;
        public void m1()
        {
            x = 10;
            }
            }Error: can not assing value to final variable x;

Final Static Variable:-
======================

1:If the value of a variable is not varied from object to object such type of variables are not recommended to
delcare as instance variables we have to declare those variable at class level by using  static modifier.

2:In the case of instance variables for every object a seprate copy will be created but in the case of,
static variable a single copy will be created at class level and shared by every object of that class.

3:For static variable it is not required to perform intialization explictly JVM will always provide default,
values

Example:-
--------
class Test
{
    static int x;
    public static void main(String[]args)
    {
        System.out.println(x)==>0;
        }
        }

           *********************************        
  *********e:order of modifer not required i*********
           *********************************        
4:If the static varible declare as final then compulsory we should perform intialization explictly otherwise we will get compile time error and JVM won't provide any default value.

Example:-
--------

class Test
{
    final static int x;
        }Error:variable x might not have been intialize

Rule:
    for final static variable compulsory we should perfrom intilization before class loading complition
    i.e the following are various places for this.

    1:At the time of declaration:
        class Test
        {
                final static    int x =10;
           } 2:Inside static block:
        class Test
        {
            final static int x;
            static
            {
                x = 10;
                }
         }
         These are the only possible places to perform intilization for final static variables if we are,
         trying to perfrom intialization anywhere else then we will get compile time error

         Example:-

         class Test
         {
            final static int x;
                public void m1()
                {
                    x = 10;
                    }
             }
             Error:cannot assing value to final variable x
Final Local Variables:-
=====================

Some time to meet temporaries requirement of programmer we have to declare variables inside a method or ,
block or constructor such type of variable are called Local variables or temporaries variable or stack varia-ble or automatic variables

For local variables JVM won't provide any default values compulsory we should provide intialization explictl-y Before using the local variable i.e if we are not using then it is not required to perform intialization for local variable.

Example:-
--------
                                          |   
class Test                                |  class Test
{                                         |   {
    public static void main(String[]args) |     public static void main(String[]args)
    {                                     |            {
        int x;                            |                 int x;
        System.out.println("Hello");      |            System.out.println(x)==>Error must be intialize
        }                                 |             }
        }==>allowed                       |       }
                                          |
                                          |
                                          |


Even thow local variable is final Before using only we have to perform intialization i.e if we are not usingthen it is not required to perform intialization Even thow it is final.

Example:-
--------

class Test
{
    public static void main(String[]args)
    {
            final int x;
            System.out.println("Hello");==>allowed
            }
            }

The only applicable modifier for local variable is final by mistake if we are trying to applying any other 
modifier then we will get compile time error.

Example:-
--------

class Test
{
    public static void main(String[]args)
    {
        public int x = 10;  |
        private int x = 10; |
        protecte in x = 10; |
        static int x = 10;  +-----Aall are invalid-
        tranjent int x =10; |
        volatile int x = 10;|
        }                   |
        final int x = 10; ==valid only


note:
if we are not declaring any modifier then by default it is default But this role is applicable only for
instance and static variables But not for local variabls.

Formal parameter of method simply access local variable of that method hence formal parameter can be declar-e as final 
If formal parameter declare as final within the method we can't perform reassingment. 

Example:-
--------
class Test 
{
    public static void main(String[]args)
    {
        m1(10,20);
    }
    public static void m1(final int x,int y)
        
        {                 |
        int x = 100;      +-----> we cannot assign value to final variable
            int y = 200;  |
            System.out.println(x+"------"+y);Error:
            }
            }
