
select * from tb_emp;

-- 테이블 생성(DDL:  데이터 정의어)
-- 학생들의 성적 정보를 저장할 데이터 구조
-- 대소문자 구분 없음
-- NOT NULL , NULL 둘 다 있는 명령어임

CREATE TABLE tbl_score (
    name VARCHAR2(4) NOT NULL,
    kor NUMBER(3) NOT NULL CHECK(kor >= 0 AND kor <= 100),
    eng NUMBER(3) NOT NULL CHECK(eng >= 0 AND eng <= 100), 
    math NUMBER(3) NOT NULL CHECK(math >= 0 AND math <= 100), 
    total NUMBER (3) NULL,
    -- 소수점까지 포함한 총 자리수 , 소수점 자리수
    average NUMBER(5,2),
    -- 한글자 표현
    grade CHAR(1), 
    stu_num NUMBER (6) PRIMARY KEY
    );
    
    -- Alter 문을 제약조건 추가하기
    -- STU_NUM에 깜빡하고 PRIMARY KEY를 안걸었다...!
    ALTER TABLE TBL_SCORE
    -- 변수선언(?) 해줘야 데이터 변별할 수 있다.
    -- 나중에 지울때 쓸 수있다.
    ADD CONSTRAINT PK_TBL_SCORE
    PRIMARY KEY (STU_NUM);

    -- PK REMOVE
    ALTER TABLE TBL_SCORE
    DROP CONSTRAINT PK_TBL_SCORE
    
    -- 데이터를 조회할 때
    SELECT * FROM tbl_score;

-- 컬럼 추가하기 (ALTER)
ALTER TABLE tbl_score
ADD (sci NUMBER(3) NOT NULL);

-- 컬럼 제거하기 
ALTER TABLE tbl_score
DROP COLUMN sci;

-- drop : 아주 강력한 테이블 제거
-- 테이블 복사 (CTAS)
CREATE TABLE tb_emp_copy
AS SELECT * FROM tb_emp;

DROP TABLE tb_emp_copy;

SELECT * FROM tb_emp_copy;

-- TRUNCATE : 
-- 구조는 남기고 안의 데이터만 삭제하여
-- 테이블이 생성된 초기 상태로 돌아간다. 

TRUNCATE TABLE tb_emp_copy; 

    