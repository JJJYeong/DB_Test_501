-- 실습 7-1
select sum(sal) from emp;


-- 실습 7-2
-- 단일행, 다중행 함수를 동시에 사용시 오류 
select ename,sum(sal) from emp;

-- 실습 7-3
select sum(comm) from emp;

-- 실습 7-4
-- distinct , all 
select sum(distinct sal), sum(all sal), sum(sal) from emp;

