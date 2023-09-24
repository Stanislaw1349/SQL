create database mywork;

create table mywork.emp(
empno INT (10) NOT NULL,
ename VARCHAR(10) DEFAULT NULL,
job VARCHAR(9) DEFAULT NULL,
mgr INT(10) DEFAULT NULL,
hiredate DATE,
sal NUMERIC(7,2),
comm NUMERIC(7,2) NULL,
dept INT (10),
PRIMARY KEY (empno));

desc mywork.emp;

select * from mywork.emp;

insert into mywork.emp (empno,ename,job,mgr,hiredate,sal,comm,dept)
values
	(1,'JOHNSON','ADMIN',6,'1990-12-17',18000,NULL,4);

insert into mywork.emp (empno,ename,job,mgr,hiredate,sal,comm,dept)
values
	(2,'HARDING','MANAGER',9,'1990-12-17',52000,300,3),
	(3,'TAFT','SALES I',2,'1995-12-17',25000,500,3),
    (4,'HOOVER','SALES I',2,'1990-04-02',27000,NULL,3),
    (5,'LINCOLN','TECH',6,'1994-06-23',22500,1400,4),
    (6,'GARFIELD','MANAGER',9,'1993-05-01',54000,NULL,4),
    (7,'POLK','TECH',6,'1997-09-22',25000,NULL,4),
    (8,'GRANT','ENGINEER',10,'1997-03-30',32000,NULL,2),
    (9,'JACKSON','CEO',NULL,'1990-01-01',75000,NULL,4),
    (10,'FILLMORE','MANAGER',9,'1994-08-09',56000,NULL,2),
    (11,'ADAMS','ENGINEER',10,'1996-03-15',34000,NULL,2),
    (12,'WASHINGTON','ADMIN',6,'1998-04-16',18000,NULL,4),
    (13,'MONROE','ENGINEER',10,'2000-12-03',30000,NULL,2),
    (14,'ROOSEVELT','CPA',9,'1995-10-12',35000,NULL,1);
    
alter table mywork.emp rename column job to job_title;

update mywork.emp set ename = 'SMITH' where ename = 'POLK';

delete from mywork.emp where ename = 'ROOSEVELT';

alter table mywork.emp add column bonus_percent int (3);

CREATE TABLE IF NOT EXISTS mywork.dept (
deptno INT NOT NULL,
dname VARCHAR(14),
loc VARCHAR(13),
 PRIMARY KEY (deptno));

select * from mywork.dept;

insert into mywork.dept values (1,'ACCOUNTING','ST LOUIS');
insert into mywork.dept values (2,'RESEARCH','NEW YORK');
insert into mywork.dept values (3,'SALES','ATLANTA');
insert into mywork.dept values (4,'OPERATIONS','SEATTLE');

ALTER TABLE mywork.emp
ADD FOREIGN KEY fk_dept(dept)
REFERENCES dept(deptno)
ON DELETE NO ACTION
ON UPDATE CASCADE;

desc mywork.emp;
desc mywork.dept;
select * from mywork.emp;
select * from mywork.dept;

-- show all records in department #4
select * from mywork.dept where deptno =4;
-- show distinct department name
select distinct dname from mywork.dept order by dname;
-- show all departments that start with A
select * from mywork.dept where dname like 'A%';
-- show all records for departments between 1 and 3
select * from mywork.dept where deptno between 1 and 3;
select * from mywork.dept where deptno in (1,2,3);
select * from mywork.dept where deptno >=1 and deptno <4;

-- Part 1 - mywork database

-- 1. Add column 'country' to dept table in mywork database
alter table mywork.dept
add column country varchar (50);
    
-- 2. Rename column 'loc' to 'city'
alter table mywork.dept rename column loc to city;
    
-- 3. Add three more departments: HR, Engineering, Marketing
insert into mywork.dept (deptno, dname)
values
(5, 'HR'),
(6, 'Engineering'),
(7, 'Marketing');
    
-- 4. Write sql statement to show which department is in Atlanta
select deptno, dname, city from mywork.dept 
where city = 'Atlanta';
    
-- Part 2  - library_simple database
-- Run library_simple.sql script 
-- (source: https://github.com/amyasnov/stepic-db-intro/tree/2650f9a7f9c72e1219ea93cb4c4e410cca046e54/test)

select table_schema, table_name, table_rows
from INFORMATION_SCHEMA.tables
where TABLE_SCHEMA = 'library_simple'; 

-- 1. What is the first name of the author with the last name Swanson?
select first_name from library_simple.author
where last_name = 'Swanson';

-- 2. How many pages are in Men Without Fear book?
select page_num from library_simple.book
where name = 'Men Without Fear';
    
-- 3. Show all book categories that start with with letter 'W'
 select * from library_simple.category
 where `name` like 'W%';
 