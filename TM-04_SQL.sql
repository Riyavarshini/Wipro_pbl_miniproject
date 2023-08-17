REM   Script: Employee_Details
REM   SQL MINIPROJECT

--Employee Details
 
--CREATING MENTIONED TABLE
CREATE TABLE SKILL_Details ( 
    Skill VARCHAR2 (30) , 
    Skill_Desc VARCHAR2 (30), 
    CONSTRAINT pk_skilld PRIMARY KEY (Skill) );

CREATE TABLE LODGE_Details ( 
    Lodge_Name varchar2 (30), 
    Lodge_Manager varchar2(30) NOT NULL, 
    Lodge_Address Varchar2 (30), 
    CONSTRAINT pk_lodgeD PRIMARY KEY (Lodge_Name));

CREATE TABLE EMP_Details ( 
    Empno int , 
    First_Name varchar2 (30) NOT NULL, 
    Last_Name Varchar2 (30) NOT NULL, 
    Lodge_Name varchar2 (30), 
    CONSTRAINT pk_empd PRIMARY KEY (Empno), 
    CONSTRAINT fk_empd_lodged FOREIGN KEY (Lodge_Name)  
    REFERENCES Lodge_Details (Lodge_Name) );

CREATE TABLE EMP_Skill ( 
    Empno integer , 
    Skill varchar2 (30), 
    Grade Number (10), 
    CONSTRAINT pk_empskill PRIMARY KEY (Empno,Skill), 
    CONSTRAINT fk_empskill_empd FOREIGN KEY (Empno) 
    REFERENCES EMP_Details (Empno), 
    CONSTRAINT fk_empskill_skilld FOREIGN KEY (Skill) 
    REFERENCES SKILL_Details (Skill) );

--INSERTING DATA INTO THE TABLES
INSERT INTO LODGE_Details (Lodge_Name , Lodge_Manager,Lodge_Address) values ('Jessy Lodge','Rajan', 'Rakesh Nagar');

INSERT INTO LODGE_Details (Lodge_Name , Lodge_Manager,Lodge_Address) values ('Rajesh Lodge','Rajani', 'Anna Nagar');

INSERT INTO LODGE_Details (Lodge_Name , Lodge_Manager,Lodge_Address) values ('Gooday Lodge','John', 'Sea Road');

INSERT INTO EMP_Details (Empno , First_Name,Last_Name,Lodge_Name) values (101,'James', 'Jackson','Rajesh Lodge');

INSERT INTO EMP_Details (Empno , First_Name,Last_Name,Lodge_Name) values (102,'Kalpash', 'Raj','Gooday Lodge');

INSERT INTO EMP_Details (Empno , First_Name,Last_Name,Lodge_Name) values (103,'Jasmine', 'Joy','Jessy Lodge');

INSERT INTO SKILL_Details (Skill , Skill_Desc) values ('Oracle SQL','Oracle Corporation');

INSERT INTO SKILL_Details (Skill , Skill_Desc) values ('Dot Net','Microsoft');

INSERT INTO SKILL_Details (Skill , Skill_Desc) values ('Sybase','SAP Corporation');

INSERT INTO EMP_Skill (Empno,Skill , Grade) values (101,'Oracle SQL',9);

INSERT INTO EMP_Skill (Empno,Skill , Grade) values (101,'Sybase',8);

INSERT INTO EMP_Skill (Empno,Skill , Grade) values (102,'Dot Net',9);

INSERT INTO EMP_Skill (Empno,Skill , Grade) values (103,'Oracle SQL',8);

-- EMPLOYEE NO 101 CHANGED HIS LODGE TO GOODAY LODGE

UPDATE EMP_Details 
SET Lodge_Name = 'Gooday Lodge' 
WHERE Empno = 101;

---- REMOVING DETAILS OF RESIGNED EMPNO=103

DELETE FROM EMP_skill WHERE Empno = 103;

DELETE FROM EMP_Details WHERE Empno = 103;

-- REPORT FOR HR DEPARTMENT
-- A. EMPLOYEE WITH SYBASE
SELECT *  
FROM EMP_Details 
WHERE Empno = ( 
    SELECT Empno  
    FROM EMP_Skill  
    WHERE skill = INITCAP('SyBAse'));

-- B. DISPLAY Firstname,skill,lodge manager

SELECT first_name, skill, lodge_manager 
FROM emp_details a, EMP_Skill b, Lodge_details c 
WHERE (a.empno IN b.empno) AND (a.Lodge_name IN c.Lodge_name);

-- C. no.of skills empno =101 has 

SELECT COUNT(skill) "no.of.skills of empno = 103" 
FROM EMP_Skill  
WHERE Empno = 101;

-- d. firstname of employee with skill oracle SQL

SELECT first_name  
FROM emp_Details 
WHERE empno IN ( SELECT empno FROM EMP_skill WHERE skill = 'Oracle SQL');

-- CREATING VIEW

CREATE OR REPLACE VIEW EMP_VIEW AS  
SELECT a.Empno,a.first_name, b.skill, c.lodge_manager 
FROM emp_details a, EMP_Skill b, Lodge_details c 
WHERE (a.empno IN b.empno) AND (a.Lodge_name IN c.Lodge_name);

-- CREATING SYNONYM

CREATE SYNONYM EMPV FOR EMP_VIEW;

-- CREATING INDEX

CREATE INDEX EMPskill_Skills_i 
ON EMP_skill(skill);

