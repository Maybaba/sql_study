
-- WHERE 조건절
-- 조회할 행을 제한 (필터링 where) -> 성능에도 도움을 준다. 

SELECT 
    emp_no, --유일하게 식별할 수 있는 데이터, pk
    emp_nm,
    addr,
    sex_cd
FROM tb_emp
WHERE sex_cd = 2
;

SELECT 
    emp_no,
    emp_nm,
    addr,
    sex_cd
FROM tb_emp
-- pk 로 필터링하면 무조건 1건 이하가 조회됨. pk 니까  ~ 
WHERE emp_no = 1000000013  --유일하게 식별할 수 있는 데이터, pk
;

-- 비교연산자
SELECT 
    emp_no,
    emp_nm,
    addr,
    sex_cd
FROM tb_emp
WHERE sex_cd <> 2
;
SELECT 
    emp_no,
    emp_nm,
    addr,
    birth_de
FROM tb_emp
WHERE birth_de >= '19900101'
    AND birth_de <= '19991231'    
;

SELECT 
    emp_no,
    emp_nm,
    addr,
    birth_de
FROM tb_emp
WHERE NOT birth_de >= '19900101'
;

--BETWEEN 연산자
SELECT 
    emp_no, 
    emp_nm, 
    birth_de
FROM tb_emp
WHERE birth_de BETWEEN '19950101' AND '19991231'
;

SELECT 
    emp_no, 
    emp_nm, 
    birth_de
FROM tb_emp
WHERE birth_de NOT BETWEEN '19950101' AND '19991231'
;

--IN 연산 : OR 연산
SELECT 
    emp_no,
    emp_nm,
    dept_cd
FROM tb_emp
WHERE dept_cd IN (100002, 100007, 100008)
;

-- LIKE
-- 검색에서 사용
-- 와일드카드 매핑 (%: 0글자 이상, _: 딱1글자 )

SELECT
    emp_no, 
    emp_nm, 
    addr
FROM tb_emp
WHERE addr LIKE '%용인%'
;

SELECT
    emp_no, 
    emp_nm, 
    addr
FROM tb_emp
WHERE emp_nm LIKE '김%'
;
SELECT
    emp_no, 
    emp_nm, 
    addr
FROM tb_emp
WHERE emp_nm LIKE '김__'
;

SELECT
    emp_no, 
    emp_nm, 
    addr
FROM tb_emp
WHERE emp_nm LIKE '%심'
;

SELECT
    email
FROM user
WHERE email LIKE '_A%@%'; --두번쨰 글짜는 a, 나머지글자 중 @포함
-- banana@gmail.com 


--성씨가 김씨이면서
--부서가 100003, 100004  중에 하나
--90년대생 사원
--사번 이름 생일 부서코드 조회
SELECT
    emp_no,
    emp_nm,
    birth_de,
    dept_cd
FROM tb_emp
where 1=1 --while(true) 같이 조건 걸어놓고 아래와 같이 정렬함
    AND emp_nm like '김%' 
    AND dept_cd IN(100003, 100004)
    AND birth_de BETWEEN '19900101' AND '19991231'
;

--NULL 값 조회하기
-- 반드시 IS NULL로 조회할 것
SELECT
    emp_no,
    emp_nm,
    direct_manager_emp_no
FROM tb_emp
WHERE direct_manager_emp_no IS NULL
;

SELECT
    emp_no,
    emp_nm,
    direct_manager_emp_no
FROM tb_emp
WHERE direct_manager_emp_no IS NOT NULL --영어 문법 따라가는듯
;

-- 연산자 우선 순위
-- NOT > AND > OR
SELECT 
	EMP_NO ,
	EMP_NM ,
	ADDR 
FROM TB_EMP
WHERE 1=1
	AND EMP_NM LIKE '김%' --1.김씨이면서 수원사는 애 2.일산인 애
	AND (ADDR LIKE '%수원%' 
    OR ADDR LIKE '%일산%')
;
-- 1 AND (2 OR 3) 연산자 우선순위