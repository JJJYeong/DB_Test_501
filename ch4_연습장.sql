desc emp;
desc dept;
desc salgrade;

-- 실습 4-4 
-- * , 모든 컬럼. 
select * from emp;
select * from dept;
select ename,mgr,job from emp;

-- distinct
select distinct deptno from emp;

-- 4-7 distinct, 중복제거
select distinct job,deptno from emp;
select job from emp;
select distinct job from emp;

-- 4-8 , all 사용 
select all job,deptno from emp;
select job,deptno from emp;


-- 4-9, 각 컬럼에 alias , 별칭을 지정해서, 보여주는 컬럼 명 
-- 변경하기. 
select ename, sal, sal*12+comm, 
    comm from emp;
    
-- 4-10 alias , 별칭 지정, 보고 싶은 열의 이름을 정하기.
-- 컬럼 as 컬럼명으로 사용을 많이함. 
select ename, sal, sal*12+comm as 연봉, 
    comm from emp;
    
    
-- order by 기본적으로 오름차순,asc 
-- 내림차순, desc 
-- 4-12
select * from emp order by sal;
select * from emp order by sal desc;
-- 시간은 클수록 최신임. 가장 최근에 입사한 직원. 
select * from emp order by hiredate desc;
-- 시간은 작을수록 오래된직원임.
select * from emp order by hiredate;