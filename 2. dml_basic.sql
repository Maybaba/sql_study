CREATE TABLE goods (
    id NUMBER(6) PRIMARY KEY, --pr은 유일한 값으로 설정하는 것임
    goods_name VARCHAR2(10) NOT NULL,
    price NUMBER(10) DEFAULT 1000, 
    reg_date DATE
    );
    --insert 키 누르면 겹쳐쓰기로 변경됨 ㅜ 
    
    -- INSERT into table이름
    INSERT INTO goods
    (id, goods_name, price, reg_date)
    VALUES
     (1, '선풍기', 120000, SYSDATE);
     
         INSERT INTO goods
    (id, goods_name, price, reg_date)
    VALUES
     (2, '세탁기', 2000000, SYSDATE);
     
      INSERT INTO goods
    (id, goods_name, reg_date)
    VALUES
     (3, '달고나', SYSDATE);
     
           INSERT INTO goods
    (id, goods_name)
    VALUES
     (4, '계란');
     
      INSERT INTO goods
    ( goods_name, id, reg_date, price) -- insert 할 때 순서가 바뀌어도 된다. 
    VALUES --순서에 맞게 값을 입력하면 됨
     ( '점퍼', 5, SYSDATE,'49200'); --암묵적 형 변환
     
           INSERT INTO goods -- 컬럼명생략시 테이블구조 순서대로 자동 기입
    VALUES
     (6,'냉장고',100000, SYSDATE);--대신, 데이터가 하나라도 빠지면 오류
     --날짜를 넣을 때 숫자로 넣지 않기. SYSDATE-1 : 하루 전
     
     -- 데이터 수정하기 UPDATE
     UPDATE goods --타켓팅이 없으면 전체 칼럼을 바꿔버림
     SET goods_name = '에어컨'
     WHERE id = 1 --그래서 타겟팅을 해줘야함, 조건문임
     ;
     
     UPDATE goods
     SET price = 9999;
     -- 벌크 업데이트 라고 부르기도 한다. 
     
     -- 뒤로가기 버튼은 없을까? DML은 취소가 가능하다. roll-back하면 됨
     -- DDL은 롤백 할 수 없다. 
     
     UPDATE goods
     SET id = 1
     WHERE id = 11;
     
     UPDATE goods
    SET price = null
    WHERE id = 3;
    
    UPDATE goods
    SET goods_name = '청바지', 
    price = 299000
    WHERE id = 3;
    
    -- DELETE 삭제 : 한 줄을 다 삭제
    DELETE FROM goods
    WHERE id = 11;
    
    DELETE FROM goods; --조건없이 DELETE : 전체삭제
    -- 그래도 이 문법은 복구가 가능함 /DML
    TRUNCATE TABLE giids;  --복구 불가 /DDL
    DROP TABLE goods; --복구불가, 테이블도 날라감 /DDL
    
    DELETE FROM goods
    WHERE price > 1000 --신고횟수1회이상 등등 활용 가ㅡㄴㅇ
    ;
    
     SELECT * FROM goods; --행 조회하기
     
--select 기본 (조회)
SELECT
 certi_cd,
 certi_nm,
 issue_insti_nm
FROM tb_certi;
  
SELECT --컬럼 순서 바뀌어서 조회 가능 , 찾고싶은 칼럼만 보기 가능
 certi_nm,
-- certi_cd,
 issue_insti_nm
FROM tb_certi;

  --SELECT ALL이 기본으로, ALL 은 생략돼있다.
SELECT DISTINCT --중복 제거 
issue_insti_nm
FROM tb_certi;

-- 모든 칼럼 조회
SELECT 
     *
 FROM tb_certi
 ;
 
 -- 열 별칭 부여
 SELECT 
    emp_nm AS "사원명",
    addr AS "주소"
 FROM tb_emp
 ;
 
SELECT 
    emp_nm  사원명멍ㅁㅇㅁㅇ,
    addr  "주소??123" -- 띄어쓰기나 특문, 숫자가 있을 땐 쌍따옴표 사용하기
 FROM tb_emp
 ;
  
  --문자열 결합하기 
  
  SELECT 
   '자격증 : ' || certi_nm AS "자격증 정보"
  FROM tb_certi;
     
     SELECT 
     certi_nm || '(' || issue_insti_nm || ')' AS 자격증
     FROM tb_certi;
     
     