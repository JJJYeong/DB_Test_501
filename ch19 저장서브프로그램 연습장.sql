-- �ǽ� 19-1 

CREATE OR REPLACE PROCEDURE pro_noparam 
IS 
   V_EMPNO NUMBER(4) := 7788; 
   V_ENAME VARCHAR2(10); 
BEGIN 
   V_ENAME := 'SCOTT'; 
   DBMS_OUTPUT.PUT_LINE('V_EMPNO : ' || V_EMPNO); 
   DBMS_OUTPUT.PUT_LINE('V_ENAME : ' || V_ENAME); 
END; 

/ 

 

-- �ǽ� 19-2 

SET SERVEROUTPUT ON; 

EXECUTE pro_noparam; 

 

-- �ǽ� 19-3 

BEGIN 
   pro_noparam; 
END; 

/ 

 

-- �ǽ� 19-4 

SELECT * 
  FROM USER_SOURCE 
 WHERE NAME = 'PRO_NOPARAM'; 

 

-- �ǽ� 19-5 
SELECT TEXT 
  FROM USER_SOURCE 
 WHERE NAME = 'PRO_NOPARAM'; 

 

-- �ǽ� 19-6 
DROP PROCEDURE PRO_NOPARAM; 
 
-- �ǽ� 19-7 
CREATE OR REPLACE PROCEDURE pro_param_in 
( 
   param1 IN NUMBER, 
   param2 NUMBER, 
   param3 NUMBER := 3, 
   param4 NUMBER DEFAULT 4 
) 
IS 
BEGIN 
   DBMS_OUTPUT.PUT_LINE('param1 : ' || param1); 
   DBMS_OUTPUT.PUT_LINE('param2 : ' || param2); 
   DBMS_OUTPUT.PUT_LINE('param3 : ' || param3); 
   DBMS_OUTPUT.PUT_LINE('param4 : ' || param4); 
END; 
/ 

 
-- �ǽ� 19-8 

EXECUTE pro_param_in(1,2,9,8); 
 
-- �ǽ� 19-9 
EXECUTE pro_param_in(1, 2); 

 
-- �ǽ� 19-10 
EXECUTE pro_param_in(1); 

 
-- �ǽ� 19-11 
EXECUTE pro_param_in(param1 => 10, param2 => 20); 

 

-- �ǽ� 19-12 
CREATE OR REPLACE PROCEDURE pro_param_out 
( 
   in_empno IN EMP.EMPNO%TYPE, 
   out_ename OUT EMP.ENAME%TYPE, 
   out_sal OUT EMP.SAL%TYPE 
) 
IS 
BEGIN 
   SELECT ENAME, SAL INTO out_ename, out_sal 
     FROM EMP 
    WHERE EMPNO = in_empno; 
END pro_param_out; 
/ 

 

-- �ǽ� 19-13 
DECLARE 
   v_ename EMP.ENAME%TYPE; 
   v_sal EMP.SAL%TYPE; 
BEGIN 
   pro_param_out(7788, v_ename, v_sal); 
   DBMS_OUTPUT.PUT_LINE('ENAME : ' || v_ename); 
   DBMS_OUTPUT.PUT_LINE('SAL : ' || v_sal); 
END; 
/ 

 

-- �ǽ� 19-14 
CREATE OR REPLACE PROCEDURE pro_param_inout 
( 
   inout_no IN OUT NUMBER 
) 
IS 
BEGIN 
   inout_no := inout_no * 2; 
END pro_param_inout; 
/ 

 

-- �ǽ� 19-15 
DECLARE 
   no NUMBER; 
BEGIN 
   no := 5; 
   pro_param_inout(no); 
   DBMS_OUTPUT.PUT_LINE('no : ' || no); 
END; 

/ 
 
-- �ǽ� 19-16 
CREATE OR REPLACE PROCEDURE pro_err 
IS 
   err_no NUMBER; 
BEGIN 
   err_no := 100; 
   DBMS_OUTPUT.PUT_LINE('err_no : ' || err_no); 
END pro_err; 

/ 

 

-- �ǽ� 19-17 
SHOW ERRORS; 

 

-- �ǽ� 19-18 

SELECT * 
  FROM USER_ERRORS 
 WHERE NAME = 'PRO_ERR'; 
 

-- �ǽ� 19-19 
CREATE OR REPLACE FUNCTION func_aftertax( 
   sal IN NUMBER 
) 
RETURN NUMBER 
IS 
   tax NUMBER := 0.05; 
BEGIN 
   RETURN (ROUND(sal - (sal * tax))); 
END func_aftertax; 

/ 

 

-- �ǽ� 19-20 

DECLARE 
   aftertax NUMBER; 
BEGIN 
   aftertax := func_aftertax(3000); 
   DBMS_OUTPUT.PUT_LINE('after-tax income : ' || aftertax); 
END; 

/ 
 
-- �ǽ� 19-21 
SELECT func_aftertax(3000) 
  FROM DUAL; 

-- �ǽ� 19-22 
SELECT EMPNO, ENAME, SAL, func_aftertax(SAL) AS AFTERTAX 
  FROM EMP; 
 
-- �ǽ� 19-23 
DROP FUNCTION func_aftertax; 
 
-- �ǽ� 19-24 
CREATE OR REPLACE PACKAGE pkg_example 
IS 
   spec_no NUMBER := 10; 
   FUNCTION func_aftertax(sal NUMBER) RETURN NUMBER; 
   PROCEDURE pro_emp(in_empno IN EMP.EMPNO%TYPE); 
   PROCEDURE pro_dept(in_deptno IN DEPT.DEPTNO%TYPE); 
END; 

/ 
-- �ǽ� 19-25 
SELECT TEXT 
  FROM USER_SOURCE 
 WHERE TYPE = 'PACKAGE' 
   AND NAME = 'PKG_EXAMPLE'; 

-- �ǽ� 19-26 
DESC pkg_example; 

-- �ǽ� 19-27 
CREATE OR REPLACE PACKAGE BODY pkg_example 
IS 
   body_no NUMBER := 10; 
   FUNCTION func_aftertax(sal NUMBER) RETURN NUMBER 
      IS 
         tax NUMBER := 0.05; 
      BEGIN 
         RETURN (ROUND(sal - (sal * tax))); 
   END func_aftertax; 

   PROCEDURE pro_emp(in_empno IN EMP.EMPNO%TYPE) 
      IS 
         out_ename EMP.ENAME%TYPE; 
         out_sal EMP.SAL%TYPE; 
      BEGIN 
         SELECT ENAME, SAL INTO out_ename, out_sal 
           FROM EMP 
          WHERE EMPNO = in_empno; 
 
         DBMS_OUTPUT.PUT_LINE('ENAME : ' || out_ename); 
         DBMS_OUTPUT.PUT_LINE('SAL : ' || out_sal); 
   END pro_emp; 
 
PROCEDURE pro_dept(in_deptno IN DEPT.DEPTNO%TYPE) 
   IS 
      out_dname DEPT.DNAME%TYPE; 
      out_loc DEPT.LOC%TYPE; 
   BEGIN 
      SELECT DNAME, LOC INTO out_dname, out_loc 
        FROM DEPT 
       WHERE DEPTNO = in_deptno; 
 
      DBMS_OUTPUT.PUT_LINE('DNAME : ' || out_dname); 
      DBMS_OUTPUT.PUT_LINE('LOC : ' || out_loc); 
   END pro_dept; 
END; 

/ 

 

-- �ǽ� 19-28 

CREATE OR REPLACE PACKAGE pkg_overload 
IS 
  PROCEDURE pro_emp(in_empno IN EMP.EMPNO%TYPE); 
  PROCEDURE pro_emp(in_ename IN EMP.ENAME%TYPE); 
END; 

/ 

 

-- �ǽ� 19-29 

CREATE OR REPLACE PACKAGE BODY pkg_overload 
IS 
   PROCEDURE pro_emp(in_empno IN EMP.EMPNO%TYPE) 
      IS 
         out_ename EMP.ENAME%TYPE; 
         out_sal EMP.SAL%TYPE; 
      BEGIN 
         SELECT ENAME, SAL INTO out_ename, out_sal 
           FROM EMP 
          WHERE EMPNO = in_empno; 

         DBMS_OUTPUT.PUT_LINE('ENAME : ' || out_ename); 
         DBMS_OUTPUT.PUT_LINE('SAL : ' || out_sal); 
      END pro_emp; 

   PROCEDURE pro_emp(in_ename IN EMP.ENAME%TYPE) 
      IS 
         out_ename EMP.ENAME%TYPE; 
         out_sal EMP.SAL%TYPE; 
      BEGIN 
         SELECT ENAME, SAL INTO out_ename, out_sal 
           FROM EMP 
          WHERE ENAME = in_ename; 
 
         DBMS_OUTPUT.PUT_LINE('ENAME : ' || out_ename); 
         DBMS_OUTPUT.PUT_LINE('SAL : ' || out_sal); 
      END pro_emp; 
END; 

/ 

 

-- �ǽ� 19-30 
BEGIN 
   DBMS_OUTPUT.PUT_LINE('--pkg_example.func_aftertax(3000)--'); 
   DBMS_OUTPUT.PUT_LINE('after-tax:' || pkg_example.func_aftertax(3000)); 
   DBMS_OUTPUT.PUT_LINE('--pkg_example.pro_emp(7788)--'); 
 
   pkg_example.pro_emp(7788); 

   DBMS_OUTPUT.PUT_LINE('--pkg_example.pro_dept(10)--' ); 

   pkg_example.pro_dept(10); 

   DBMS_OUTPUT.PUT_LINE('--pkg_overload.pro_emp(7788)--' ); 

   pkg_overload.pro_emp(7788); 

   DBMS_OUTPUT.PUT_LINE('--pkg_overload.pro_emp(''SCOTT'')--' ); 

   pkg_overload.pro_emp('SCOTT'); 

END; 

/ 

 

-- �ǽ� 19-31 
CREATE TABLE EMP_TRG 
    AS SELECT * FROM EMP; 

-- �ǽ� 19-32 

CREATE OR REPLACE TRIGGER trg_emp_nodml_weekend 
BEFORE 
INSERT OR UPDATE OR DELETE ON EMP_TRG 
BEGIN 
   IF TO_CHAR(sysdate, 'DY') IN ('��', '��') THEN 
      IF INSERTING THEN 
         raise_application_error(-20000, '�ָ� ������� �߰� �Ұ�'); 
      ELSIF UPDATING THEN 
         raise_application_error(-20001, '�ָ� ������� ���� �Ұ�'); 
      ELSIF DELETING THEN 
         raise_application_error(-20002, '�ָ� ������� ���� �Ұ�'); 
      ELSE 
         raise_application_error(-20003, '�ָ� ������� ���� �Ұ�'); 
      END IF; 
   END IF; 
END; 

/ 

 

-- �ǽ� 19-33 

UPDATE emp_trg SET sal = 3500 WHERE empno = 7788; 

 

-- �ǽ� 19-34 

UPDATE emp_trg SET sal = 3500 WHERE empno = 7788; 

 

-- �ǽ� 19-35 

CREATE TABLE EMP_TRG_LOG( 

   TABLENAME VARCHAR2(10), -- DML�� ����� ���̺� �̸� 

   DML_TYPE VARCHAR2(10),  -- DML ��ɾ��� ���� 

   EMPNO NUMBER(4),        -- DML ����� �� ��� ��ȣ 

   USER_NAME VARCHAR2(30), -- DML�� ������ USER �̸� 

   CHANGE_DATE DATE        -- DML�� ����� ��¥ 

); 

 

-- �ǽ� 19-36 

CREATE OR REPLACE TRIGGER trg_emp_log 
AFTER 
INSERT OR UPDATE OR DELETE ON EMP_TRG 
FOR EACH ROW 
BEGIN 
   IF INSERTING THEN 
      INSERT INTO emp_trg_log 
      VALUES ('EMP_TRG', 'INSERT', :new.empno, 
               SYS_CONTEXT('USERENV', 'SESSION_USER'), sysdate); 
 
   ELSIF UPDATING THEN 
      INSERT INTO emp_trg_log 
      VALUES ('EMP_TRG', 'UPDATE', :old.empno, 
               SYS_CONTEXT('USERENV', 'SESSION_USER'), sysdate); 
 
   ELSIF DELETING THEN 
      INSERT INTO emp_trg_log 
      VALUES ('EMP_TRG', 'DELETE', :old.empno, 
               SYS_CONTEXT('USERENV', 'SESSION_USER'), sysdate); 
   END IF; 
END; 

/ 

 

-- �ǽ� 19-37 
INSERT INTO EMP_TRG 
VALUES(9999, 'TestEmp', 'CLERK', 7788, 
       TO_DATE('2018-03-03', 'YYYY-MM-DD'), 1200, null, 20); 
 
-- �ǽ� 19-38 
COMMIT; 

 

-- �ǽ� 19-39 

SELECT * 
  FROM EMP_TRG; 


-- �ǽ� 19-40 

SELECT * 
  FROM EMP_TRG_LOG; 

 

-- �ǽ� 19-41 
UPDATE EMP_TRG 
   SET SAL = 1300 
 WHERE MGR = 7788; 

 

COMMIT; 

 

-- �ǽ� 19-42 

SELECT TRIGGER_NAME, TRIGGER_TYPE, TRIGGERING_EVENT, TABLE_NAME, STATUS 
  FROM USER_TRIGGERS; 