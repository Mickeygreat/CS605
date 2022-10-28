/* Helpful when you create project table */

/* Create 2 joined tables Example */

/* Let us create table Worker First */
CREATE TABLE Worker
(worker_no varchar2(3),
first_name varchar2(15) NOT NULL,
last_name varchar2(20) NOT NULL,
address varchar2(30), 
city varchar2(15),
state varchar2(2),
date_hired date, 
hourly_wage number(5,2) NOT NULL,
CONSTRAINT constrWorker_PK PRIMARY KEY(worker_no));

/* Let us CREATE table TIMECLOCK after creating Worker */
CREATE TABLE TIMECLOCK
 (Worker_no varchar2(3) NOT NULL, 
    week_ending date, 
    hours_worked number(3), 
CONSTRAINT hours_pk PRIMARY KEY (Worker_no, week_ending),  /* assign a composite PK */
CONSTRAINT worker_fk FOREIGN KEY (worker_no) REFERENCES  worker(worker_no)); /* Join the two tables */

Drop table worker cascade constraints;
Drop table TIMECLOCK cascade constraints;
