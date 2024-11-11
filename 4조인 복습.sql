-- 기본 조인 방법  

select empno 직원번호, ename 이름, e.deptno 부서번호, dname 부서명  
from emp e JOIN dept d  
ON e.deptno = d.deptno;  
 

-- 3개 테이블 조인  
select e.empno, e.ename, d.dname , e2.empno , e2.ename 
from emp e  
JOIN dept d  
    ON e.deptno = d.deptno  
JOIN emp e2  
    ON e.mgr = e2.empno;  

 -- 조인과 함께 where 조건절을 적는다고 하면  

 

select empno 직원번호, ename 이름, e.deptno 부서번호, dname 부서명  

from emp e JOIN dept d  
    ON e.deptno = d.deptno  


where d.deptno = 30;  

 

  
-- 자체조인 (같은 테이블내에서 참조하고 있을경우)  

 

select e.ename 직원, m.ename 매니저  

 

from emp e JOIN emp m  

 

    ON e.mgr = m.empno;  

 

  

 

-- 외부조인  

 

-- 왼쪽 외부조인  

 

select ename 직원, e.deptno 부서번호, d.dname 부서명  

 

from emp e LEFT OUTER JOIN dept d  

 

    ON e.deptno = d.deptno;  

 

-- 오른쪽 외부조인  

 

select ename 직원, d.deptno 부서번호, d.dname 부서명  

 

from emp e RIGHT OUTER JOIN dept d  

 

    ON e.deptno = d.deptno;  

 

-- 풀 외부조인  

 

select ename 직원, d.deptno 부서번호, d.dname 부서명  

 

from emp e FULL OUTER JOIN dept d  

 

    ON e.deptno = d.deptno;  

 

  

 