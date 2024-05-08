

-- ����� FIRSTnaME, EMPLOYEE ID, DEPARTMENT ID, dept_name
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
     AND e.manager_id = d.manager_id --> ���� Į���� N�� �̻��̸� ������ 
     -- ����Į��������� ó���Ȥ�...
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

-- 1. employees���̺�� departments���̺��� inner join�Ͽ�
--    ���, first_name, last_name, department_id, department_name�� ��ȸ�ϼ���.
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
    
-- 2. employees���̺�� departments���̺��� natural join�Ͽ�
--    ���, first_name, last_name, department_id, department_name�� ��ȸ�ϼ���.

--�ߺ�Į�� �־ ���� ����� �ٸ�
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

-- 3. employees���̺�� departments���̺��� using���� ����Ͽ�
--    ���, first_name, last_name, department_id, department_name�� ��ȸ�ϼ���.
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


-- 4. employees���̺�� departments���̺�� locations ���̺��� 
--    join�Ͽ� employee_id, first_name, department_name, city�� ��ȸ�ϼ���
SELECT
    E.employee_id,
    E.first_name,
    department_name,
    city
    FROM employees E
    INNER JOIN departments D
    INNER JOIN locations L
    USING (employee_id, location_id );


-- 5. employees ���̺�� jobs ���̺��� INNER JOIN�Ͽ� 
-- ����� first_name, last_name, job_title�� ��ȸ�ϼ���.
SELECT
    e.employee_id,
    e.first_name,
    j.job_title
     FROM employees E
     INNER JOIN jobs j
     ON e.job_id = j.job_id
     ORDER BY e.employee_id
    ;
 

-- 6. employees ���̺�� departments ���̺��� INNER JOIN�Ͽ� 
-- �μ���� �� �μ��� �ִ� �޿����� ��ȸ�ϼ���.
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



-- 7. employees ���̺�� jobs ���̺��� INNER JOIN�Ͽ� 
--    ������ ��� �޿��� ���� Ÿ��Ʋ�� ��ȸ�ϼ���.

