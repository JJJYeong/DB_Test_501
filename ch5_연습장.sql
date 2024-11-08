-- 실습 5-1 
select * from emp;

-- 실습 5-2
select * from emp where deptno = 30;
select * from emp where JOB = 'CLERK';

-- 실습 5-3
select ename, sal , mgr from emp 
where 
deptno = 30 
and 
job = 'SALESMAN'
;

-- 실습 5-5
select * from emp 
where 
deptno = 30 
or 
job = 'CLERK'
;

-- 실습 5-5
select * from emp 
where SAL * 12 = 36000;

-- 실습 5-6
select * from emp 
where SAL > 3000;

-- 실습 5-7, 
-- 이름의 첫글자를 f를 기준으로 사전식 정렬
select * from emp 
where ENAME <'F';

-- 실습 5-8, 
-- 등가 비교
select * from emp 
where sal != 3000;

select * from emp 
where sal <> 3000;

select * from emp 
where sal ^= 3000;

select * from emp 
where not sal = 3000;

-- 실습 5-13, 
-- or 
select * from emp 
where job = 'MANAGER' 
OR job = 'SALESMAN' 
OR job = 'CLERK';

-- 실습 5-14, 
-- IN 연산자로 대체하기.  
select * from emp 
where job IN ('MANAGER','SALESMAN','CLERK');

-- 실습 5-16, 
-- not IN 연산자로 대체하기.  
select * from emp 
where job not IN ('MANAGER','SALESMAN','CLERK');

-- 실습 5-17, 
-- between a and b 연산자로 대체하기.  
select * from emp 
where sal >= 2000 and sal <= 3000;

select * from emp 
where sal between 2000 and 3000;

-- 반대 경우 
select * from emp 
where sal not between 2000 and 3000;

-- 실습 5-20
-- %, 0문자 이상
-- S 로시작하는 모든 문자열 검색. 
select * from emp 
where ename like 'S%';

-- 실습 5-21
-- _ , 언더바는 하나의 문자를 의미. 
select * from emp 
where ename like '__L%';


-- 실습 5-22
select * from emp 
where ename like '%AM%';


-- 실습 5-23
select * from emp 
where ename NOT like '%AM%';

-- 실습 5-24
select * from emp;

-- 실습 5-25
select * from emp
WHERE COMM = null;

-- 실습 5-26
-- is null 로 확인 다시 해보기. 
select * from emp
WHERE comm is null;

select * from emp
WHERE comm is not null;

-- 실습 5-27
-- is not null 로 확인 다시 해보기.
-- mgr , 해당 사원의 직속상관의 사원 번호 의미. 
select * from emp
WHERE mgr is not null;

-- 실습 5-33, 깔 맞춤 반드시 함. 
select empno, ename, sal, deptno from emp where deptno =10
union
select sal, job, deptno, sal from emp where deptno =10;

