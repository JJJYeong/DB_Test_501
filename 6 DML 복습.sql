-- 입력 INSERT 
-- 테이블 열의 데이터타입 간단히 보기 
DESC dept; 
INSERT INTO dept(deptno,dname,loc) 
VALUES(11, '게임부', '부산서면');
select * from dept;

-- 열이름 생략할때(모든 열을 다입력해야함) 

INSERT INTO dept 

VALUES(12, '게임부2', '부산서면2'); 

-- 널값이 입력될때(입력을 하지 않으면 널) 

INSERT INTO dept(deptno,dname) 

VALUES(13, '게임부3'); 

 

--직원테이블 입력 

DESC emp; 

INSERT INTO emp(empno, ename, job, mgr, hiredate, sal, comm, deptno) 
VALUES(2070,'이상용','TEA',null,sysdate, 1000, 500, null); 
INSERT INTO emp(empno, ename, job, mgr, hiredate, sal, comm, deptno) 

VALUES(2071,null,'TEA',null,sysdate, 1000, 500, null); 
select * from emp;

-- 예제 1 

INSERT INTO dept VALUES(14, '게임부4', '부산서면4'); 

INSERT INTO dept VALUES(15, '게임부5', '부산서면5');

INSERT INTO dept VALUES(16, '게임부6', '부산서면6');

 

-- 수정 UPDATE (주의 :where이 없으면 모든행이 업데이트 됨) 

-- 음악부서의 매니저와 로케이션 수정하기 

UPDATE dept 
SET dname = '수정부서1', loc = '수정지역1' 
WHERE deptno = 11; 
select * from dept;

-- 예제 부서번호 10에서 12번까지 매니저ID를 100으로 수정하기 

UPDATE dept 
SET dname = '수정부서2', loc = '수정지역2' 
WHERE deptno between 10 and 12;  
select * from dept;
 

-- 삭제하기 DELETE 

delete from dept 
where dname = '개발2'; 
delete from dept 

where dname = '게임'; 

-- 만약 삭제하는 데이터를 참조하는 테이블과 데이터가 있을경우 참조하는 데이터를 먼저 삭제해야 삭제가능 

DELETE FROM emp where ename = '이상용'; 

-- 삭제시 where절을 안적으면? : 전체가 적용되므로 주의 

UPDATE emp SET eanme = '전체 변경 샘플 롤백 할 예정'; 

 

-- 그전 상태로 복구(이전의 성공적 commit 상태로 돌아감) 

rollback; 
select * from dept;

-- 입력 수정 삭제 연습하기 

-- scott 계정 

delete from sal; 

 

 

 

 

 

 

 

 