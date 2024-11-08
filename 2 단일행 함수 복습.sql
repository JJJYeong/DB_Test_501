--문자형함수 

select LOWER('ABC'), UPPER('abc'), INITCAP('abc') 
from dual; 

-- CONCAT , 연산자 || 과 동일함
-- SUBSTR(문자열,시작위치,문자열개수) 

select CONCAT('헬로우',' 월드!'), 
SUBSTR('헬로우월드',2,2), LENGTH('헬로우'), 
INSTR('헬로우','로'), TRIM('   공백   '),
'    공백   '  
from dual; 

-- 문자형 함수 예제 
SELECT deptno, ename, deptno 
FROM emp 
WHERE lower(ename) = 'higgins'; 

 

select ename, CONCAT('직업명이 ',job) as 직업명 
from emp 
where SUBSTR(job,4,3) = 'REP'; 

-- 문자열 치환 함수 replace 

SELECT REPLACE('헬로우월드','월드','세상') FROM DUAL; 

-- 예제 1,2 

SELECT ename 이름, LOWER(ename), UPPER(ename), INITCAP(ename) 
FROM emp; 

 

SELECT job 직업명, SUBSTR(job, 1,2) 앞의2개 FROM emp; 

 

-- 숫자형 함수 round는 반올림, trunc는 버림 

select ROUND(15.193,1) 소수첫째, ROUND(15.193) 정수, ROUND(15.193,2) 소수둘째 

from dual; 

select TRUNC(15.193,1) 소수첫째, TRUNC(15.193) 정수, TRUNC(15.193,2) 소수둘째 

from dual; 

-- mod 는 나눈 나머지 

-- 짝수번째 번호를 가진 직원들을 출력 

select empno 짝수번호, ename 이름 

from emp 

where MOD(empno, 2) = 0 

order by 1; --첫번째 열로 정렬 

-- 날짜형 함수 

SELECT  ROUND(sysdate, 'DD') 일, 

        ROUND(sysdate, 'MM') 월,    

        ROUND(sysdate, 'YYYY') 년도,  

        MONTHS_BETWEEN('2017/10/10', '2017/07/10') 월차이, 

        ADD_MONTHS('2017/07/10', 3) 애드먼쓰 

FROM dual; 

-- 날짜 연산 

SELECT SYSDATE-1 어제, SYSDATE 오늘, SYSDATE+1 내일 

FROM DUAL; 

-- 90번 부서 직원들의 근무일자(오늘까지) 

SELECT ename, FLOOR(SYSDATE - hiredate) 근무일수  

FROM emp 

WHERE deptno = 30; 

 

-- 예제 1 

SELECT sysdate, hiredate, TRUNC(MONTHS_BETWEEN(SYSDATE,hiredate), 1) 월차이 

FROM emp where deptno = 30; 

-- 예제 2 

SELECT hiredate, ADD_MONTHS(hiredate , 3) 더하기3개월, ADD_MONTHS(hiredate , -3) 빼기3개월 

FROM emp WHERE empno BETWEEN 7000 AND 8000; 

 

-- 변환형 함수 

-- TO_CHAR 숫자를 형식에 맞게 문자열로 표시 

SELECT  

TO_CHAR(12345678,'999,999,999') 콤마, 

TO_CHAR(123.45678,'999,999,999.99') 소수점, 

TO_CHAR(123.45678,'$999,999,999.99') 달러, 

TO_CHAR(12345678,'L999,999,999') 원화 

FROM DUAL; 

-- 날짜를 문자열로 변환 

-- 년,월,일,시,분,초 예제 

SELECT TO_CHAR(SYSDATE, 'YYYY MM DD HH24:MI:SS') 현재날짜시간 

FROM DUAL; 

 

-- 예제 1,2 

SELECT empno , TO_CHAR(hiredate, 'MM/YY') 입사월 

FROM emp WHERE deptno = 30; 

 

SELECT ename 이름 , TO_CHAR( sal, '$99,999.99') 월급 

FROM emp WHERE sal > 1000 ORDER BY sal DESC; 

 

-- 문자열을 DATE 타입으로 변환하는 예제 

SELECT TO_DATE('2011-01-01','YYYY-MM-DD')  

FROM DUAL; 

-- 문자를 숫자로 변환하는 간단한 예제이다. 

SELECT TO_NUMBER('012') + 10 

FROM DUAL;  

 

-- 널값 관련 함수 

-- NVL함수는 null값 대신에 값을 바꾸어준다. 

select ename, NVL(mgr, 0) 매니저 

from emp where ename = 'KING'; 

--NVL2은 해당열의 널값이 아닐경우와 널값인경우 모두 값을 바꾸어준다. 

select ename, NVL2(mgr, 1, 0) 매니저 

from emp where ename = 'KING'; 

-- 예제 1 

SELECT ename 이름, sal 월급, NVL(comm, 0) 커미션,  

        sal*12 + sal*12*NVL(comm, 0) 연봉 

FROM emp ORDER BY 연봉 DESC; 

-- 예제 2 

SELECT ename 이름, sal 월급, NVL(comm, 0) 커미션,  

        sal*12 + sal*12*NVL(comm, 0) 연봉, 

        NVL2(comm, '월급+커미션' ,'월급만' ) 연봉계산방법 

FROM emp ORDER BY 연봉 DESC; 

 

-- decode 함수 

SELECT ename 이름, job, sal, 

    DECODE(job, 'IT_PROG',  sal * 1.10, 

                   'ST_CLERK', sal * 1.15, 

                   'SA_REP',   sal * 1.20, 

                               sal)  "수정월급" 

FROM emp; 

--어려운 예제 

SELECT ename 이름, job 직무, sal 월급, 

    DECODE( TRUNC(sal/2000),  0,  0, 

                                 1,  0.09, 

                                 2,  0.2, 

                                 3,  0.3, 

                                 4,  0.4, 

                                 5,  0.42, 

                                 6,  0.44, 

                                     0.45 )  세율 

FROM emp; 

-- CASE 문은 비교 가능 

SELECT ename 이름, job, sal, 

    CASE  WHEN sal<5000   THEN 'Low' 

          WHEN sal<10000  THEN 'Medium' 

          WHEN sal<20000  THEN 'Good' 

          ELSE                    'Excellent'   

    END "급여 등급" 

FROM emp; 

 

-- CASE 예제  

SELECT ename 이름, job, sal, 

    CASE  WHEN sal>=3000   THEN '상위급여' 

          WHEN sal>=2000   THEN '중위급여' 

          ELSE                     '하위급여'   

    END  급여등급 

FROM emp WHERE job = 'MANAGER'; 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 