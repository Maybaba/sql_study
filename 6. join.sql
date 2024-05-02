

-- ����� ���, �̸�, �μ���ȣ, �μ��� ��ȸ
SELECT
    emp_no,
    emp_nm,
    dept_cd
     FROM tb_emp
;

-- ����Ǿ��ִ� �� ���̺��� �ѹ��� ��ȸ�ϱ� (�����غ���)
-- JOIN

SELECT
    dept_cd,
    dept_nm
     FROM tb_dept
;

-- ##JOIN 
SELECT
    tb_emp.emp_no,
    tb_emp.emp_nm,
    tb_dept.dept_cd,
    tb_dept.dept_nm
FROM tb_emp, tb_dept
 -- ����ڵ��� �μ��ڵ�� �μ��ڵ����̺��� �μ��ڵ尡 ��ġ�ϴ°͸� ���
WHERE tb_emp.dept_cd = tb_dept.dept_cd
;

-- ���� ���� �׽�Ʈ ������
CREATE TABLE TEST_A (
    id NUMBER(10) PRIMARY KEY
    , content VARCHAR2(200)
);
CREATE TABLE TEST_B (
    b_id NUMBER(10) PRIMARY KEY
    , reply VARCHAR2(100)
    , a_id NUMBER(10)
);

INSERT INTO TEST_A  VALUES (1, 'aaa');
INSERT INTO TEST_A  VALUES (2, 'bbb');
INSERT INTO TEST_A  VALUES (3, 'ccc');

INSERT INTO TEST_B  VALUES (1, '������', 1);
INSERT INTO TEST_B  VALUES (2, '������', 1);
INSERT INTO TEST_B  VALUES (3, '������', 2);
INSERT INTO TEST_B  VALUES (4, '������', 3);
-- �Խ��ǰ� �Խñ۰� �޸� ��� ����
SELECT * FROM test_a;

SELECT * FROM test_b;
    
-- ������ ������ ���ϱ⿬�� 
-- Cartesian production : product ���� KIM Cartesian?!?!?!?!
-- Cross Join : ������ ��� ����� ���� ��Ī�Ͽ� ��ȸ
SELECT * FROM test_a, test_b;

-- INNER JOIN
-- �� ���̺� ���� �����÷��� �̿��Ͽ�
-- ���谡 �ִ� �����͸� ��Ī�Ͽ� ����
SELECT * FROM test_a, test_b
WHERE test_a.id = test_b.a_id
;

SELECT
    E.emp_nm,
    E.addr,
    E.dept_cd,
    D.dept_cd,
    D.dept_nm
FROM tb_emp E, tb_dept D -- ����Ŭ ���� :���̺� + AS + ��Ī
WHERE E.dept_cd = D.dept_cd
;

-- ����� �����ȣ�� ������ ����� �ڰ������� ��ȸ
SELECT 
    E.emp_no,
    E.emp_nm,
    EC.certi_cd,
    EC.acqu_de,
    C.certi_nm
FROM tb_emp E, tb_emp_certi EC, tb_certi C
WHERE E.emp_no = EC.emp_no
    AND EC.certi_cd = C.certi_cd;

SELECT 
    E.emp_no,
    E.emp_nm,
    D.dept_nm,
    EC.certi_cd,
    EC.acqu_de,
    C.certi_nm
FROM tb_emp E, tb_emp_certi EC, tb_certi C, tb_dept D
WHERE E.emp_no = EC.emp_no
    AND EC.certi_cd = C.certi_cd
    AND e.dept_cd = d.dept_cd
    AND D.dept_nm = '������' -- ... and ������ �ʹ� ������
    ;

-- �μ� �� �� �ڰ��� ��� ���� ��ȸ
SELECT
    d.dept_cd,
    d.dept_nm,
    COUNT(certi_cd)
FROM tb_dept D, tb_emp_certi EC, tb_emp E
WHERE e.dept_cd = d.dept_cd 
    AND e.emp_no = ec.emp_no
GROUP BY d.dept_cd, d.dept_nm
ORDER BY d.dept_cd
;

-- # INNER JOIN
-- 1. 2�� �̻��� ���̺��� ����� �÷��� ���� �������� ���յǴ� ���α���Դϴ�.
-- 2. WHERE���� ���� �÷����� �������(=)�� ���� ���ε˴ϴ�.
-- ���νÿ� ��� ����� �����ȣ, �����, �ּ�, �μ��ڵ�, �μ����� ��ȸ�ϰ� �ʹ�.
SELECT
    e.emp_no,
    e.emp_nm,
    e.addr,
    e.dept_cd,
    d.dept_nm,
    d.dept_cd,
    d.dept_nm
FROM tb_emp E, tb_dept D
WHERE E.addr LIKE '%����%'
    AND E.dept_cd = D.dept_cd
    AND E.emp_nm LIKE '��%' 
;

-- JOIN ON (ANSI ǥ�� ����)
-- 1. FROM�� ��, WHERE �� ��
-- 2. JOIN Ű���� �ڿ��� ������ ���̺���� ���
-- 3. ON Ű���� �ڿ��� ���� ������ ���
-- 4. ���� ���� ������(ON��) �Ϲ� ���� ������ (WHERE��)�� �и��ؼ� �ۼ��ϴ� ���
-- 5. ON���� �̿��ϸ� JOIN ������ �������̳� ���������� ���� �߰� ������ ����

SELECT
    e.emp_no,
    e.emp_nm,
    e.addr,
    e.dept_cd,
    d.dept_nm,
    d.dept_cd,
    d.dept_nm
FROM tb_emp E 
INNER JOIN tb_dept D --JOIN �� ������ INNER �⺻������ ���õǾ� �����
ON E.dept_cd = D.dept_cd
WHERE E.addr LIKE '%����%'
    -- AND E.dept_cd = D.dept_cd
    AND E.emp_nm LIKE '��%' 
;

-- ## ǥ�� JOIN ����
SELECT 
    E.emp_no,
    E.emp_nm,
    D.dept_nm,
    EC.certi_cd,
    EC.acqu_de,
    C.certi_nm
FROM tb_emp E 
JOIN tb_emp_certi EC 
ON E.emp_no = EC.emp_no --�������ִ� ���� 
JOIN tb_certi C 
ON EC.certi_cd = C.certi_cd
JOIN tb_dept D
ON e.dept_cd = d.dept_cd
--WHERE E.emp_no = EC.emp_no
    -- AND EC.certi_cd = C.certi_cd
    -- AND e.dept_cd = d.dept_cd
    WHERE D.dept_cd IN (100004, 100006) 
    AND EC.acqu_de >= '20200101'
;

--1980 ���� ������� ���, �����, �μ���, �ڰ�����, ������� ��ȸ
SELECT
E.emp_no,
E.emp_nm,
D.dept_nm,
C.certi_nm,
EC.acqu_de
FROM tb_emp E, tb_dept D, tb_certi C, tb_emp_certi EC
WHERE e.dept_cd = d.dept_cd
    AND EC.certi_cd = C.certi_cd
    AND e.emp_no = ec.certi_cd
    AND E.birth_de BETWEEN '19800101' AND '19811231'
;
-- ## ǥ��
SELECT
E.emp_no,
E.emp_nm,
D.dept_nm,
C.certi_nm,
EC.acqu_de
FROM tb_emp E
JOIN tb_dept D 
ON E.dept_cd = D.dept_cd
JOIN tb_emp_certi EC
ON e.emp_no = ec.emp_no
JOIN tb_certi C -- ���� ���� 
ON EC.certi_cd = C.certi_cd
WHERE E.birth_de BETWEEN '19800101' AND '19811231'
;

-- INNER JOIN �� ���̺� �� ���������Ͱ� �ִ� ��쿡�� ���
-- � ���θ�ȸ���� �Ѱǵ� �ֹ����� ���� ���
-- �� ȸ���� ��ȸ���� ����


-- SELECT [DISTINCT] { ���̸� .... } 
-- FROM  ���̺� �Ǵ� �� �̸�
-- JOIN  ���̺� �Ǵ� �� �̸�
-- ON    ���� ����
--  WHERE ��ȸ ����
-- GROUP BY  ���� �׷�ȭ
-- HAVING    �׷�ȭ ����
-- ORDER BY  ������ �� [ASC | DESC];

-- JOIN ������ ���� ������ ī�׽þȰ� ��� ���
SELECT
    *
FROM test_a 
CROSS JOIN test_b -- ������ ��� �� ��Ī�� ��� ��� ���� �� 
;
 
 
 -- # NATURAL JOIN
-- 1. NATURAL JOIN�� ������ �̸��� ���� �÷��鿡 ���� �ڵ����� ���������� �����ϴ� ����Դϴ�.
-- 2. ��, �ڵ����� 2�� �̻��� ���̺��� ���� �̸��� ���� �÷��� ã�� INNER������ �����մϴ�.
-- 3. �� �� ���εǴ� ���� �̸��� �÷��� ������ Ÿ���� ���ƾ� �ϸ�, 
--    ALIAS�� ���̺���� �ڵ� ���� �÷� �տ� ǥ���ϸ� �ȵ˴ϴ�.
-- 4. SELECT * ������ ����ϸ�, ���� �÷��� ���տ��� �ѹ��� ǥ��˴ϴ�.
-- 5. ���� �÷��� n�� �̻��̸� ���� ������ n���� ó���˴ϴ�.

-- ��� ���̺�� �μ� ���̺��� ���� (���, �����, �μ��ڵ�, �μ���)
SELECT 
     A.emp_no, A.emp_nm, dept_cd, B.dept_nm -- �����÷� �ڵ� �ϳ���
FROM tb_emp A
NATURAL JOIN tb_dept B
-- ON A.dept_cd = B.dept_cd
;

SELECT
    *
FROM test_a A
INNER JOIN test_b B
ON A.id = B.a_id
;
-- ���� Į���� ���� ��� ������ ���� �۰� ũ�ν�����ó�� �ൿ��
SELECT
    *
FROM test_a A
NATURAL JOIN test_b B
;

-- # USING�� ����
-- 1. NATURAL���ο����� �ڵ����� �̸��� Ÿ���� ��ġ�ϴ� ��� �÷��� ����
--    ������ �Ͼ���� USING�� ����ϸ� ���ϴ� �÷��� ���ؼ��� ������ ���������� 
--    �ο��� �� �ֽ��ϴ�.
-- 2. USING�������� ���� �÷��� ���� ALIAS�� ���̺���� ǥ���Ͻø� �ȵ˴ϴ�.

SELECT 
     A.emp_no, A.emp_nm, dept_cd, B.dept_nm -- �����÷� �ڵ� �ϳ���
FROM tb_emp A
NATURAL JOIN tb_dept B
;

SELECT 
     A.emp_no, A.emp_nm, dept_cd, B.dept_nm -- �����÷� �ڵ� �ϳ���
FROM tb_emp A
INNER JOIN tb_dept B
USING(dept_cd) --���� Į���� �̷��� ���� on���� ��ġ�Ѵ�. . . .
;




