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


