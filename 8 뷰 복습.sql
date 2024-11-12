-- 뷰 view 가상의 테이블 
CREATE VIEW EMP_V2 
AS 
select empno 직원번호, ename 이름, hiredate, job 
from emp; 

 

select * from emp_v2; 

INSERT INTO emp_v2 VALUES(1234,'이상용',sysdate,'강사'); 

-- 뷰는 실제 물리적인 테이블이 아닌데 입력을 했음 => 실제로 뷰를 만든 테이블에 입력됨! 

Delete from emp_v2 where 직원번호 = 1234; 

select * from emp; 

 

-- 읽기만 가능한 뷰로 만들기(with read only) 

CREATE VIEW EMP_read(직원번호,이름,성,이메일,고용일자,직종) 

AS 

select empno, ename, hiredate, job 

from emp with read only; 

 

select * from emp_read; 

Delete from emp_read where 직원번호 = 1234; 

-- 읽기만 가능한 뷰는 DML(입력,수정,삭제)가 안됨.  