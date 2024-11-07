-- 실습 7-1
select sum(sal) from emp;


-- 실습 7-2
-- 단일행, 다중행 함수를 동시에 사용시 오류 
select ename,sum(sal) from emp;

-- 실습 7-3
select sum(comm) from emp;

-- 실습 7-4
-- distinct , all 
select sal from emp;
select sum(distinct sal), sum(all sal), sum(sal) from emp;


-- 실습 7-5
select count(*) from emp;

-- 실습 7-6 

SELECT COUNT(*) 

  FROM EMP 

 WHERE DEPTNO = 30; 

 

-- 실습 7-7 

SELECT COUNT(DISTINCT SAL), 

       COUNT(ALL SAL), 

       COUNT(SAL) 

  FROM EMP; 

 

-- 실습 7-8 

SELECT COUNT(COMM) 

  FROM EMP; 

 

-- 실습 7-9 

SELECT COUNT(COMM) 

  FROM EMP 

 WHERE COMM IS NOT NULL; 

 
