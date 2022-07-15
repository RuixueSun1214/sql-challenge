-- Use the information you have to create a table schema for each of the six CSV files. 
-- Remember to specify data types, primary keys, foreign keys, and other constraints.

-- Create table departments
create table departments(
	dept_no VARCHAR NOT NULL primary key,
	dept_name VARCHAR NOT NULL
);

-- Create table titles
create table titles (
	title_id VARCHAR NOT NULL primary key,
	title VARCHAR NOT NULL
);

-- Create table employees
create table employees (
	emp_no INT NOT NULL,
	emp_title_id VARCHAR NOT NULL,
	foreign key (emp_title_id) references titles(title_id),
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	constraint "pk_employees" primary key (emp_no)
);

-- Create table dept_emp
create table dept_emp (
	emp_no int NOT NULL,
	foreign key (emp_no) references employees(emp_no),
	dept_no VARCHAR NOT NULL,
	foreign key (dept_no) references departments(dept_no),
 	primary key (emp_no, dept_no)
);

-- Create table salaries
create table salaries (
	emp_no int NOT NULL primary key,
	foreign key (emp_no) references employees(emp_no),
	salary money NOT NULL
);

-- Create table dept_manager
create table dept_manager (
	dept_no VARCHAR NOT NULL,
	foreign key (dept_no) references departments(dept_no),
	emp_no int NOT NULL,
	foreign key (emp_no) references employees(emp_no),
	primary key (dept_no, emp_no)
);

SELECT * FROM departments;
SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM salaries;
SELECT * FROM dept_manager;

-- -- Drop tables in cascade if they exist
-- drop table if exists departments cascade;
-- drop table if exists titles cascade;
-- drop table if exists employees cascade;
-- drop table if exists dept_emp cascade;
-- drop table if exists salaries cascade;
-- drop table if exists dept_manager cascade;