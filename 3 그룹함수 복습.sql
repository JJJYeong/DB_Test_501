-- 그룹함수(집계함수) 

SELECT ROUND(AVG(sal)) 평균월급, MAX(sal), 
       MIN(sal), SUM(sal) 월급들의총합, COUNT(sal) 총갯수 
FROM emp 
WHERE job = 'MANAGER'; 

-- 그룹절 GROUP BY 그룹별 집계함수 

SELECT deptno 부서, ROUND(AVG(sal)) 평균급여 
FROM emp 
GROUP BY deptno 
ORDER BY deptno; 


-- 예제 1 
SELECT deptno 부서번호, COUNT(*) 사원수, MAX(sal) 최고급여, MIN(sal) 최소급여, 
       SUM(sal) 급여합계, ROUND(AVG(sal)) 평균급여 
FROM emp 
GROUP BY deptno  
ORDER BY 급여합계 DESC;  

 

-- 예제 2 

SELECT deptno 부서번호, job 직종, SUM(sal), COUNT(*) 직원수 
FROM emp 
GROUP BY deptno, job 
ORDER BY deptno; 

-- 예제 3 

SELECT  
   ROUND(AVG( MAX(sal) )) 부서별최고월급평균, 
   AVG( MIN(sal) ) 부서별최저월급평균 
FROM emp 
GROUP BY deptno; 

-- 그룹함수 Having 조건절 

select deptno 부서, COUNT(*) 사원수 
from emp 
group by deptno 
having count(*) > 3; --그룹조건으로 행의수(사원수)가 5가 넘는 그룹 

-- 예제 1 
SELECT job 직종, SUM(sal) 급여합계 
FROM emp WHERE job != 'MANAGER' 
GROUP BY job 
HAVING AVG(sal) > 2000  
ORDER BY 급여합계 DESC; 

 

-- 예제 2 
SELECT deptno 부서번호, ROUND( AVG(sal) ) 평균급여 
FROM emp WHERE deptno != 40 
GROUP BY deptno 
HAVING AVG(sal) <= 5000; 
-- 예제 3 

SELECT job 직업번호, SUM(sal) 급여합계 
FROM emp WHERE job NOT LIKE '%REP%' 
GROUP BY job 
HAVING SUM(sal) >= 3000 
ORDER BY 급여합계 DESC; 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 