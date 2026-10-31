create database reliance_jio;
use reliance_jio;

create table employee (
emp_id int(10),
first_name varchar(10),
last_name varchar(10),
dept_code int (3));

select * from employee;

insert into employee (emp_id, first_name, last_name, dept_code)
values
(248132604,"shivam", "deo",76),
(815242165,"parijat", "shankar",43),
(416122768,"rahul", "srivastava", 66),
(960828909,"kumar","swamy",47),
(440361783,"shankh","khurana",23),
(851591490,"swapnil", "mehta", 43),
(668957687,"arvind", "chattejee",23),
(585068105,"jalpesh", "modi",33),
(379882096,"kavita", "yadav", 23),
(718929853,"syed", "zaheer", 66),
(873840890,"sanjay", "shukla",76),
(941877566,"ragini", "malhotra",33),
(998809976,"javed","khan", 23),
(669391133, "vikram","singh",43),
(861199021,"ajay","kumar",23),
(980140890,"pankaj","verma",43),
(750603819,"roshan","singh",47),
(558885983,"sunaina","yadav",76),
(392214056,"bhavna","sharma",66),
(164880802,"pooja","kumari",47);

select * from employee;


create table department(
dept_code int (10),
dept_name varchar(25),
dept_budget int (12));

insert into department (dept_code,dept_name,dept_budget)
values
(23,"sales and marketing",50000000),
(66,"information technology",100000000),
(43,"customer service",30000000),
(33, "human resources",20000000),
(76, "finance and accounting",40000000),
(47,"operations",60000000);

select * from department;

#q1 what are the unique last_names from the employee table?
select distinct last_name from employee;

#q2 what is the total number of employees in the company?
select count(*) from employee;

#q3 what is the total budget for the company?
select sum(dept_budget) from department;

#q4 what is the department code and budget for the "operations" department?
select dept_name, dept_code, dept_budget from department 
where dept_name = 'operations';

#q5 what is the total budget for the "information technology" and "finance and accounting" departments?
select sum(dept_budget) from department 
where dept_name in ('information technology', 'finance and accounting');

#q6 who are the employees working in the "sales and marketing" department?
select * from employee where dept_code = 23;

#q7 what is the name of the employee with emp_id 718929853?
select concat(first_name, ' ', last_name) as 'employee name' from employee
where emp_id = 718929853;

#q8 what is the budget for the "customer service" department?
select dept_budget from department 
where dept_name = 'customer service';

#q9 what is the total budget for all departments except "operations"?
select sum(dept_budget) from department
where dept_name <> 'operations';

#q10 what is the emp_id, first_name and department_code of the employee with the last name "shukla"?
select emp_id, first_name, dept_code from employee 
where last_name = 'shukla';

#q11 what is the average budget for the departments with dept_code 23 and 43?
select avg(dept_budget) from department 
where dept_code in (23, 43);

#q12 how many employees are there whose first name starts with the letter "s"?
select count(*) as employee_count
from employee
where first_name like 's%';

#q13 list the name of employees whose first_name starts with "s".
select * from employee 
where first_name like "s%";

#q14 list the name of employees whose first_name starts with "s" and ends with "a".
select * from employee 
where first_name like "s%a";

#q15 fetch top 3 records of all the departments in descending order based on the budget of the department.
select * from department 
order by dept_budget desc 
limit 3;

#q16 fetch data of all employees from the employee table whose dept_code is an odd number
select * from employee 
where mod (dept_code,2) != 0;

#q17 create a clone of the table employee with a name clone_table and having two columns, one with full name and the other with the department code with an alias d_code
create table clone_table 
select concat(first_name, " ", last_name) as full_name,
dept_code as d_code from employee;

select * from clone_table;

#q18 delete employee details of "ajay kumar" from clone_table
delete from clone_table 
where full_name = "ajay kumar";

select * from clone_table;

#q19 the name of the employee "rahul srivasatava" has a lower case 'r', make changes in the clone table so that the full_name is written as "rahul srivastava" 
update clone_table 
set full_name="rahul srivastava" 
where full_name="rahul srivastava";

select * from clone_table;

#q20 convert full_name from clone table into uppercase 
select upper(full_name) from clone_table;

#q21 fetch second to fifth record from the department table based on the highest budget.
select * from department 
order by dept_budget desc 
limit 1,4;

#q22 the employee with the name "jalpesh modi" has decided to move into another department, delete the d_code value corresponding to "jalpesh_modi" from the clone_table
update clone_table 
set d_code=null 
where full_name="jalpesh modi";

select * from clone_table;

#q23 change the name of the column d_code to department_code in clone table.
alter table clone_table 
rename column d_code to department_code;

select * from clone_table;

#q24 since no mathematical operation will be performed on emp_id in employee table, convert its data type from int to varchar
alter table employee modify column emp_id varchar(20);

select * from employee;
select * from department;

#q25 the company has decided to increase the budget of all the department by 10% , make changes accordingly to fetch old and new budget
select dept_code, dept_name, dept_budget old_budget, dept_budget * 1.1 as new_budget from department;

#q26 what is the name of the department with the lowest budget?
select dept_name, dept_budget from department
where dept_budget = (select min(dept_budget) from department);

#q27 who are the employees working in the departments with budgets greater than 40,000,000?
select * from employee 
where dept_code in (select dept_code from department where dept_budget > 40000000);

#q28 what is the name of the department with the second highest budget?
select * from department where dept_budget = ( 
select max(dept_budget) from department where dept_budget< (select max(dept_budget) from department));

#q29 how many employees are there in each department?
select d.dept_name, count(*) as employee_count
from department d
join employee e on d.dept_code = e.dept_code
group by d.dept_name;

#q30 create a view of employees working in sales and marketing department only.
create view sales_marketing_info as
select employee.*, department.dept_name
from employee
join department on employee.dept_code = department.dept_code
where department.dept_name = 'sales and marketing';


select * from sales_marketing_info;







