-- �ǽ� 18-1 
DECLARE 
   V_DEPT_ROW DEPT%ROWTYPE; 
BEGIN 
   SELECT DEPTNO, DNAME, LOC INTO V_DEPT_ROW 
     FROM DEPT 
    WHERE DEPTNO = 40; 
   DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO); 
   DBMS_OUTPUT.PUT_LINE('DNAME : ' || V_DEPT_ROW.DNAME); 
   DBMS_OUTPUT.PUT_LINE('LOC : ' || V_DEPT_ROW.LOC); 
END; 

/ 

 

-- �ǽ� 18-2 
DECLARE 
   -- Ŀ�� �����͸� �Է��� ���� ���� 
   V_DEPT_ROW DEPT%ROWTYPE; 
   -- ����� Ŀ�� ����(Declaration) 
   CURSOR c1 IS 
      SELECT DEPTNO, DNAME, LOC 
        FROM DEPT 
       WHERE DEPTNO = 40; 
BEGIN 
   -- Ŀ�� ����(Open) 
   OPEN c1; 
   -- Ŀ���κ��� �о�� ������ ���(Fetch) 
   FETCH c1 INTO V_DEPT_ROW; 
   DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO); 
   DBMS_OUTPUT.PUT_LINE('DNAME : ' || V_DEPT_ROW.DNAME); 
   DBMS_OUTPUT.PUT_LINE('LOC : ' || V_DEPT_ROW.LOC); 
   -- Ŀ�� �ݱ�(Close) 
   CLOSE c1; 
END; 

/ 

 

-- �ǽ� 18-3 
DECLARE 
   -- Ŀ�� �����͸� �Է��� ���� ���� 
   V_DEPT_ROW DEPT%ROWTYPE; 
   -- ����� Ŀ�� ����(Declaration) 
   CURSOR c1 IS 
      SELECT DEPTNO, DNAME, LOC 
        FROM DEPT; 
BEGIN 
   -- Ŀ�� ����(Open) 
   OPEN c1; 
   LOOP 
      -- Ŀ���κ��� �о�� ������ ���(Fetch) 
      FETCH c1 INTO V_DEPT_ROW; 
      -- Ŀ���� ��� ���� �о���� ���� %NOTFOUND �Ӽ� ���� 
      EXIT WHEN c1%NOTFOUND; 
      DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO 
                        || ', DNAME : ' || V_DEPT_ROW.DNAME 
                        || ', LOC : ' || V_DEPT_ROW.LOC); 
   END LOOP; 
   -- Ŀ�� �ݱ�(Close) 
   CLOSE c1; 
END; 

/ 
-- �ǽ� 18-4 
DECLARE 
   -- ����� Ŀ�� ����(Declaration) 
   CURSOR c1 IS 
   SELECT DEPTNO, DNAME, LOC 
     FROM DEPT; 
BEGIN 
   -- Ŀ�� FOR LOOP ���� (�ڵ� Open, Fetch, Close) 
   FOR c1_rec IN c1 LOOP 
      DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || c1_rec.DEPTNO 
                      || ', DNAME : ' || c1_rec.DNAME 
                      || ', LOC : ' || c1_rec.LOC); 
   END LOOP; 
END; 

/ 
 
SELECT * FROM DEPT_RECORD; 


-- �ǽ� 18-5 
DECLARE 
   -- Ŀ�� �����͸� �Է��� ���� ���� 
   V_DEPT_ROW DEPT%ROWTYPE; 
   -- ����� Ŀ�� ����(Declaration) 
   CURSOR c1 (p_deptno DEPT.DEPTNO%TYPE) IS 
      SELECT DEPTNO, DNAME, LOC 
        FROM DEPT 
       WHERE DEPTNO = p_deptno; 
BEGIN 
   -- 10�� �μ� ó���� ���� Ŀ�� ��� 
   OPEN c1 (10); 
      LOOP 
         FETCH c1 INTO V_DEPT_ROW; 
         EXIT WHEN c1%NOTFOUND; 
         DBMS_OUTPUT.PUT_LINE('10�� �μ� - DEPTNO : ' || V_DEPT_ROW.DEPTNO 
                                     || ', DNAME : ' || V_DEPT_ROW.DNAME 
                                     || ', LOC : ' || V_DEPT_ROW.LOC); 
      END LOOP; 
   CLOSE c1; 
   
   -- 20�� �μ� ó���� ���� Ŀ�� ��� 
   OPEN c1 (20); 
      LOOP 
         FETCH c1 INTO V_DEPT_ROW; 
         EXIT WHEN c1%NOTFOUND; 
         DBMS_OUTPUT.PUT_LINE('20�� �μ� - DEPTNO : ' || V_DEPT_ROW.DEPTNO 
                                     || ', DNAME : ' || V_DEPT_ROW.DNAME 
                                     || ', LOC : ' || V_DEPT_ROW.LOC); 
      END LOOP; 
   CLOSE c1; 
END; 

/ 

-- �ǽ� 18-6 
DECLARE 
   -- ����ڰ� �Է��� �μ� ��ȣ�� �����ϴ� �������� 
   v_deptno DEPT.DEPTNO%TYPE; 
   -- ����� Ŀ�� ����(Declaration) 
   CURSOR c1 (p_deptno DEPT.DEPTNO%TYPE) IS 
      SELECT DEPTNO, DNAME, LOC 
        FROM DEPT 
       WHERE DEPTNO = p_deptno; 
BEGIN 
   -- INPUT_DEPTNO�� �μ� ��ȣ �Է¹ް� v_deptno�� ���� 
   v_deptno := &INPUT_DEPTNO; 
   -- Ŀ�� FOR LOOP ����. c1 Ŀ���� v_deptno�� ���� 
   FOR c1_rec IN c1(v_deptno) LOOP 
      DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || c1_rec.DEPTNO 
                      || ', DNAME : ' || c1_rec.DNAME 
                      || ', LOC : ' || c1_rec.LOC); 
   END LOOP; 
END; 

/ 

 
-- �ǽ� 18-7 
BEGIN 
   UPDATE DEPT SET DNAME='DATABASE' 
    WHERE DEPTNO = 50; 
    DBMS_OUTPUT.PUT_LINE('���ŵ� ���� �� : ' || SQL%ROWCOUNT); 
 
   IF (SQL%FOUND) THEN 
      DBMS_OUTPUT.PUT_LINE('���� ��� �� ���� ���� : true'); 
   ELSE 
      DBMS_OUTPUT.PUT_LINE('���� ��� �� ���� ���� : false'); 
   END IF; 

    IF (SQL%ISOPEN) THEN 
      DBMS_OUTPUT.PUT_LINE('Ŀ���� OPEN ���� : true'); 
   ELSE 
      DBMS_OUTPUT.PUT_LINE('Ŀ���� OPEN ���� : false'); 
   END IF; 

END; 

/ 

 
-- �ǽ� 18-8 
DECLARE 
   v_wrong NUMBER; 
BEGIN 
   SELECT DNAME INTO v_wrong 
     FROM DEPT 
    WHERE DEPTNO = 10; 
END; 

/ 

 
-- �ǽ� 18-9 
DECLARE 
   v_wrong NUMBER; 
BEGIN 
   SELECT DNAME INTO v_wrong 
     FROM DEPT 
    WHERE DEPTNO = 10; 
EXCEPTION 
   WHEN VALUE_ERROR THEN 
      DBMS_OUTPUT.PUT_LINE('���� ó�� : ��ġ �Ǵ� �� ���� �߻�'); 
END; 

/ 

 

-- �ǽ� 18-10 
DECLARE 
   v_wrong NUMBER; 
BEGIN 
   SELECT DNAME INTO v_wrong 
     FROM DEPT 
    WHERE DEPTNO = 10; 

   DBMS_OUTPUT.PUT_LINE('���ܰ� �߻��ϸ� ���� ������ ������� �ʽ��ϴ�'); 
EXCEPTION 
   WHEN VALUE_ERROR THEN 
      DBMS_OUTPUT.PUT_LINE('���� ó�� : ��ġ �Ǵ� �� ���� �߻�'); 
END; 

/ 

 

-- �ǽ� 18-11 
DECLARE 
   v_wrong NUMBER; 
BEGIN 
   SELECT DNAME INTO v_wrong 
     FROM DEPT 
    WHERE DEPTNO = 10; 
   DBMS_OUTPUT.PUT_LINE('���ܰ� �߻��ϸ� ���� ������ ������� �ʽ��ϴ�'); 

EXCEPTION 
   WHEN TOO_MANY_ROWS THEN 
      DBMS_OUTPUT.PUT_LINE('���� ó�� : �䱸���� ���� �� ���� ���� �߻�'); 
   WHEN VALUE_ERROR THEN 
      DBMS_OUTPUT.PUT_LINE('���� ó�� : ��ġ �Ǵ� �� ���� �߻�'); 
   WHEN OTHERS THEN 
      DBMS_OUTPUT.PUT_LINE('���� ó�� : ���� ���� �� ���� �߻�'); 
END; 

/ 

 

-- �ǽ� 18-12 

DECLARE 
   v_wrong NUMBER; 
BEGIN 
   SELECT DNAME INTO v_wrong 
     FROM DEPT 
    WHERE DEPTNO = 10; 
 
   DBMS_OUTPUT.PUT_LINE('���ܰ� �߻��ϸ� ���� ������ ������� �ʽ��ϴ�'); 

EXCEPTION 
   WHEN OTHERS THEN 
      DBMS_OUTPUT.PUT_LINE('���� ó�� : ���� ���� �� ���� �߻�'); 
      DBMS_OUTPUT.PUT_LINE('SQLCODE : ' || TO_CHAR(SQLCODE)); 
      DBMS_OUTPUT.PUT_LINE('SQLERRM : ' || SQLERRM); 
END; 

/ 

 