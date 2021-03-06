--DEPARTMENTS TABLE

CREATE TABLE DEPARTMENTS
(
 DEPARTMENT_ID VARCHAR2 (10) NOT NULL,
 DEPARTMENT_NAME VARCHAR2 (20) NOT NULL,
 CONSTRAINT DEPARTMENT_PK PRIMARY KEY (DEPARTMENT_ID)
);

--EMPLOYEES TABLE

CREATE TABLE EMPLOYEES
(
    EMPLOYEE_ID VARCHAR2 (10) NOT NULL,
    FIRST_NAME VARCHAR2 (20) NOT NULL,
    LAST_NAME VARCHAR2 (20) NOT NULL,
    DATE_OF_BIRTH DATE NOT NULL,
    HIRE_DATE DATE NOT NULL,
    DESIGNATION VARCHAR2 (20) NOT NULL,
    EMAIL_ID VARCHAR2 (30) NOT NULL,
    PHONE_NUMBER NUMERIC (10) NOT NULL,
    GENDER VARCHAR2 (20) NOT NULL,
    ADDRESS VARCHAR2 (50) NOT NULL,
    CONSTRAINT EMPLOYEES_PK PRIMARY KEY (EMPLOYEE_ID)
);

--EMPLOYEE FINANCIALS TABLE

CREATE TABLE EMPLOYEE_FINANCIALS 
(
    AADHAAR_NUMBER VARCHAR2 (12) NOT NULL,
    EMPLOYEE_ID VARCHAR2 (10) NOT NULL,
    BANK_ACCOUNT_NUMBER VARCHAR2 (20) NOT NULL,
    BANK_NAME VARCHAR2 (30) NOT NULL,
    CONSTRAINT EMPLOYEE_FINANCIALS_PK PRIMARY KEY (AADHAAR_NUMBER),
    CONSTRAINT EMPLOYEE_FINANCIALS_FK FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEES (EMPLOYEE_ID)
);

--DESIGNATION TABLE

CREATE TABLE DESIGNATION
(
    DESIGNATION_ID VARCHAR2 (10) NOT NULL,
    DEPARTMENT_ID VARCHAR2 (10) NOT NULL,
    DESIGNATION VARCHAR2 (20) NOT NULL,
    BASIC_SALARY NUMERIC (10, 2) NOT NULL,
    AGP NUMERIC (10, 2) NOT NULL,           --ACADEMIC GRADE PAY
    DA NUMERIC (10, 2) NOT NULL,            --DEARNESS ALLOWANCE
    HRA NUMERIC (10, 2) NOT NULL,           --HOUSE RENT ALLOWANCE
    OTHER_ALLOWANCES NUMERIC (10, 2) NOT NULL,
    EPF NUMERIC (10, 2) NOT NULL,           --EMPLOYEES' PROVIDENT FUND
    NPS NUMERIC (10, 2) NOT NULL,           --NATIONAL PENSION SYSTEM
    ESI NUMERIC (10, 2) NOT NULL,           --EMPLOYEES' STATE INSURANCE
    TDS NUMERIC (10, 2) NOT NULL,           --TAX DEDUCTED AT SOURCE
    CONSTRAINT DESIGNATION_PK PRIMARY KEY (DESIGNATION_ID),
    CONSTRAINT DESIGNATION_FK FOREIGN KEY (DEPARTMENT_ID) REFERENCES DEPARTMENTS (DEPARTMENT_ID)
);

--SALARY DETAILS TABLE

CREATE TABLE SALARY_DETAILS
(
    EMPLOYEE_ID VARCHAR2(10) NOT NULL,
    MONTH VARCHAR2(10),
    YEAR NUMBER(10),
    GROSS_SALARY NUMERIC (10, 2) NOT NULL,
    NET_SALARY NUMERIC (10,2) NOT NULL,
    CONSTRAINT PAYROLL_DETAILS_FK FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEES (EMPLOYEE_ID)
);

--LEAVES TABLE

CREATE TABLE LEAVES
(
    EMPLOYEE_ID VARCHAR2 (10) NOT NULL,
    CASUAL_LEAVES NUMERIC(3) DEFAULT (12),
    MEDICAL_LEAVES NUMERIC (3) DEFAULT (12),
    MATERNITY_LEAVES NUMERIC (3) DEFAULT (90),
    BIRTHDAY_LEAVE NUMERIC (1) DEFAULT (1),
    EARNED_LEAVES NUMERIC (3) DEFAULT (30),
    LEAVES_WITHOUT_PAY NUMERIC (3) NOT NULL,
    CONSTRAINT LEAVES_FK FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEES (EMPLOYEE_ID)
);

--ATTENDANCE TABLE

CREATE TABLE ATTENDANCE
(
    EMPLOYEE_ID VARCHAR2 (10),
    MONTH VARCHAR2 (10) NOT NULL,
    TOTAL_DAYS NUMERIC (2),
    WORKING_DAYS NUMERIC (2),
    DAYS_ATTENTED NUMERIC (2),
    CONSTRAINT ATTENDANCE_FK FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEES (EMPLOYEE_ID)
);