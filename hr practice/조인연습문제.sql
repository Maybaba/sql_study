

-- 사원의 FIRSTnaME, EMPLOYEE ID, DEPARTMENT ID, dept_name
SELECT
    e.employee_id,
    e.first_name,
    e.department_id
     FROM employees E
     INNER JOIN departments D
     ON e.department_id = d.department_id
     ORDER BY e.employee_id
    ;
    
    SELECT
    e.employee_id,
    e.first_name,
    department_id
     FROM employees E
     NATURAL JOIN departments D
--    ON e.department_id = d.department_id
     ORDER BY e.employee_id
;

SELECT
    e.employee_id,
    e.first_name,
    E.department_id,
    D.department_name
     FROM employees E
     INNER JOIN departments D
     ON e.department_id = d.department_id
     AND e.manager_id = d.manager_id --> 공통 칼럼이 N개 이상이면 조건이 
     -- 공통칼럼갯수대로 처리된ㄷ...
     ORDER BY e.employee_id
;

-- ## USING
SELECT
    e.employee_id,
    e.first_name,
    department_id
     FROM employees E
     INNER JOIN departments D
     USING(department_id)
     ORDER BY e.employee_id
    ;
    
SELECT
     e.employee_id,
     e.first_name,
     department_id,
     D.department_name
     FROM employees E
     INNER JOIN departments D
     USING(department_id, manager_id )
     ORDER BY e.employee_id
;

-- 1. employees테이블과 departments테이블을 inner join하여
--    사번, first_name, last_name, department_id, department_name을 조회하세요.
SELECT
    E.first_name,
    E.last_name,
    department_id,
    D.department_name
    FROM employees E
    INNER JOIN departments D
    USING (department_id)
    ORDER BY E.first_name
;
    
-- 2. employees테이블과 departments테이블을 natural join하여
--    사번, first_name, last_name, department_id, department_name을 조회하세요.

--중복칼럼 있어서 위의 결과가 다름
SELECT
    E.employee_id,
    E.first_name,
    E.last_name,
    department_id,
    department_name
    FROM employees E
    NATURAL JOIN departments D
   --ORDER BY E.employee_id
;

-- 3. employees테이블과 departments테이블을 using절을 사용하여
--    사번, first_name, last_name, department_id, department_name을 조회하세요.
SELECT
    E.employee_id,
    E.first_name,
    E.last_name,
    department_id,
    department_name
    FROM employees E
    JOIN departments D
    USING (department_id)
;


-- 4. employees테이블과 departments테이블과 locations 테이블을 
--    join하여 employee_id, first_name, department_name, city를 조회하세요
SELECT
    E.employee_id,
    E.first_name,
    department_name,
    city
    FROM employees E
    INNER JOIN departments D
    INNER JOIN locations L
    USING (employee_id, location_id );


-- 5. employees 테이블과 jobs 테이블을 INNER JOIN하여 
-- 사원의 first_name, last_name, job_title을 조회하세요.
SELECT
    e.employee_id,
    e.first_name,
    j.job_title
     FROM employees E
     INNER JOIN jobs j
     ON e.job_id = j.job_id
     ORDER BY e.employee_id
    ;
 

-- 6. employees 테이블과 departments 테이블을 INNER JOIN하여 
-- 부서명과 각 부서의 최대 급여값을 조회하세요.
SELECT 
    E.department_id,
    D.department_name,
    MAX(E.salary)
FROM employees E
INNER JOIN departments D
ON E.department_id = D.department_id
GROUP BY E.department_id, D.department_name
ORDER BY E.department_id
;



-- 7. employees 테이블과 jobs 테이블을 INNER JOIN하여 
--    직무별 평균 급여와 직무 타이틀을 조회하세요.

