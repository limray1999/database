-- Generated by Oracle SQL Developer Data Modeler 21.2.0.183.1957
--   at:        2021-10-19 23:12:06 EDT
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE ml_dept (
    deptno NUMBER(2) NOT NULL,
    dname  VARCHAR2(30) NOT NULL,
    loc    VARCHAR2(30) NOT NULL
);

COMMENT ON COLUMN ml_dept.deptno IS
    'DEPARTMENT ID NUMBER';

COMMENT ON COLUMN ml_dept.dname IS
    'DEPARTMENT NAME';

COMMENT ON COLUMN ml_dept.loc IS
    'LOCATION CITY OF THE DEPARTMENT';

ALTER TABLE ml_dept ADD CONSTRAINT ml_dept_pk PRIMARY KEY ( deptno );

CREATE TABLE ml_emp (
    empno    NUMBER(4) NOT NULL,
    efname   VARCHAR2(30) NOT NULL,
    elname   VARCHAR2(30) NOT NULL,
    iob      VARCHAR2(30) NOT NULL,
    mgr      NUMBER(4),
    hiredate DATE NOT NULL,
    sal      NUMBER(7, 2) NOT NULL,
    comm     NUMBER(7, 2),
    deptno   NUMBER(2) NOT NULL
);

COMMENT ON COLUMN ml_emp.empno IS
    'EMPLOYEE ID NUMBER';

COMMENT ON COLUMN ml_emp.efname IS
    'EMPLOYEE FIRST NAME';

COMMENT ON COLUMN ml_emp.elname IS
    'EMPLOYEE LAST NAME';

COMMENT ON COLUMN ml_emp.iob IS
    'RMPLOYEE FUNCTIONAL ROLE';

COMMENT ON COLUMN ml_emp.mgr IS
    'EMPLOYEE MANAGER ID';

COMMENT ON COLUMN ml_emp.hiredate IS
    'EMPLOYEE JOIN DATE';

COMMENT ON COLUMN ml_emp.sal IS
    'EMPLOYEE MONTHLY SALARY IN USD';

COMMENT ON COLUMN ml_emp.comm IS
    'EMPLOYEE COMMISSION';

ALTER TABLE ml_emp ADD CONSTRAINT ml_emp_pk PRIMARY KEY ( empno );

CREATE TABLE ml_proemp (
    hours  NUMBER(4) NOT NULL,
    empno  NUMBER(4) NOT NULL,
    projid NUMBER(3) NOT NULL
);

ALTER TABLE ml_proemp ADD CONSTRAINT ml_proemp_pk PRIMARY KEY ( empno,
                                                                projid );

CREATE TABLE ml_project (
    projid    NUMBER(3) NOT NULL,
    pname     VARCHAR2(30),
    startdate DATE NOT NULL,
    enddate   DATE NOT NULL
);

COMMENT ON COLUMN ml_project.projid IS
    'PROJECT ID NUMBER';

COMMENT ON COLUMN ml_project.pname IS
    'NAME OF THE PROJECT';

COMMENT ON COLUMN ml_project.startdate IS
    'START DATE OF THE PEOJECT';

COMMENT ON COLUMN ml_project.enddate IS
    'END DATE OF THE PROJECT';

ALTER TABLE ml_project ADD CONSTRAINT ml_project_pk PRIMARY KEY ( projid );

CREATE TABLE ml_salgrade (
    grade VARCHAR2(2) NOT NULL,
    hisal NUMBER(7, 2) NOT NULL,
    losal NUMBER(7, 2) NOT NULL
);

COMMENT ON COLUMN ml_salgrade.grade IS
    'SALARY GRADE OF EMPLOYEE';

COMMENT ON COLUMN ml_salgrade.hisal IS
    'HIGH SALARY VALUE';

COMMENT ON COLUMN ml_salgrade.losal IS
    'LOW SALARY VALUE';

ALTER TABLE ml_salgrade ADD CONSTRAINT ml_salgrade_pk PRIMARY KEY ( grade );

ALTER TABLE ml_emp
    ADD CONSTRAINT ml_emp_ml_dept_fk FOREIGN KEY ( deptno )
        REFERENCES ml_dept ( deptno );

ALTER TABLE ml_proemp
    ADD CONSTRAINT ml_proemp_ml_emp_fk FOREIGN KEY ( empno )
        REFERENCES ml_emp ( empno );

ALTER TABLE ml_proemp
    ADD CONSTRAINT ml_proemp_ml_project_fk FOREIGN KEY ( projid )
        REFERENCES ml_project ( projid );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             0
-- ALTER TABLE                              8
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
