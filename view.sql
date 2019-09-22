                                      view
                                      ====

View is a database object which is used to provide table level security views are created from table those
table are also called as base  table.

note:[in baking sector we are using database concept only]

Generally view does not store any data thats' why view is also called as virtual table or window of a table.
In ALl relational databases based on the table view are Categorise into two view these are.

1:SIMPLE VIEW
2:COMPLEX VIEW OR JOIN VIEW

Simple view is a view which is created from only one base table where as complex view is a view which is created from multiple base table 

SIMPLE VIEW
-----------
syntax:
-------
create [or replace] view viewname as select * from tablename where condition;
DML OPERATION ON SIMPLE VIEW
----------------------------
In oracle we can also perform dml operation through simple view to base table based on following restriction.
these are

1:if a simple view having group function,group by clause distinct, rownum,set operators,joins then we can not perform dml operation though simple view to base table.

2:We must include base table primary key or not null column into the view then only we are allowed to perform insertion operation.through simple view to base table.[[only 10 downwards not 10onwards]]

Example:
sql>create or replace view v1 as select * from emp where deptno=10;
sql>select * from v1;

sql>insert into v1(empno,ename,deptno)values(1,'murli',30);
example2:
sql>create or replace VIEW v2 as select ename ,sal,deptno from emp where deptno=10;
sql>select * from emp v2;
sql>insert into v2(ename,sal,deptno)values('abc',1000,10);

In all relational databases whenever we are creating a view then automatically view definition are (select statement) automatically permanently stored in database in oracle if you want to view these definition then we are using text properties from user_views data dictionary 
Example:
desc user_views;
sql>select text from user_views where view_name='V1';

TEXT
--------------------------------------------------
select "SNO","NAME" from base

Generally in all relational databases we can also used views for simplifying complex query purpose ie
regular usedly complex query. are putting in view then only we are requesting views whenever necessary by using select * from viewname

Generally in all relational databases if any view having function are expression then we must create ALIAS
-NAME for those function or expression
Otherwise database server return ERROR

Example1:

sql>CREATE OR REPLACE VIEW V1 AS SELECT DEPTNO,MAX(SAL)FROM EMP GROUP BY DEPTNO;
ERROR:must name this expression with a column alias
[Alias name of expression[Function,rownum,join,set,etc]]

solution:
---------
sql>CREATE OR REPLACE VIEW V1 AS SELECT DEPTNO,MAX(SAL)A FROM EMP GROUP BY DEPTNO;

sql>select * from v1;
| deptno | A |
|--------+---|
| 10     |   |
| 20     |   |
| 30     |   |

sql>desc user_views;
sql>select text from user_views whre view_name='V1';
TEXT:
--------------------------------------------------
select deptno,max(sal)a from emp group by deptno;

note:
In oracle when view having rownum pesudo column also then we must create alis name for that rownum Otherwise
ORACLE SERVER return ERROR.
Example2:
sql>create or replace view v2 as select rownum,ename from emp where rownum<=2;

ERROR:must name this expression with a column alias 

solution:
---------
sql>CREATE OR REPLACE VIEW VIEW AS SELECT ROWNUM r,ENAME FROM EMP WHERE ROWNUM<=2;

sql>select * from v2;

| R | ENAME |
|---+-------|
| 1 | SMITH |
|---+-------|
| 2 | ALLEN |

TESTING:
========
sql>desc user_views;
sql>select text from user_views where view_name='V2';

Text:
--------------------------------------------------
select rownum r,ename from emp where rownum<=2;

COMPLEX VIEW or JOIN VIEW:
==========================
Complex view is a view which is created from multiple base table.
Generally in all relational databases we cant not perform dml operation in complex view.

Example1:
sql>create table test1(name varchar2(10));
sql>create table test2(sub varchar2(10));

complex view:
-------------
sql>create or replace view v3 as select name,sub from test1,test2;

sql>insert into v3(name,sub)values('murli','oracle');

ERROR:cannot modify a column which maps to a non key-preserved key

MATERIALIZED VIEW:
------------------

Oracle 8i introduced materialized view materialized views also created from base table. Generally materialized-view are created by database administrator and also materialized view are used in DATA warehousing Applic-ation.

Generally view does not store any data where as materialized view stores data.

syntax:
create materialized view viewname as select statement

DIFFERENCE B/W VIEW,MATERIALIZED VIEW
=====================================
            VIEW                            MATERIALIZED VIEW                                    |

1:view does not store any data          |1:Materialized view can store data
2:Security purpose                      |2:Improve performance purpose
3:when we are dropping a base table then|
  view cannot be accessible             |3:when we are dropping base table also then materialized view can be
                                        | accessible.
4:                                      |4:In materialized view we cannot perform dml operations



In oracle before we are creating materialized view then database administrator must give create any materialized view permission to user by using following syntax otherwise oracle server returns error.

syntax:
--------
grant create any  materialized view to username;

Example:

sql>conn scott/tiger;
sql>create materialized view mb1 as select * from emp;
ERROR:insufficient privileges;

solution:
sql>conn sys as sysdba;
sql>grant create any materialized view to scott
sql>conn scoot/tiger;
sql>create materialized view mb1 as select * from emp;
Materialized view cread.

note1:
when we are creating views if oracle server returns insufficient privileges error then also database,
administrator must give create any view permission to user by using following syntax.

SYNTAX:
-------
GRANT CREATE ANY VIEW TO USER;
EX:
sql>conn scott/tiger;
sql>create or replace view v1 as select * from emp where deptno=10;

Error:insufficent privileges

solution:
sql>conn sys as sysdba;
[If you are using oracle12c then you must also connect to pluggable database before grant permmission]
[alter session set container=pdb1]
sql>grant create any view to scott;
sql>conn scott/tiger;
sql>create or replace view v1 as select * from emp where deptno=10;

note2:

prior to oracle 11g when ever we are creating materialized view on of the materialized view based table,
must have primary key otherwise oracle server return error.[[BUT NOT IN 12C]]

Example:

sql>create table test(sno number(10));
sql>create materialized view mb2 as select * from test;
Error:table 'TEST' does not constain a primary key constraint

EXAMPLE:
sql>create table base(sno number(10),primary key,name varchar2(10));
sql>insert into base values(....);
sql>select * from base;
       | SNO | NAME |
       |-----+------|
       | 1   | a    |
       | 2   | b    |
       | 3   | c    |
       | 4   | d    |
       |-----+------|
sql>create materialized view mc1 as select * from base;
Materialized view created

here materialized view also same as view because whenEver we are creating materialized view also,materialized view definition are automatically stored in oracle database same like view definition

In oracle if you want view materialized view definition then we are using user_mviews data dictionary.

EXAMPLE:
sql>desc user_mviews;
sql>select query from user_mviews where mview_name='MC1';

Execution:
==========

in Oracle whenever we are creating view then automatically view definition are permanently stored in
oracle database whenever we are requesting view by using
SELECT * VIEWNAME then oracle server automatically execute view definition that's in this case corresponding base table are effected i.e when we are requesting view more no of times also then each and every time,
base table are effected because in each and every time view definition are executed.

In oracle whenever we are creating materialized view then oracle server automatically stored query result,
within materialized view and also materialized view definition are internally automatically stored in,
dataDictionary whenever user requesting materialized view by using SELECT * FROM MATERIALIZED VIEWNAME
then oracle server directly retrieve data from materialized view that's why in this case materialized view,
definition are not executed that's why materialized base table also never effected but when we are refreshing materialized view then only oracle server execute materialized view definition and in this case only 
materialized view and base table are effected..that's why materialized view improve performance compare to 
view because in materialized view corresponding base tables are effected very less no of times compare to 
corresponding views base tables

EXAMPLE:
sql>select * from v1;

| sno | name |
|-----+------|
| 1   | a    |
| 2   | b    |
| 3   | c    |
| 4   | d    |

sql>select * from mc1;
| sno | name |
|-----+------|
| 1   | a    |
| 2   | b    |
| 3   | c    |
| 4   | d    |

sql>SELECT ROWID,SNO,NAME FROM BASE;
sql>SELECT ROWID,SNO,NAME FROM V1;
here view rowid are also same as base table rowid thats why view are stored any data thats why view is also called as virtual table or window of table.
But through the view we can access base table data

sql>select rowid,sno,name from base;
sql>select rowid,sno,name from mc1;
here materialized view rowid are different from base table rowid thats why materialized view stores data,

sql>SELECT * FROM BASE;
| sno | na |
|-----+----|
| 1   | a  |
| 2   | b  |
| 3   | c  |
| 4   | d  |

sql>UPDATE BASE SET NAME=UPPER(NAME);

| SNO | NAME |
|-----+------|
| 1   | A    |
| 2   | B    |
| 3   | C    |
| 4   | D    |

sql>select * from mc1;
    
| sno | name |
|-----+------|
| 1   | a    |
| 2   | b    |
| 3   | c    |
| 4   | d    |


Materialized view also stores data same like table but when we  are refreshing materialized view synchronize based on base table

In oracle if you want to refresh materialized then then we are using following syntax
SYNTAX:
------
sql>exec dbms_mview.refr|sh('materialized viewname')
          ---+----      +----+
             |packages name  +--procedure name

exec dbms_mview.refresh('mc1');
sql>select * from mc1;

| sno | name |
|-----+------|
| 1   | A    |
| 2   | B    |
| 3   | C    |
| 4   | D    |
[note: in this case rowid changed]

Oracle having two types of materialized view.

1:COMPLETE REFRESH MATERIALIZED VIEW.
2:FAST REFRESH MATERIALIZED VIEW.

1:Complete refresh Materialized view.
====================================>
in oracle by default materialized view are complete materialized view these materialized view does not give,
more performance when we are refreshing materialized view more no of times because in these materialized vie-w,internally rowid are recreated when are we refreshing materialized view.

SYNTAX
-------
sql>create materialized view viewname |refresh complete as select statement
                                      +-------------+-[KEYWORD]
WhenEver we are using complete materialized views an| also when we are refreshing these materialized view then oracle server Internally automatically TRUNCATE materialized view that's why rowid are changed,when we,
are refreshing materialized view To over come this problem oracle provide fast refresh Materialized view.

example of complete refresh materialized view:-
===============================================>
sql>select rowid,sno,name from mc1;

sql>exec dbms_mview.refresh('mc1');

sql>select rowid,sno,name from mc1;
(here rowids are changed)
+---------------------------------------------------------------------------------------------------------+
|If you are adding new column after dbms_mview execution then again updation for column and data will get | Error.
+---------------------------------------------------------------------------------------------------------+

2:FAST REFRESH MATERIALIZED VIEW:-
=================================>

Fast refresh materialized views is also called as incremental refresh materialized views fast materialized,
view gives more performance then then complete materialized view because in fast refresh materialized view rowid are never changed when we are refreshing materialized views more no of times also 

SYNTAX:
-------
sql>create materialized view viewname |refresh fast as select statement;
                                      +--[KEYWORD]
Before we are creating fast materialized view then we must create MATERIALIZED VIEW LOG on base tables,
by using following syntax Otherwise oracle server return Error.

SYNTAX:
--------
create materialized view log on base table;
[Make sure table contain primary key oracle 12c]

Materialized View Log:
=====================>
Before we are creating fast refresh materialized view                                                        then we need a mechanism to capture any changed made to its base table this mechanism is also called as|
materialized view log.                                                                                                                                                                                              |
these changed automatically store in data Dictionary and also when ever refreshing fast refresh materialized view then oracle server directly retrieve data from data dictionary thats why in this case materialized never,changed

EXAMPLE:
sql>create MATERIALIZED view log on base;

sql>create Materialized view mc2 refresh fast as select * from base;

sql>select rowid,sno,name from base;
sql>update base set name='xy'where sno=1;

sql>select rowid,sno,name from mc2;

sql>exec dbms_mview.refresh('mc2');
sql>select rowid,sno,name from mc2;
(here rowids are never changed)
+---------------------------------------------------------------------------------------------------------+
|If you are adding new column after Log creation then again updation for column and data will not update || 
+--------------------------------------------------------------------------------------------------------++
ON DEMAND/ON COMMIT:-
-------------------->
In oracle we are refreshing materialized view in two ways these are.
1:MANUALLY
2:AUTOMATICALLY

1:Manually:-
In this method we are refreshing materialized view by using dbms_mview packages this method is also called,
as ON DEMAND method by default method is ON DEMAND 

2:Automatically:-
----------------->
In this method we can also refresh materialized view automatically without using dbms_mveiw [packages]
This method is also called as ON COMMIT method

Syntax:
create materialized view view name refresh COMPLETE/refresh FAST on DEMAND/on commit as select statement;


EXAMPLE:

sql>select * from base;
        | SNO | NAME |
        |-----+------|
        | 1   | XY   |
        | 2   | B    |
        | 3   | C    |
        | 4   | D    |

sql>create materialized view mc5 refresh fast on commit as select * from base;
+-------------------------------------------------------------------------------------------------------+
|[We can not create without primary key on fast refresh materialized view]And also log must be required]|
+----------------------------------+--------------------------------------------------------------------+-+
                                   |Make sure change after log creating add new column into base;        |
                                   |then it will not effect to mview table it will always retrieve from log|
                                   |inside log new column information is not available that's why         |
materialized view is created.      +----------------------------------------------------------------------+

sql>select * from mc5;

        | SNO | NAME |
        |-----+------|
        | 1   | XY
        | 2   | B    |
        | 3   | C    |
        | 4   | D    |

sql>update base set name='zz' where sno=2;
sql>select * from base;
        | SNO | NAME |
        |-----+------|
        | 1   | XY   |
        | 2   | ZZ   |
        | 3   | C    |
        | 4   | D    |

sql>select * from mc5;

        | SNO | NAME |
        |-----+------|
        | 1   | XY   |
        | 2   | B    |
        | 3   | C    |
        | 4   | D    |
        
sql>commit;

sql>select * from mc5;

        | SNO | NAME |
        |-----+------|
        | 1   | XY   |
        | 2   | ZZ   |
        | 3   | C    |
        | 4   | D    |

**********************************************************************************************************
 ---------------------------------------------------------------------------------------------------------
| Complete refresh materialized     | Fast refresh materiaized view or commit on demand                  |
|-----------------------------------+--------------------------------------------------------------------|
| When we are performing updation,  | When we are performing updation/insertion operation on base table, |
| operation then automatically all, | then F materialized view change only particular row of rows id,and |
| rows of rowid will changed.       | remaining all address will be same but in this case commit not     |
|                                   | any address will be changed.
**********************************************************************************************************


 DATA CONTROL LANGUAGE(DCL) |

=====================
1:GRANT
2:REVOKE

create a user
================
sql>conn sys as sysdba;
or 
sql>conn system/manager;

sql>create user username identified by password;
sql>grant connect,resource to username;
sql>conn username/pasword;


EXAMPLE:
sql>conn sys as sysdba;
Enter password:sys

sql>create user murali identified by murali;

sql>grant connect,resource to murali;

sql>conn murali/murali;

sql>select * from emp;

ERROR;table or view does not exist

sql>conn scott/tiger;
sql>grant all on emp to murali;

sql>conn murali/murali;
ERROR:table or view does not exist

sql>select * from scott.emp;

PRIVILEGE
=========

Privilege is write given to the user or privilege is also called as permission 

In all relational databases data security point of view every user having two types of privileges.

1:System Privileges:
2:Object Privilege:

By using grant command we are allowd to view these system object priviege into the another user and also,
by using revoke command we are allowd to cancelld these system or object privilege from user.

SYSTEM PRIVILEGES:
===================

Who recieve system privileges then those users are allowed to create database object or allowed to drop,
database object Oracle having more then 80 system privilege [predefine command] these are.

create session
,create table,
create any view
create any materialized view
create trigger
create procedure,
create any index
SYNTAX:
grant systemprivilege to username1,username2,...;

note:
These system privilege are given by databasee administator only

create session:
===============

In oracle if any user want to connect the oracle database then that user must have create session system,
privilege otherwise oracle server return Error

EXAMPLE:
sql>conn sys as sysdba;
sql>create user india identified by india;

sql> conn india/india;

ERROR:user INDIA lacks CREATE SESSION privilege; logon denied;


solution:
---------
sql>conn sys as sysdba;
sql>grant create session to india;

sql>conn india/india;

in oracle if you want to view system privilege related to particular user then we are useing following selec-t statment

SYNTAX:

sql>select * from session_privs;

sql>conn india/india;
sql>select * from session_privs;
PRIVILEGE
------------------
example:
sql>conn sys as sysdba;
sql>grant create procedure,create trigger,create any materialized view to scott,murli;

ROLE:-
======
Role is nothing but collection of system privileger oracle having two types of role.
there are :
1:user defined roles.
2:predefined roles.
user defined role:-
==================
user defined roles are created by database administator only Generally in multi user enviroment so many,
employees are working on same project in that case so many employee requireds same set of system privilegers,In this case only database administator create role and then assinged command set o system privileger 
and then only those roles are divide into no of users
         system prvie     +----+
 --------------------|    |    |
                     +----+ROLE| -------------user1
 --------------------|    |    |              user2
                          +----+

In oracle user define role are created by using follwoing three step process.

1:create a role:
2:assign system privilegs into role.
3:assing rolename to number of users;

CREATE A ROLE
=============

SYNTAX:
-------
create role rolename;

ASSING SYSTEM PRIVLEGES INTO ROLE
=================================
syntax:

grant system privileges to rolename;

ASSING ROLENAME TO NUMBER OF USER
==================================
syntax:
grant rolenmae to user1,user2,.....;

EXAMPLE:

sql>create role r1;
sql>grant create procedure,create trigger,create any materialized view to r1;

sql>grarnt r1 to scott , murali;
+-----------------------------------------------------------------------------------------------------------
|Now we are able to create view,materialized view becauseo role permission you can so give user permission]|
+----------------------------------------------------------------------------------------------------------+
In oracle if you want to view system privilege related to role then we are using role_sys_privis data dictio-nary

sql>desc role_SYS_privis;
sql>select role,privilege from role_sys_privs where role='R1';

| ROLE | PRIVILEGE                    |
|------+------------------------------|
| R1   | CREATE TRIGGER               |
| R1   | CREATE ANY MATERIALIZED VIEW |
| R1   | CREATE PROCEDURE             |

predefined roles:
=================

Whenever we are installaing oracle server then automaticaly three predefined roles are created within oracle-database

1:CONNECT(end users)
2:RESOURCE(developer)
3:DBA:(adminstrator);
***********************************************************************************************************
 ----------------------------------------------------------------------------------------------------------+
"In oracle 12c whenever we are connect to any user then we are typing conn username/password@pdb1 here you,|
see username/password along with pdb also type because of user conflict we are specifying this user belong,|
to pdb1 or same user belong to training[other pluggable data base name]You can also create same user nameIn|different pdb name"
 -----------------------------------------++---------------------------------------------------------------+
Example:                                  ||
sql>alter session set container=pdb1;     ||                                                           |
sql>create scott identified by tiger      ||
sql>alter session set container=training; ||
sql>create scott identified by tiger;     ||
user created.                             ||
 -----------------------------------------++
-------------------------------------------+
In oracle if you want view predefined roles and also related system privileges then we are using role_sys_privs data dictionary 
EXAMPLE:
sql>conn sys as sysdba;
sql>desc role_sys_privs;
sql>select role,privilege from role_sys_privs where role in('CONNECT','RESOURCE');

| ROLE     | PRIVILEGE        |
|----------+------------------|
| RESOURCE | create sequence  |
| RESOURCE | create trigger   |
| RESOURCE | create  cluster  |
| RESOURCE | create procedure |
| RESOURCE | create type      |
| RESOURCE | create operator  |
| connect  | create session   |
| RESOURCE | create table     |
| RESOURCE | create indextype |


sql>select role,privilege from role_sys_privs  where role in('DBA');

note:In oracle connect role internally having createe session system privileges which is used to users are,
allowed to connect to the oracle database.


Object privileges:-
===================

object privileges are given are either database developers or database administrator who recieve object,
privileges then those users are allowed to perform operation on the object.

Oracle having INSERT,UPDATE,DELETE,SELECT object privilegers these object privileges also represented by,
using ALL keyword 

Oracle also support execute,read,write,object privileges in pl/sql.

Syntax:

grant object privileges on objectname to usernames/rolename/public;

EXAMPLE:
sql>conn scott/tiger;
sql>grant all on emp to murali;
sql>conn murali/murali;
sql>select * from scott.emp;

note:
#If you create materialized view from scott.emp using murali user then Error will get
#sql>create materialized view mv1 as select * from scottt.emp where deptno=0;
#Error:No privileges on tablespace 'USER'
#solution:
#here we can also see already we given materialized view permission also getting error here creating error is not this ERROR is inserting error 
#VERIFY:
#sql>CREATE MATERIALIZED VIEW MV2 AS SELECT * FROM SCOTT.EMP WHERE 1=2[here materialized view is created but data will not insert ]
#+------------------------------------------------------------------------+
#|You cannot insert data because you have quota of 0 on the tablespace    |
#+------------------------------------------------------------------------+
SOLUTION:
+--------------------------------------------------------+
|   sql>conn as sys as sysdba;                           |
|   sql>alter session set container=pdb1;                |
|   sql>alter user hector quota unlimited on usera;      |
|   here users is predefined tablespace name             +--------------------+
|                                                                             |
|VIEW PREDEFINE TABLESPACE NAME:                                              |
================================                                              |
|sql>select username,default_tablespace from dba_users where username='XXXX'  |
+--------------------------------------------------------+--------------------+
note:
In oracle we can also give object privileges on specific columns by specifying those columns within ()
EXAMPLE:
sql>grant update(ename,sal)on emp to murali;

With grant option:-
===================
with grant option is an optional clause used along with object privilege who recevies with draw grant clause then those users allowed to give some object privilege to another user

SYNTAX:
grant objectprivilege on objectname to usernames/public with grant option.

note:In oracle with grant option clause does not work with roles 
EXAMPLE:
sql>grant all on emp to r1 with grant option;

ERROR:cannot GRANT to a role with Grant option.


| sql>conn scott/tiger           | sql>conn murali/murali            | sql>conn a1/a1         |
|--------------------------------+-----------------------------------+------------------------|
| sql>grant all or emp to murali | sql>select * from scott.emp       |                        |
| [solution]                     |                                   | sql>select * from emp; |
| sql>grant all on emp to murali | sql>grant all on scott.emp to     |
| with grant option;             | a1;Error:no privilege to grant    |
| sql>                           | sql>grant all on scott.emp to a1; |

In oracle all object information  store under user_tab_privs dataDictionary

EXAMPLE
sql>desc user_tab_privs

REVOKE:
======>


REVOKE command is used to cancalled either system or object privileges from users 

Syntax;

1):revoke systemprivileges from username,,,,,;

Syntax:

2):revoke objectprivileges on objectname from usernames/rolename/public;

EXAMPLE:

sql>conn sys as sysdba
sql>create user u1 identified by u1;
sql>grant connect to u1;
sql>conn u1/u1;

sql>select * from session_privs;

PRIVILEGES
==========
create session

sql>conn sys as sysdba;
sql>revoke connect from u1;
revoke succeeded.
****************************************************************************************************
[Make sure in oracle 12c sql>revoke create session,resource from hector in this case only]
****************************************************************************************************
sql>conn u1/u1;
Error:user u1 lacks create session privilege; logon denied

warning:you are no longer connected to oracle.

example:
sql>conn sys as sysdba;

sql>revoke all on scott.emp from public;
revoke succeeded.
example2:
sql>conn scott/tiger;
sql>revoke all on emp from hector;
note:grant with option permission here not work until the parent grant revoke by grand parent revoke.
 ---------------------------------------------------------------------------------------------------------+
example:                                                                                                  |
sql>grant all on emp to hector grant with option;                                                         |
sql>conn hector/oracle;                                                                                   |
sql>grant all on scott.emp to annie;                                                                      |
sql>conn scott/tiger;                                                                                     |
sql>revoke all on emp to annie;[here it wil not work because of this user given permission by hector user,|
so revoke all on emp to hector then automatically annie user also effect]                                 |
----------------------------------------------------------------------------------------------------------+
note:
In oracle before we are giving create table system privileges to user then we must give UNLIMITED TABLESPACE
system privilege to user otherwise oracle server returns error.

EXAMPLE:
sql>conn sys as sysdba;
sql>creat user u2 identified by u2;
sql>grant connect to u2;
sql>conn u2/u2;
sql>create table h1(sno number(10)
Error:insufficent privileges.

sql>conn sys as sysdba;
sql>grant create table to u2;

sql>conn u2/u2;
sql>create table h2(sno number(10));
Error:01950 no privileges on tablespace 'users'
|-------------------------------------------------------------------------------------------------------+
|But inthis case view is create without given any kind of error,but not materialized view because of    |
|aterialized view storeing data but view does not]                                                      |
+-------------------------------------------------------------------------------------------------------+
|OLUTION:
+---------

sql>conn sys as sysdba;
sql>grant UNLIMTED TABLESPACE to u2;
|
sql>conn u2/u2;
|
sql>create table h1(sno number(10));
|
table created.
|
In oracle if you want give object privilege on view to another user then we are using following syntax:
SYNTAX:
+-------
grant objectprivileges on viewname to usernme1,username2,.....;

**********************************************************************
DBMS ARCHITECTURE(or)ansi/sparc architecture(or)3 level architecture:-
======================================================================

Ansi[American national institute] has established Three level architecture for DBMS this architecture is,
also called as ANSI/SPARC(standard planning and requirements commitee)

ain objective of DBMS architecture to seprate users view of the database from the way physically how data,
store within the database.

DBMS architecture having Three level these are:

1:Conceptual level
2:External level
3:Internal level
 ----------------------------------+
database object:table,view,synoym, |
-----------------------------------+


          +------------+ +------+ +-----------+
          |  view1     | | view2| |   view3   |        view synonym
          +--------+---+ ++-----+ +-+---------+
   external level  |      |         |
                   |      |         |
   Logical data--->|      |         |
                  ++------+---------++
                  |conceptual level  |     Table
                  +-------+----------+
                          ^           
                          |           
                          |           
                  +-------+----------+
                  | Internal level   |     index,cluster
                  +-------+----------+
                          |           
                          |           
                          |           
                +---------+------------|
                |                      |
                |                      |
                |   DATABASE           | 
                |                      |
                |                      |
                +----------------------+


Three Level Architecture provide data independence:

DATA INDEPENDENCE
=================
Upper level are uneffected by chainging in lower level is called data independence.
All database having two types of data independences these are:

1:Logical data independence .
2:Physical data independence.


Logical data independence:
--------------------------
When ever changed made in conceptual level then we are not required to changed external level is called,
Logical data independence.

In oracle whenever we are adding new column into the  table within conceptual level the structure of the,
view will not be effected in external level is called logical data independence in oracle.

EXAMPLE:
--------
sql>conn scott/tiger;
sql>create or replace view v1 as select * from emp where deptno=10;
sql>grant all on v1 to murali;
sql>conn murali/murali;
sql>select * from scott.v1;


TESTING:
========
sql>conn scott/tiger;
sql>alter table emp add address varchar2(10);
sql>select * from emp;
sql>grant all on v1 to murali;
sql>conn murali/murali;
select * from scott.v1;
[here you can see address column is not available]

Physical Data Independence:
===========================

When ever changed made in internal level then we are not required to changed conceptual level is called,
physical data independence 

Example:
In oracle when ever we are adding index in internal level then structure of table will not be effected,
At conceptual level is called Physical data independence.
                                                     
Conceptual Level:
=================
Conceptual level define logical structure of the database however this level does not define How data,
store physically in data base.ie. is it defines what type of data can be store in database by specifying dat-type and size and also conceptual defines What type of data cannot be stored in database by specifying,
constraints 

EXAMPLE:(conceptual level)
========
sql>create table bank(accno number(10)primary key,name varchar2(10),bal number(10));

sql>insert into bank values(1001,'murali',9000);

sql>select * from bank;
| ACCNO | NAME   | BAL  |
|-------+--------+------|
| 1001  | MURALI | 9000 |

sql>insert into bank values(1001,'abc',4000);
Error:unique constraint voilated

External Level:
===============
External Level defines indevidual users view of database

Generally data is confidential within relational database that's why data security point of view,database,
administators create views from the conceptual level and then only those view given to the no of users.

Then only number of users allowed to access portion of data from the conceptual level this is called,
table security 

Uses of view:
=============
In all relational databases view are used in following three purpose.

1:Simplifying complext querys
2:Acheving logical data independence
3:Providing table level security

Force view:
-----------
In oracle we can also create a view without having any base table these type of view are also called as.
force view or forced view.

Syntax:
create or replace force view viename as select * from anyname;
Example:
sql>create or replce force view v1 as select * from hyd;
Warning:view created with compilation errors.
sql>create table hyd(sno number(10),name varchar(10));
sql>alter view v1 compile;
sql>desc;

with check option:
------------------
With check is an optional clause used along with where condition within views
Generally if you view having with check optional then we are not allowed to insert other then where condition value through view to base table.

Generally If you want provide constraint type mechanism on views then we are using with check optional 
clause,
Syntax:
create or replace view viewname as select * from tablename where condition with check option;

EXAMPLE:
sql>create or replace view v1 as select * from emp where deptno=10 with check option;

sql>select * from v1;
sql>insert into v1(empno,ename,deptno) values(1,'murali',30);
ERROR:VIEW WITH CHECK OPTION where-clause violation.

sql>insert into v1(empno,ename,deptno)values(2,'abc',10);

Read only views:
----------------
In oracle when view having read optional clause then we can not perform dml operation through view to base,
table these type of view are also called read only views.

syntax:
create or replace view viewname as select * from tablename with read only;

Ex:
sql>create or replace view v3 as select * from emp where deptno=10 with read only 
view created.

TESTING:
sql>delete from v3 where deptno=10;
Error:cannot delete from view..

In oracle we can also drop a view by using drop view viewname;





