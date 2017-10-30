--
-- File generated with SQLiteStudio v3.1.1 on po říj 30 09:51:06 2017
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: departments
CREATE TABLE departments (dept_no CHAR (4) NOT NULL PRIMARY KEY, dept_name VARCHAR (40) NOT NULL UNIQUE);
INSERT INTO departments (dept_no, dept_name) VALUES ('d001', 'Marketing');
INSERT INTO departments (dept_no, dept_name) VALUES ('d002', 'Finance');
INSERT INTO departments (dept_no, dept_name) VALUES ('d003', 'Human Resources');
INSERT INTO departments (dept_no, dept_name) VALUES ('d004', 'Production');
INSERT INTO departments (dept_no, dept_name) VALUES ('d005', 'Development');
INSERT INTO departments (dept_no, dept_name) VALUES ('d006', 'Quality Management');
INSERT INTO departments (dept_no, dept_name) VALUES ('d007', 'Sales');
INSERT INTO departments (dept_no, dept_name) VALUES ('d008', 'Research');
INSERT INTO departments (dept_no, dept_name) VALUES ('d009', 'Customer Service');

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
