                                 main method:
                                  ==========
whether class contain main method or not and whether main method is declare according to requirement or not these things won't be checked by compiler at run time JVM is responsible to check these
things if Jvm unable to find main method then will be get RE[run time exception]saying RE:No Suchme-thodError:main
Example:-
--------
        class Test
        {

        }
        $>javac Test.java;valid
        $>java Test:RE:NoSuchmethodError:main
==>At run time JVM always searches for main method with the follwoing prototype.


                    public         static            void           main       (String[]args)
            +--------------+     +----------------+   |              |---+       +c-line-arg
            |------------+ |     |---------+      | +-------------++---------------+
            |To call by jvm|     |withou existing | | main method ||this is the    |
            |from anywhere |     |object also     | | won't return||name which is  |
            +--------------+     |JVM have to     | | anythings to||confgure insdie|
                                 |call this method| |      jvm    ||     jvm       |
                                 +----------------+ +-------------++---------------+

==>The above syntax is very strict and if we performed any changed then we will get run time except-ion saying No Euch method Error:main

==>Even thow above syntax is very restrict the follwing chaned are acceptable, instead of public
   static we can take static public i.e the order of modifier the is not important.
==>we can declare string array in any acceptable form
Example:-
--------
        1:main(String[] args);valid
        2:main(String   []args);valid
        3:main(String   args[]);valid
==>instead of args we can take any valid java identifier
Example:-
        main(String[] durga);valid

==>We can replace string array with var-arg-parameter
        4:main(String.......args);  

==>we can declare main method with the following modifiers.
        final
        synchronized
        strictfp
   class Test
   {
   static final synchronized strictfp public void main(String..... durga)
   {
   System.out.println("valid main method");
   }
   }
Q:which of the follwoing main method are valid?.
        
        public static void main(String args);invalid
        public static void Main(String[]args);invalid
        public void main(String[]args);invalid
        public static int main(String[]args);invalid
        final synchronized strictfp public void main(String[]args);invalid
        final synchronized strictfp public static void main(String[]args);valid
        public static void main(String....args);valid

Q:In which of the above cases we will get compile time error?
  we won't get compile time error anywhere but except last two cases in remaining we will get 
  run time exception saying NoSuchmethodError:main

case1:
-----
overloading of the main method is possible but jvm will be always call string[]args main method onl-y the other overloaded method we have to call expilictly like normal method call.
Example:-
--------
        class Test
        {
        public static void main(String[]args)
        {
            System.out.println("String[]");
            }
        public static void main(int[] args)
        {
            System.out.println("int[]");
            }
        }
        o/p:String[]

case2:
-----
inheritance concept applicable for main method hence while executing child class if child doesn't 
contain main method then parent class main method will be executed.
Example:-
--------
       class P 
       {
        public static void main(String[]args)
        {
        System.out.println("parent main");
        }
        }
        class C extends P
        {

        }
        $>javac P.java
        $>javac C.java
        $>java P
        o/p:parent main
        $?java C
        o/p:parent main

        class P
        {
        public static void main(String[]args)
        {                                       -----+
            System.out.println("parentt main");      |
            }                                        |
        }                                            +----->it is method hiding not overriding 
        class C extends P                            |
        {                                            |
            public static void main(String[]args)    |
            {                                      --+
                System.out.println("child class");
                }
            }
            $>javac P.java
            $>java P
            parent main
            $>javac C.java
            $>java C
            child main
==>it since overriding concept applicable for main method but it is not overriding and it is
   method hiding. 
note:
    For main method inheritance and overloading concept are applicable but overriding concept 
   is not applicable instead of overriding method hiding is applicable.  

1.7V enhancement with main method:-
=================================
until 1.6v if the class dosn't contain main method then we will run time exception saying noSuch method Error:main
But from 1.7v onwards instead of noSuch method Error we will get more alloborated[described] error 
information:
Example:-
--------   1.6v                              |   1.7v
        class Test                           |  $>javac Test
        {                                    |  $>java Test;RE:main method not found in class Test,
            }                                |             please define the main method as;
        $>javac Test.java                    |             public static void main(String[]args)
        $>java Test;RE:NOSuchmethodError:main|
                                             |
==>from 1.7v onward main method is mandatory to start program execution hence even thow class 
   contain static block it won't be executed if the class dosn't contain main method. 
Example:-
--------
        class Test
        {
        static
        {
            System.out.println("static block");
            }
        }
        1.6v l                 |   1.7v
    $>javac Test.java          |   $>javac Test.java
    $>java Test                |   $>java Test;Error main method not found int class Test
   o/p: Static block           |
      RE:NoSuchmethodError:main|
                               |
Example:-
--------
        class Test
        {
            static
            {
            System.out.println("static Block");
            System.exit(0);
            }
        }

         1.6v         |      1.7v
   $>javac Test.java  |     $>javac Test.java
   $>java Test        |     $>java test
   o/p:static Block   |              Error:main method not found in class Test
                      |

Example:-
--------
        class Test
        {
            static
            {
            System.out.println("static Block");
            }
            public static void main(String[]args)
            {
            System.out.println("main method");
            }
            }
    1.6v               |    1.7v
    $>javac Test.java  | $>javac Test.java
    $>java Test        | $>java Test
    o/p:static Block   |      o/p:static Block
        main method    |          main method
                       |
                                     | 1.7v Follo:
1.6v Follow:                         |    +-------------+       +----------------+
  +--------------------+             |    | check for   |< -----+                |
  | identification of  |             |    | main()method|               +-------------------------+
  |   static block     |             |    +------+------+               | Error:main method not   |
  +--------+-----------+             |           |                      |      found in class Test|
           |                         |   +-------------------+          |      please define the  |
  +------------------------+         |   | identification of |          |      method             |
  |  Execute static block  |         |   |  of static member |          +-------------------------+
  |  &sttatic variable     |         |   +--------+----------+
  |       assignment       |         |            |
  +---------+--------------+         |   +--------------------+
            |                        |   |Excution of static  |
       +-------------+               |   |variable assignment |
       |  check for  | not available |   |  &static block     |
       |  main()     +-----------+   |   |                    |
       +-----+-------+           |   |   +--------------------+
             |if available       |   |
     +------------------+   +----+--------------+  
     | Execute main()   |   |RE:NoSuchmainError |  
     +------------------+   +-------------------+  
Q:Without writing main method is it possible to print some statement to the console?
    Yes by using static block But this rule is applicable until 1.6v but 1.7v onwards it is impossi   -ble to print some statment to console without writing main method.

Command Line Argument:-
======================
The arguments which are passing from command promot are called command line arguments
With these command line arguments JVM will create an array and by passing that array as argument
JVM will call main method. 
Example:-
--------
        java Test A B C
                  | | |-----------+
                  | +-+---+       |
                  args[0] args[1] args[2]

==>The main objective of command line argument is we can customized  behavior of the main method
   
Example:-
--------
        class Test
        {
            public static void main(String[]args)
            {
                for(int i=0;i<=args.length;i++)/"if we replace <= < then we won't get any exception"
                    {
                    System.out.println(args[i]);
                }
                }
            }
            $>java Test.java A B C
                        A
                        B
                        C
                    RE:AIOOBE
            $>java Test.java
                    RE:Array Index Of BoundError
Example:-
--------
        class Test
        {
            public static void main(String[]args)
            {
            String[] argh={"x","y","z"};
                args=argh;
            for(String s:args)
                {
                System.out.println(s);
                }
            }
        }
        $>java Test.java
        $>java Test A B C
        o/p:x y z
         $>java Test.java
         $>java Test A B 
         o/p:x y z
         $>java Test.java
         $>java Test A B 
         o/p:x y z
==>within main method command line arguments  are available in string form. 
Example:-
--------
    class Test
    {
        public static void main(String[]args)
        {
            System.out.println(args[0]+args[i]);-->1020
            }
    }
    $>java Test 10 20

===>Usally space itself is the seprater between commandline arguments if our command line argument
    it self contain space then we have to enclosed that command line argument within double quotes
Example:-
--------
        class Test
        {
            public static void main(String[]args)
            {
            System.out.println(args[0]);--Note book
            }
        }
        $>java Test "Note book"
---------------------------------------------------------------------------------------------------
