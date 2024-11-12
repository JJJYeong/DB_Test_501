-- 직원테이블의 인덱스 모음 

SELECT  
      TABLE_NAME             테이블명, 
      INDEX_NAME             인덱스이름, 
      COLUMN_NAME            컬럼이름 
FROM ALL_IND_COLUMNS  
WHERE TABLE_NAME = 'EMP'; 

-- 기본키, 유니크 열은 자동으로 인덱스가 생성됨 또한 기본키를 참조하는 외래키도 인덱스가 있음 

 

-- 예제용 멤버 테이블 만들기 
drop table members;
CREATE TABLE members( 
    member_id NUMBER, 
    first_name VARCHAR2(100) NOT NULL, 
    last_name VARCHAR2(100) NOT NULL, 
    gender CHAR(1) NOT NULL, 
    dob DATE NOT NULL, 
    email VARCHAR2(255) NOT NULL, 
    PRIMARY KEY(member_id) --제약조건을 아래의 행에 따로 넣을때 괄호안에 열의 이름 입력 
); 

SELECT  
      TABLE_NAME             테이블명, 
      INDEX_NAME             인덱스이름, 
      COLUMN_NAME            컬럼이름 
FROM ALL_IND_COLUMNS  
WHERE TABLE_NAME = 'MEMBERS'; --테이블명은 대문자 

 

select * from members 

where last_name = 'Harse'; 

 

EXPLAIN PLAN FOR 

select * from members 

where last_name = 'Harse'; 

-- 보고서 확인 

SELECT  
    PLAN_TABLE_OUTPUT  
FROM  
    TABLE(DBMS_XPLAN.DISPLAY()); 

 

--인덱스 만들기 멤버즈 테이블의 last_name열 , 이름은 members_last_name_i 

CREATE INDEX members_last_name_i 
ON members(last_name); 

 

-- 인덱스 삭제 (인덱스는 테이블 삭제시 자동삭제됨) 

DROP INDEX MEMBERS_LAST_NAME_I; 

 

 

 