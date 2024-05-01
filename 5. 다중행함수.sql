SELECT
    * FROM tb_sal_his
    ;
    
--집계함수 (다중행 함수)
--여러 행 묶어서 한번에 함수 적용 : 집계결과가 하나 혹은 묶어서 도출 가능
SELECT
    COUNT(*) "지급횟수",
    SUM(pay_amt) "지급총액",
    AVG(pay_amt) "평균 지급액",
    MAX(pay_amt),
    MAX(pay_amt)
FROM tb_sal_his
;

SELECT
SUBSTR(emp_nm, 1, 1)
FROM tb_emp
;
    
SELECT 
 COUNT(*) 
FROM tb_emp
;

SELECT 
  COUNT(emp_nm), -- 집계한 결과
FROM tb_emp
10000
;

SELECT --행마다 도출
  COUNT(direct_manager_emp_no) -- 집계한 결과에서 NULL을 제외 집계
    FROM tb_emp -- NULL 은 비교대상에서 제외한다. 아예 안함
    -- 연산은 가능
    ;
    
SELECT
    COUNT(emp_no) "총 사원수",
    MIN(birth_de) "최연장자 생일",
    MAX(birth_de) "최연소자 생일"
     FROM tb_emp
    ;
    
-- 부서별로 사원수가 몇명인지
-- 부서별로 최연장자의 생일은 언젠지?

-- GROUP BY : 지정된 컬럼으로 소그룹화 한 후 
-- 각 그룹별로 집계함수를 가각 적용
SELECT
    emp_no,-- 사원번호로 그룹화하면 41개의 그룹이 나옴
    emp_nm, -- 이름으로 그룹화하면 동명이인이 하나의 그룹!
    birth_de, -- 같은생일 ~ 한그룹
    dept_cd -- 같은 부서 ~ 한그룹
     FROM tb_emp
     ORDER BY dept_cd -- 부서별 정렬
    ;
    
    
SELECT
    dept_cd,
    COUNT(*) "부서별 사원수",
    MIN(birth_de) "부서별 최연장자"
    FROM tb_emp
    GROUP BY dept_cd -- 여러 열을 추가할 수 있는데, 많은 분류에 맞춰서 정렬됨
    ;
    
    

SELECT 
    SUM(pay_amt)
FROM tb_sal_his
ORDER BY emp_no
;

-- 사원별 받은 급여액 총 수
SELECT 
    emp_no, 
   TO_CHAR(SUM(pay_amt),'L999,999,999') "사원별 총 급여", 
    TO_CHAR(ROUND(AVG(pay_amt), 2),'L999,999,999') "사원별 급여 평균",
   TO_CHAR(MAX(pay_amt), 'L999,999,999') "사원별 최고 급여",
    COUNT(pay_de)
FROM tb_sal_his
  GROUP BY emp_no
ORDER BY emp_no
;

-- GROUP BY 절에 사용한 칼럼만
-- SELECT 절에서 직접 조회 가능
SELECT
    emp_no, -- 묶을거야! 라고 제시한 행을 셀렉해줘야 그루핑 가능해.
    emp_nm,
    dept_cd,
    COUNT(*)
    --MAX(birth_de)
FROM tb_emp
GROUP BY emp_no, emp_nm, dept_cd --이렇게 묶을꺼야 ! 라고 행을 제시하자구
;

SELECT
    dept_cd, sex_cd, COUNT(*), MAX(birth_de) 
    FROM tb_emp
    GROUP BY dept_cd, sex_cd
    ORDER BY dept_cd
    ;
    
-- 사원별로 2019년 급여 평균액
-- 최소지급액, 최대지급액 조회

-- WHERE : 집계 전 필터링

SELECT 
    emp_no, 
   TO_CHAR(SUM(pay_amt),'L999,999,999') "사원별 총 급여", 
    TO_CHAR(ROUND(AVG(pay_amt), 2),'L999,999,999') "사원별 급여 평균",
   TO_CHAR(MAX(pay_amt), 'L999,999,999') "사원별 최고 급여",
    COUNT(pay_de) "급여 수령횟수"
FROM tb_sal_his
where pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
ORDER BY emp_no
;

-- 집계 후 필터링 : HAVING
SELECT 
    emp_no, 
   TO_CHAR(SUM(pay_amt),'L999,999,999') "사원별 총 급여", 
    TO_CHAR(ROUND(AVG(pay_amt), 2),'L999,999,999') "사원별 급여 평균",
   TO_CHAR(MAX(pay_amt), 'L999,999,999') "사원별 최고 급여",
    COUNT(pay_de) "급여 수령횟수"
FROM tb_sal_his
where pay_de B
BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
HAVING AVG(pay_amt) >= 4000000
ORDER BY emp_no
;--외안되

-- 부서별로 가장 어린사람의 생년월일, 연장자의 생년월일, 부서별 총 사원 수를 조회
-- 그런데 부서별 사원이 1명인 부서의 정보는 조회하고 싶지 않음.
SELECT
    dept_cd, -- AS DC
    MAX(birth_de),
    MIN(birth_de),
    COUNT(*) cnt -- count 이름 정의
     FROM tb_emp
     GROUP BY --DC >>ALIAS NONO
     HAVING COUNT(*) > 1
     ORDER BY dept_cd
;

SELECT
    SUBSTR(EMP_NM, 1, 1)
     FROM tb_emp
    WHERE ADDR = SUBSTR(ADDR, 1, 2) --WHERE에서도 단일행 함수 사용 가능
    ;
    
-- ### 정렬 ###
-- ORDER BY : 정렬
-- ASC : 오름차 정렬 (기본값), DESC : 내림차 정렬
-- ## 항상 SELECT절의 맨 마지막에 위치

SELECT 
    emp_no
    , emp_nm
    , addr
FROM tb_emp
ORDER BY emp_no
;
--이름 오름차순
SELECT 
    emp_no
    , emp_nm
    , addr
FROM tb_emp
ORDER BY emp_nm ASC
;
-- 사원번호 내림차순
SELECT 
    emp_no
    , emp_nm
    , dept_cd
FROM tb_emp
ORDER BY dept_cd, emp_nm DESC
;


SELECT 
    emp_no AS 사번
    , emp_nm AS 이름
    , addr AS 주소
FROM tb_emp
ORDER BY 이름, 1 DESC --이름 오름차, 사번 내림차
;


SELECT 
    emp_no EN
    , emp_nm
    , dept_cd
FROM tb_emp
ORDER BY 3 ASC, EN DESC -- 만약 부서코드가 같으면 3번째의 오름차, 1번째의 내림차
;


SELECT 
    emp_no
    , emp_nm
    , dept_cd
FROM tb_emp
ORDER BY 3 ASC, emp_no DESC
;

SELECT emp_no AS 사번, emp_nm AS 이름, addr AS 주소
FROM tb_emp
ORDER BY 이름, 1 DESC
;

SELECT 
    emp_no
    , SUM(pay_amt) 연봉
FROM tb_sal_his 
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
HAVING AVG(pay_amt) >= 4500000
ORDER BY 연봉 DESC --ORDER BY에도 함수 사용 가능
;

SELECT 
	EMP_NM ,
	DIRECT_MANAGER_EMP_NO 
FROM TB_EMP
ORDER BY DIRECT_MANAGER_EMP_NO DESC
;


-- 사원별로 2019년 월평균 수령액이 450만원 이상인 사원의 사원번호와 2019년 연봉 조회
SELECT 
    emp_no
    , SUM(pay_amt) 연봉
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
HAVING AVG(pay_amt) >= 4500000
ORDER BY SUM(pay_amt) DESC
;

SELECT
    emp_nm,
    DIRECT_MANAGER_EMP_NO
     FROM TB_EMP
     ORDER BY DIRECT_MANAGER_EMP_NO DESC
     --ORDER BY DIRECT_MANAGER_EMP_NO ASC 
;
