-- 실습 6-1 
select ename, upper(ename), lower(ename), initcap(ename) from emp;


-- 실습 6-2
select ename from emp
where upper(ename) = upper('scott');

-- 실습 6-3
select ename from emp
where ename like upper('%scott%');
select ename from emp;

-- 실습 6-4
select ename, length(ename) from emp;

-- 실습 6-5
select ename, length(ename) from emp
where length(ename) > 5;

-- 실습 6-6
-- dual : 더미 테이블, 없는 내용을 확인시 사용함. 날짜, 계산 등, 
--  영문자 : 1글자, 1바이트, 한글 : 1글자, 2 ~ 3 바이트 확인. 
select length('이상용'),lengthb('이상용'),length('abc'),lengthb('abc') from dual;

-- 실습 6-7
-- substr , 문자열에서 특정 구간을 자르기 할 때, 사용. 
--substr(선택 컬럼, 시작위치(1부터시작), 길이만큼 추출)
--substr(선택 컬럼, 시작위치(1부터시작)): 시작 위치 부터 끝까지 출력. 
select job , substr(job,1,2), substr(job,6) from emp;

-- 실습 6-8
select job , substr(job,-length(job)), substr(job,-length(job),3) from emp;

-- 실습 6-9
SELECT INSTR('HELLO HI LOTTO','L') AS INSTR_1,
INSTR('HELLO HI LOTTO','L',5) AS INSTR_2,
INSTR('HELLO, ORACLE!','L',2,2) AS INSTR_3,
INSTR('HELLO HI LOTTO','O',2,2) AS INSTR_4
FROM DUAL;

-- 실습 6-10
select * from emp
where instr(ename,'S') > 0;

-- 실습 6-11
select * from emp
where ename like '%S%';

-- 실습 6-12
select '010-1234-5678' as 변경전_문자열,
 replace('010-1234-5678','-',' ') as 변경1문자열,
 replace('010-1234-5678','-') as 변경2문자열
 from dual;

-- 실습 6-13
select 'Oracle', lpad('Oracle',10,'#') as LPAD_ex1, 
rpad('Oracle',10,'#') as RPAD_ex2,
lpad('Oracle',10) as LPAD_ex3,
rpad('Oracle',10) as RPAD_ex4
from dual;

-- 실습 6-14
select rpad('971225-1',14,'*') as rpad_ex1,
rpad('lsy1111',20,'*') as rpad_ex2
from dual;

-- 실습 6-15
select concat(ename, empno) as concat_ex1 from emp;

-- 실습 6-16
select ename || empno as concat_ex1 from emp;


-- 실습 6-17
select '[' || trim('  Oracle  ') || ']' as Trim,
'[' || trim(leading from '  Oracle  ') || ']' as Trim_leading_ex,
'[' || trim(trailing from '  Oracle  ') || ']' as Trim_trailing_ex2,
'[' || trim(both from '  Oracle  ') || ']' as Trim_both_ex3
from dual;

-- 실습 6-18 
SELECT '[' || TRIM(' _Ora  cle_ ') || ']' AS TRIM, 
       '[' || LTRIM(' _Oracle_ ') || ']' AS LTRIM, 
       '[' || LTRIM('<_Oracle_>', '_<') || ']' AS LTRIM_2, 
       '[' || RTRIM(' _Oracle_ ') || ']' AS RTRIM, 
       '[' || RTRIM('<_Oracle_>', '>_') || ']' AS RTRIM_2 
  FROM DUAL; 
  
  -- 실습 6-19 
SELECT ROUND(1234.5678) AS ROUND, 
       ROUND(1234.5678, 0) AS ROUND_0, 
       ROUND(1234.5678, 1) AS ROUND_1, 
       ROUND(1234.5678, 2) AS ROUND_2, 
       ROUND(1234.5678, -1) AS ROUND_MINUS1, 
       ROUND(1234.5678, -2) AS ROUND_MINUS2 
  FROM DUAL; 
