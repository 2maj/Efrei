create database tp3;
use tp3;
/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de cr�ation :  15/11/2018 11:19:14                      */
/*==============================================================*/

drop table if exists REGIONS;
drop table if exists COUNTRIES;
drop table if exists LOCATIONS;
drop table if exists DEPARTMENTS;
drop table if exists JOBS;
drop table if exists EMPLOYEES;
drop table if exists JOB_HISTORY;


/*==============================================================*/
/* Table : REGIONS                                            */
/*==============================================================*/

CREATE TABLE REGIONS 
    ( 
     REGION_ID numeric(8,0) NOT NULL, 
     REGION_NAME VARCHAR (25),
     primary key (REGION_ID) 
    );



/*==============================================================*/
/* Table : COUNTRIES                                            */
/*==============================================================*/

CREATE TABLE COUNTRIES 
    ( 
     COUNTRY_ID CHAR (2)  NOT NULL, 
     COUNTRY_NAME VARCHAR (40), 
     REGION_ID numeric(8,0),
     primary key (COUNTRY_ID)
    ) ;



/*==============================================================*/
/* Table : LOCATIONS                                            */
/*==============================================================*/

CREATE TABLE LOCATIONS 
    ( 
     LOCATION_ID numeric(8,0) NOT NULL, 
     STREET_ADDRESS VARCHAR (40), 
     POSTAL_CODE VARCHAR (12), 
     CITY VARCHAR (30) NOT NULL, 
     STATE_PROVINCE VARCHAR (25), 
     COUNTRY_ID CHAR (2),
     primary key (LOCATION_ID)
    ) ;



/*==============================================================*/
/* Table : DEPARTMENTS                                          */
/*==============================================================*/

CREATE TABLE DEPARTMENTS 
    ( 
     DEPARTMENT_ID numeric(8,0) NOT NULL, 
     DEPARTMENT_NAME VARCHAR (30)  NOT NULL, 
     MANAGER_ID numeric(8,0), 
     LOCATION_ID numeric(8,0), 
     primary key (DEPARTMENT_ID)
    ) ;



/*==============================================================*/
/* Table : JOBS                                                 */
/*==============================================================*/

CREATE TABLE JOBS 
    ( 
     JOB_ID VARCHAR (10)  NOT NULL, 
     JOB_TITLE VARCHAR (35)  NOT NULL, 
     MIN_SALARY numeric(8,0), 
     MAX_SALARY numeric(8,0),
     primary key (JOB_ID)
    );



/*==============================================================*/
/* Table : EMPLOYEES                                            */
/*==============================================================*/

CREATE TABLE EMPLOYEES 
    ( 
     EMPLOYEE_ID numeric(8,0) NOT NULL, 
     FIRST_NAME VARCHAR (20), 
     LAST_NAME VARCHAR (25)  NOT NULL, 
     EMAIL VARCHAR (25)  NOT NULL, 
     PHONE_NUMBER VARCHAR (20), 
     HIRE_DATE VARCHAR (20) NOT NULL, 
     JOB_ID VARCHAR (10)  NOT NULL, 
     SALARY numeric(8,2), 
     COMMISSION_PCT numeric (2,2), 
     MANAGER_ID numeric(8,0), 
     DEPARTMENT_ID numeric(8,0),
     primary key (EMPLOYEE_ID)
    ) ;



/*==============================================================*/
/* Table : JOB_HISTORY                                          */
/*==============================================================*/

CREATE TABLE JOB_HISTORY 
    ( 
     EMPLOYEE_ID numeric(8,0) NOT NULL, 
     START_DATE VARCHAR (15) NOT NULL, 
     END_DATE VARCHAR (15) NOT NULL, 
     JOB_ID VARCHAR (10)  NOT NULL, 
     DEPARTMENT_ID numeric(8,0)
    ) ;








