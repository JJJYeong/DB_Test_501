 

 

-- 데이터 조회하기 

select deptno 부서번호, dname 부서이름  

from dept; 

-- 산술연산(+-*/) 

select ename 이름, job 직종, salary 월급, salary+100 보너스월급, salary - salary*0.1 감봉 

from emp; 

-- DISTINCT 중복 값 제거 (똑같은 값이 있을경우 하나만 표시됨) 

select DISTINCT job 직종 

from emp; 

-- 예제 문제 풀기 

--1 

select empno, ename, ename 

from emp; 

--2 

select ename, salary,  salary * 1.1  AS 뉴셀러리 

from emp; 

--3 

select empno 사원번호, ename 이름, ename 성 

from emp; 

-- 연결 연산자 || 문자열을 연결 

SELECT ename || ' is a '|| job as 직업정보 

from emp; 

-- 예제 4 

SELECT empno, ename||' '||ename 풀네임, email||'@company.com' 이메일 

from emp; 

-- WHERE 조건절 

select * 

from emp 

where salary > 14000; 

 

select * 

from emp 

where ename = 'King'; -- 같을경우 = , 데이터는 대소문자를 구별한다. 문자열은 한개따옴표 

 

SELECT *  

FROM emp 

WHERE hire_date < '2002-06-10'; --날짜도 비교가 된다. 비교시 문자열을 날짜형태로 적으면 자동변환됨 

-- AND OR NOT 연산자 

select ename, deptno, salary 

from emp 

where deptno = 60 

OR deptno = 80 AND salary > 10000;  

--NOT 

select * 

from emp 

where not(hire_date >'2004/01/01' OR salary > 5000); 

-- where (hire_date <='2004/01/01' AND salary <= 5000); 

-- 1 

select * from emp 

where salary > 4000 AND job = 'IT_PROG'; 

-- 2 

select * from emp 

where salary > 4000 AND (job = 'IT_PROG' OR job = 'FI_ACCOUNT'); 

 

-- IN 연산자 

select * from emp 

where salary = 4000 OR salary = 3000 OR salary = 2700; 

 

select * from emp 

where salary IN(4000, 3000, 2700); 

--1  

select * from emp 

where salary IN(10000, 17000, 24000); 

--2 

select * from emp 

where deptno NOT IN(30,50,80,100,110); 

 

-- BETWEEN 

--1 

select * from emp 

where salary BETWEEN 10000 AND 20000; 

--2 

select * from emp 

where hire_date BETWEEN '2004-01-01' AND '2004-12-30'; 

--3 

select * from emp 

where salary NOT BETWEEN 7000 AND 17000; 

 

-- LIKE 연산자 문자열 키워드 조회시 % 또는 _ 같이 사용 

SELECT * 

FROM emp 

WHERE ename LIKE 'B%'; --B로 시작하는 모든 문자열 검색 

SELECT * 

FROM emp 

WHERE ename LIKE '%b%'; --중간에 b가 들어가는 모든 문자열 

SELECT * 

FROM emp 

WHERE ename LIKE '____y'; -- 언더바_는 딱 한 문자를 의미 

-- 예제 1 

SELECT * FROM emp 

WHERE job LIKE '%AD%'; 

-- 예제 2 

SELECT * FROM emp 

WHERE job LIKE '%AD___'; 

-- 예제 3 

SELECT * FROM emp 

WHERE phone_number LIKE '%1234'; 

-- 예제 4 

SELECT * FROM emp 

WHERE phone_number NOT LIKE '%3%' AND phone_number LIKE '%9'; 

-- 예제 5 

SELECT * FROM emp 

WHERE job LIKE '%MGR%' OR  job LIKE '%ASST%'; 

 

-- 널값을 검색할때 is null 

SELECT * FROM emp 

where commission_pct is null; 

-- 널이 아닌 경우 is not null 

SELECT * FROM emp 

where commission_pct is not null; 

-- 예제  

SELECT * FROM emp 

where manager_id is null; 

 

-- ORDER BY 정렬순서를 정함 

SELECT * FROM emp 

ORDER BY salary DESC; -- ASC(순차적,디폴트 생략가능) DESC(내림차순) 

-- 2개 이상 열로 정렬시 

SELECT deptno, empno, ename, ename  

FROM emp 

ORDER BY deptno , empno; -- 처음에 부서번호순이고 같으면 직원번호순서 

-- 별칭열로 정렬 

SELECT deptno, ename, salary*12 연봉 

FROM emp 

ORDER BY 연봉 DESC; --연봉이 큰순으로 정렬 

--1 

SELECT empno, ename, ename 

FROM emp 

ORDER BY empno DESC; 

--2 

SELECT * FROM emp 

where job LIKE '%CLERK%' 

ORDER BY salary DESC; 

-- 3 

SELECT empno 직원번호, ename 이름, deptno 부서번호, salary 월급 

FROM emp 

where empno BETWEEN 120 AND 150 

ORDER BY deptno DESC, salary DESC; 

 

