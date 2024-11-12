-- 테이블 만들기 

DROP TABLE comp; 

CREATE TABLE comp ( 
    고정열 CHAR(10), 
    가변열 VARCHAR2(10) 
); 

DESC comp; 

INSERT INTO comp VALUES('1','하나'); 

INSERT INTO comp VALUES('2','둘'); 

INSERT INTO comp VALUES('3','셋'); 

select * from comp; 

-- 숫자와 날짜 테이블 

CREATE TABLE ex_date( 
    id NUMBER(2), 
    start_date DATE DEFAULT SYSDATE 
); 

DESC ex_date; 

-- 디폴트값은 해당열에 값을 입력하지 않았을때 입력됨 

INSERT INTO ex_date(id) VALUES(10); 

INSERT INTO ex_date(id) VALUES(11); 

INSERT INTO ex_date(id) VALUES(12); 

SELECT * from ex_date; 

 

DROP TABLE comp; 

DROP TABLE ex_date; 

-- 테이블 제약조건 

drop table emp1; 

CREATE TABLE emp1 ( 
    id number(3) PRIMARY KEY,--기본키 
    name VARCHAR2(20) NOT NULL, --널값을 입력할수 없음 
    sal NUMBER CHECK(sal>1000) --체크는 조건을 입력 
); 

DESC emp1; 

INSERT INTO emp1 VALUES( 1, '길동', 1001); 

INSERT INTO emp1 VALUES( 2, '펭수', 10000); --기본키는 중복안됨, 널값입력안됨 

 

-- 예제 

CREATE TABLE members2 ( 
    member_id   NUMBER(2)       PRIMARY KEY, 
    first_name  VARCHAR2(50)    NOT NULL, 
    last_name   VARCHAR2(50)    NOT NULL, 
    gender      VARCHAR2(5)     CHECK (gender IN('Man', 'Woman')), 
    birth_day   DATE    DEFAULT SYSDATE, 
    email       VARCHAR2(200)   UNIQUE NOT NULL 
); 

 

DESC 부서; 

INSERT INTO 부서 VALUES(1,'경영'); 

INSERT INTO 부서 VALUES(2,'개발'); 

DELETE FROM 부서 WHERE 번호 = 1; 

 

DESC 직원; 

INSERT INTO 직원 VALUES(1,'홍길동',1); 

INSERT INTO 직원 VALUES(2,'펭수',2); 

 

-- CREATE TALBE AS 

DROP TABLE emp_temp; 

CREATE TABLE emp_temp 
AS 
select * from emp where 1!=1; --조건에 만족하는 데이터가 없음 

 

select * from emp_temp; 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 