-- ROWNUM 데이터의 일련번호 

select ROWNUM, emp.* 

from emp where ROWNUM <=5 ; 

-- 6번부터 10번까지? (로우넘은 1번부터 임시로 번호를 매기는거라 다른 조건으로는 검색안됨) 

select ROWNUM, emp.* 
from emp where ROWNUM BETWEEN 6 AND 10; 

-- 테이블에 서브쿼리로 입력시 번호 ROWNUM이 있는 테이블 

SELECT * FROM (select ROWNUM AS RN,emp.* from emp)   
WHERE RN BETWEEN 6 AND 10; 

 

-- 정렬(order by) 이전에 ROWNUM 번호를 매기기 때문에 마찬가지로 

SELECT ROWNUM, EMP.*  
FROM EMP  
WHERE ROWNUM <= 5 ORDER BY ENAME; 

-- 정렬한 테이블을 서브쿼리에 넣은 다음에 로우넘으로 번호 

SELECT ROWNUM, A.* 
FROM ( 
    SELECT EMPNO, ENAME FROM EMP ORDER BY ENAME 
) A 
WHERE ROWNUM <= 5; 

 