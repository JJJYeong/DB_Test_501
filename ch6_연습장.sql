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
  
  -- 실습 6-20 
SELECT TRUNC(1234.5678) AS TRUNC, 
       TRUNC(1234.5678, 0) AS TRUNC_0, 
       TRUNC(1234.5678, 1) AS TRUNC_1, 
       TRUNC(1234.5678, 2) AS TRUNC_2, 
       TRUNC(1234.5678, -1) AS TRUNC_MINUS1, 
       TRUNC(1234.5678, -2) AS TRUNC_MINUS2 
  FROM DUAL; 

-- 실습 6-21 
SELECT CEIL(3.14), -- 3 ---- 4 사이 중에서,큰수 
       FLOOR(3.14), -- 3 ---- 4 사이 중에서,작은수
       CEIL(-3.14), -- -4 -- -3.14-- -3 사이 중에서,큰수
       FLOOR(-3.14) -- -4 -- -3.14-- -3 사이 중에서,작은수
  FROM DUAL; 

-- 실습 6-22 
SELECT MOD(15, 6), 
       MOD(10, 2), 
       MOD(11, 2) 
  FROM DUAL; 
  
  -- 실습 6-23 
SELECT SYSDATE AS NOW, 
       SYSDATE-1 AS YESTERDAY, 
       SYSDATE+1 AS TOMORROW 
  FROM DUAL; 
  
-- 실습 6-24 
SELECT SYSDATE, 
       ADD_MONTHS(SYSDATE, 3) 
  FROM DUAL; 
  
-- 실습 6-25 
SELECT EMPNO, ENAME, HIREDATE, 
       ADD_MONTHS(HIREDATE, 120) AS WORK10YEAR 
  FROM EMP;   
  
-- 실습 6-26 
SELECT EMPNO, ENAME, HIREDATE, SYSDATE ,ADD_MONTHS(HIREDATE,600)
  FROM EMP 
 WHERE ADD_MONTHS(HIREDATE,500) > SYSDATE; 
  
select *  from emp;

SELECT EMPNO, ENAME, HIREDATE, SYSDATE ,ADD_MONTHS(HIREDATE,600)
  FROM EMP 
 WHERE ADD_MONTHS(HIREDATE,500) > SYSDATE;   
 
-- 실습 6-27 
SELECT EMPNO, ENAME, HIREDATE, SYSDATE, 
       MONTHS_BETWEEN(HIREDATE, SYSDATE) AS MONTHS1, 
       MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTHS2, 
       TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE))/12 AS MONTHS3 
FROM EMP;  
 
 -- 실습 6-28 
SELECT SYSDATE, 
       NEXT_DAY(SYSDATE, '월요일'), 
       LAST_DAY(SYSDATE) 
  FROM DUAL; 
  
  -- 실습 6-30 
-- 많이 사용할 일이 없음. 
SELECT SYSDATE, 
       TRUNC(SYSDATE, 'CC') AS FORMAT_CC, 
       TRUNC(SYSDATE, 'YYYY') AS FORMAT_YYYY, 
       TRUNC(SYSDATE, 'Q') AS FORMAT_Q, 
       TRUNC(SYSDATE, 'DDD') AS FORMAT_DDD, 
       TRUNC(SYSDATE, 'HH') AS FORMAT_HH 
  FROM DUAL; 
  
-- 실습 6-31 
SELECT EMPNO, ENAME, EMPNO + '500' 
  FROM EMP 
 WHERE ENAME = 'SCOTT';   
 
 -- 실습 6-33 
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS 현재날짜시간 
  FROM DUAL; 
  
  -- 실습 6-34 

SELECT SYSDATE, 
       TO_CHAR(SYSDATE, 'MM') AS MM, 
       TO_CHAR(SYSDATE, 'MON') AS MON, 
       TO_CHAR(SYSDATE, 'MONTH') AS MONTH, 
       TO_CHAR(SYSDATE, 'DD') AS DD, 
       TO_CHAR(SYSDATE, 'DY') AS DY, 
       TO_CHAR(SYSDATE, 'DAY') AS DAY 
  FROM DUAL; 
  
  -- 실습 6-35 

SELECT SYSDATE, 
       TO_CHAR(SYSDATE, 'MM') AS MM, 
       TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = KOREAN' ) AS MON_KOR, 
       TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = JAPANESE') AS MON_JPN, 
       TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = ENGLISH' ) AS MON_ENG, 
       TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = KOREAN' ) AS MONTH_KOR, 
       TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = JAPANESE') AS MONTH_JPN, 
       TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = ENGLISH' ) AS MONTH_ENG 
  FROM DUAL; 

 

-- 실습 6-36 

SELECT SYSDATE, 
       TO_CHAR(SYSDATE, 'MM') AS MM, 
       TO_CHAR(SYSDATE, 'DD') AS DD, 
       TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = KOREAN' ) AS DY_KOR, 
       TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = JAPANESE') AS DY_JPN, 
       TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = ENGLISH' ) AS DY_ENG, 
       TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = KOREAN' ) AS DAY_KOR, 
       TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = JAPANESE') AS DAY_JPN, 
       TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = ENGLISH' ) AS DAY_ENG 
  FROM DUAL; 

 

-- 실습 6-37 

SELECT SYSDATE, 
       TO_CHAR(SYSDATE, 'HH24:MI:SS') AS HH24MISS, 
       TO_CHAR(SYSDATE, 'HH12:MI:SS AM') AS HHMISS_AM, 
       TO_CHAR(SYSDATE, 'HH:MI:SS P.M.') AS HHMISS_PM 
  FROM DUAL; 
  
  - 실습 6-38 

SELECT SAL, 

       TO_CHAR(SAL, '$999,999') AS SAL_$, 

       TO_CHAR(SAL, 'L999,999') AS SAL_L, 

       TO_CHAR(SAL, '999,999.00') AS SAL_1, 

       TO_CHAR(SAL, '000,999,999.00') AS SAL_2, 

       TO_CHAR(SAL, '000999999.99') AS SAL_3, 

       TO_CHAR(SAL, '999,999,00') AS SAL_4 

  FROM EMP; 

 

-- 실습 6-39 

SELECT 1300 - '1500', 

      '1300' + 1500 

 FROM DUAL; 

 

-- 실습 6-40 

SELECT '1,300' - '1,500' 

  FROM DUAL; 

 

-- 실습 6-41 

SELECT TO_NUMBER('1,300', '999,999') - TO_NUMBER('1,500', '999,999') 

  FROM DUAL; 
  
 