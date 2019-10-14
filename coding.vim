                              Java Coding Standard
                              ====================
==>when ever we are writing java code it is highly recomended to follow coding standard.
==>when ever we are writing any component its name should refelect the purpose of that component[f    -unctionality]the main advantage of this approach is readabilities and maintainability of the 
    code willbe improved.
Example:-
--------
        class A                   |             package com.durgasoft.scjp
        {                         |             public clsss Calculator
        public int m1(int x,inty) |             {
        {                         |               public static void  add(int number1,int number2)
            return x+y;           |
        }                         |               {
        }                         |                   return number1+number2;
        Amerpeet Style            |              }
                                  |         HI-Tech-City Style.

Coding Standard for Classes:-
============================
usally class name are Nouns should starts with upper case character undefeate contain multi word
Every inner word should start with upper case character.
Example:=-
--------
        String
        StringBuffer
        Account
        Dog

coding standard for interfaces:-
==============================
usually interface name are adjectives,should start with upper case character and if we contain 
multiple word every inner word should start with upper case character.
Example:-
--------
        Runnable
        Serializable
        comparable

coding standard for method:-
==========================
usually method name are either verbs or verb-noun combination should start with lower case alphabet
symbol and if contain multiple word then every inner word should start with upper case character
[camel case convention]
Example:-
        print()  | getName()
        sleep()  | setSalary()
        run()    |
        eat()    |
        start()  |
coding standard for variable:-
============================
usuually variable name are nouns should start with lower case alphabet symbol and if it contain 
multiple word then every inner word should start with upper case character.[camel case convention]
Example:-
--------
        name
        age
        salary
        mobileNumber

coding standard for constant:-
=============================
usually constant names are nouns should contain only upper case character and if it contains multip-le words then these words are seprated with _[underscored symbol]
Example:-
--------
        MAX_VALUE;
        MAX_PRIORITY;
        NORM_PRIOPRITY;
        MIN_PRIORITY
        PI
note:-
usually we can declare constant with public static and final modifers.

java bean coding standard:-
==========================
A java Bean a simple java class with private properties and public getter and setter method.
Example:-
--------
        public  class StudentBean
        {
            private String name;
            public static setName(String name)
            {
                this.name = name;
              }
            public String getName()
            {
            return name;
            }
          }
Syntax:-[setter method]
--------
1:it should be public method,return type should be void,method name should prefix with set,itshould
take some argument i.e it should not be no argument method.

Syntax:-[getter method]
--------
        1:it should be public method.
        2:The retun type should not be void.
        3:method name should prefix with get.
        4:it should not take any argument.
note:*
    for boolean properties getter method name can be prefix with either get or is But recomended to
    use is.
Example:-
--------
        public boolean getEmpty()
        {
        }
          
        public boolean isEmpty()
        {
        return empty;
        }
coding standard for listeners:-
==============================
case1:
-----
To register a listeners
-----------------------
Method name should be prefix with add.
Example:-
--------
        public void addmyActionListener(myActionListener l)[valid
                         ------------>  --------------->[both must be same]
                         
        public void registermyActionListener(myActionListener l)[invalid

        public void addmyActionListener(ActionListener l)[invalid]
case2:
-----
unregister a listeners
---------------------
method name should be prefix with remove.
Example:-              +-----[compulsories should be remove only]
--------               |
        public void removemyActionListener(myActionListener l)[valid]
                    --------------------->  --------------->[both are same]
        public void unregisterActionListener(myActionListener l)

        public void removeActionListener(ActionListener l)

        public void deletemyActionListener(myActionListener l)


