-- 서브쿼리  
-- SCOTT 직원의 고용일보다 이후에 고용된 직원들  
-- 단일행 서브쿼리는 서브쿼리 결과가 한줄만 나와야 된다.  

 select ename 이름, hiredate 고용일자  
from emp  
where hiredate > ( select hiredate   
                    from emp   
                    where ename = 'SCOTT');  

 

-- 집계함수 서브쿼리  
select ename 이름, job 직종, sal 급여  
from emp  
where sal = (select min(sal) from emp);   

 

-- 예제 풀기 1  
SELECT ename 이름, sal 급여  
FROM emp  
WHERE sal > ( SELECT sal FROM emp WHERE ename = 'SCOTT');  

 

-- 예제 풀기 2  

SELECT empno 직원번호, ename 이름, deptno 부서번호, sal 급여  
FROM emp  
WHERE deptno = ( SELECT deptno FROM emp WHERE ename = 'SCOTT')  
AND sal > ( SELECT sal FROM emp WHERE ename = 'SMITH');
SELECT sal FROM emp WHERE ename = 'SMITH';

 

-- 예제 풀기 3  
SELECT ename 이름, sal 급여, mgr 매니저  
FROM emp  
WHERE mgr = ( SELECT empno FROM emp WHERE ename = 'SCOTT');  
select * from emp;


-- 예제 풀기 4  
 SELECT *   
FROM emp  
WHERE deptno = ( SELECT deptno FROM dept WHERE deptno = 10 );  

-- 다중행 서브쿼리  


select min(sal)  
from emp  
group by deptno;  

-- 부서별 최소급여와 같은 급여를 받는 직원들  
select empno, ename  
from emp  
where sal IN (select min(sal)  
                from emp  
                group by deptno);  

 

-- 다중열 ANY연산자 : 서브쿼리 결과중 하나라도 참이면 검색됨               
SELECT empno, ename, job, sal  
FROM emp  
WHERE sal  < ANY  
                   ( SELECT sal  
                      FROM emp
                      WHERE job = 'MANAGER')  
AND job <> 'MANAGER' 
ORDER BY sal DESC;  
 SELECT sal  
                      FROM emp
                      WHERE job = 'MANAGER';

 

-- ALL: 서브쿼리 결과가 모두 참이여야지 검색됨  

SELECT empno, ename, job, sal  
FROM emp  
WHERE sal  < ALL  
                    ( SELECT sal  
                      FROM emp  
                      WHERE job = 'MANAGER')  
AND job <> 'MANAGER'  
ORDER BY sal DESC;  

  

 

-- 예제 1  

 SELECT empno, ename, job  직종, sal 급여  
FROM emp  
WHERE mgr IN (SELECT mgr FROM emp WHERE deptno = 20)  
 AND deptno != 20;  
 

-- 예제 2    

 SELECT empno, ename, job  직종, sal 급여  
FROM emp  
WHERE sal < ANY(SELECT sal FROM emp WHERE job = 'MANAGER');  


-- 예제 3  

 

SELECT empno, ename, job  직종, sal 급여  

 

FROM emp  

 

WHERE sal < ALL(SELECT sal FROM emp WHERE job = 'MANAGER');  

 

  

 

-- 서브쿼리 다중열  

 

-- 브루스와 같은 직종및 같은 상사를 가진 직원들  
 SELECT empno, ename, job, sal, mgr  
FROM emp  
WHERE (mgr, job) IN  (SELECT mgr, job  
                                FROM emp  
                                WHERE ename = 'SCOTT')  
AND ename <> 'SCOTT';  

 

  

 

-- 집합연산자 (UNION, INTERSECT, MINUS)  

--UNION (107 + 10) = 117 인데 총 115줄  

select empno, job  
from emp  
union  
select deptno, dname  
from dept;  

 

--INTERSECT (중복되는 값만 나옴)  
select empno, job  
from emp  
INTERSECT  
select deptno, dname  
from dept;  

 

--마이너스 A-B를 빼면 중복된 2개가 빠져서 총 105의 결과  

 

select empno, job  
from emp  

MINUS  
 

select empno, job  

 

from emp  

 

INTERSECT  

 

select deptno, dname  

 

from dept;  

 

  

 

-- 예제 1  

 

SELECT deptno 부서번호 FROM emp  

 

UNION  

 

SELECT deptno FROM dept;  

 

-- 예제 2  

 

SELECT deptno 부서번호 FROM emp  

 

UNION ALL  

 

SELECT deptno FROM dept;  

 

-- 예제 3  

 

SELECT deptno 부서번호 FROM emp  

 

INTERSECT  

 

SELECT deptno FROM dept;  

 

-- 예제 4  

 

SELECT deptno 부서번호 FROM emp  

 

MINUS  

 

SELECT deptno FROM dept;  

 

  

 

  

 

  

 

  

 

  

 

  

 

  

 

  

 

  

 

  

 

  

 

  