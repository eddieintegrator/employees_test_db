--
-- File generated with SQLiteStudio v3.1.1 on po říj 30 09:39:54 2017
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: departments
DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
    dept_no   CHAR (4)     NOT NULL
                           PRIMARY KEY,
    dept_name VARCHAR (40) NOT NULL
                           UNIQUE
);


-- Table: dept_emp
DROP TABLE IF EXISTS dept_emp;

CREATE TABLE dept_emp (
    emp_no    INT      NOT NULL,
    dept_no   CHAR (4) NOT NULL,
    from_date DATE     NOT NULL,
    to_date   DATE     NOT NULL,
    FOREIGN KEY (
        emp_no
    )
    REFERENCES employees (emp_no) ON DELETE CASCADE,
    FOREIGN KEY (
        dept_no
    )
    REFERENCES departments (dept_no) ON DELETE CASCADE,
    PRIMARY KEY (
        emp_no,
        dept_no
    )
);


-- Table: dept_manager
DROP TABLE IF EXISTS dept_manager;

CREATE TABLE dept_manager (
    emp_no    INT      NOT NULL,
    dept_no   CHAR (4) NOT NULL,
    from_date DATE     NOT NULL,
    to_date   DATE     NOT NULL,
    FOREIGN KEY (
        emp_no
    )
    REFERENCES employees (emp_no) ON DELETE CASCADE,
    FOREIGN KEY (
        dept_no
    )
    REFERENCES departments (dept_no) ON DELETE CASCADE,
    PRIMARY KEY (
        emp_no,
        dept_no
    )
);


-- Table: employees
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    emp_no     INTEGER      NOT NULL
                            PRIMARY KEY AUTOINCREMENT,
    birth_date DATE         NOT NULL,
    first_name VARCHAR (14) NOT NULL,
    last_name  VARCHAR (16) NOT NULL,
    gender     TEXT (1)     NOT NULL,
    hire_date  DATE         NOT NULL
);


-- Table: salaries
DROP TABLE IF EXISTS salaries;

CREATE TABLE salaries (
    emp_no    INT  NOT NULL,
    salary    INT  NOT NULL,
    from_date DATE NOT NULL,
    to_date   DATE NOT NULL,
    FOREIGN KEY (
        emp_no
    )
    REFERENCES employees (emp_no) ON DELETE CASCADE,
    PRIMARY KEY (
        emp_no,
        from_date
    )
);


-- Table: titles
DROP TABLE IF EXISTS titles;

CREATE TABLE titles (
    emp_no    INT          NOT NULL,
    title     VARCHAR (50) NOT NULL,
    from_date DATE         NOT NULL,
    to_date   DATE,
    FOREIGN KEY (
        emp_no
    )
    REFERENCES employees (emp_no) ON DELETE CASCADE,
    PRIMARY KEY (
        emp_no,
        title,
        from_date
    )
);


-- View: current_dept_emp
DROP VIEW IF EXISTS current_dept_emp;
CREATE VIEW current_dept_emp AS
    SELECT l.emp_no,
           dept_no,
           l.from_date,
           l.to_date
      FROM dept_emp d
           INNER JOIN
           dept_emp_latest_date l ON d.emp_no = l.emp_no AND 
                                     d.from_date = l.from_date AND 
                                     l.to_date = d.to_date;


-- View: dept_emp_latest_date
DROP VIEW IF EXISTS dept_emp_latest_date;
CREATE VIEW dept_emp_latest_date AS
    SELECT emp_no,
           MAX(from_date) AS from_date,
           MAX(to_date) AS to_date
      FROM dept_emp
     GROUP BY emp_no;


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
