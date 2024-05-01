SELECT
    * FROM tb_sal_his
    ;
    
--�����Լ� (������ �Լ�)
--���� �� ��� �ѹ��� �Լ� ���� : �������� �ϳ� Ȥ�� ��� ���� ����
SELECT
    COUNT(*) "����Ƚ��",
    SUM(pay_amt) "�����Ѿ�",
    AVG(pay_amt) "��� ���޾�",
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
  COUNT(emp_nm), -- ������ ���
FROM tb_emp
10000
;

SELECT --�ึ�� ����
  COUNT(direct_manager_emp_no) -- ������ ������� NULL�� ���� ����
    FROM tb_emp -- NULL �� �񱳴�󿡼� �����Ѵ�. �ƿ� ����
    -- ������ ����
    ;
    
SELECT
    COUNT(emp_no) "�� �����",
    MIN(birth_de) "�ֿ����� ����",
    MAX(birth_de) "�ֿ����� ����"
     FROM tb_emp
    ;
    
-- �μ����� ������� �������
-- �μ����� �ֿ������� ������ ������?

-- GROUP BY : ������ �÷����� �ұ׷�ȭ �� �� 
-- �� �׷캰�� �����Լ��� ���� ����
SELECT
    emp_no,-- �����ȣ�� �׷�ȭ�ϸ� 41���� �׷��� ����
    emp_nm, -- �̸����� �׷�ȭ�ϸ� ���������� �ϳ��� �׷�!
    birth_de, -- �������� ~ �ѱ׷�
    dept_cd -- ���� �μ� ~ �ѱ׷�
     FROM tb_emp
     ORDER BY dept_cd -- �μ��� ����
    ;
    
    
SELECT
    dept_cd,
    COUNT(*) "�μ��� �����",
    MIN(birth_de) "�μ��� �ֿ�����"
    FROM tb_emp
    GROUP BY dept_cd -- ���� ���� �߰��� �� �ִµ�, ���� �з��� ���缭 ���ĵ�
    ;
    
    

SELECT 
    SUM(pay_amt)
FROM tb_sal_his
ORDER BY emp_no
;

-- ����� ���� �޿��� �� ��
SELECT 
    emp_no, 
   TO_CHAR(SUM(pay_amt),'L999,999,999') "����� �� �޿�", 
    TO_CHAR(ROUND(AVG(pay_amt), 2),'L999,999,999') "����� �޿� ���",
   TO_CHAR(MAX(pay_amt), 'L999,999,999') "����� �ְ� �޿�",
    COUNT(pay_de)
FROM tb_sal_his
  GROUP BY emp_no
ORDER BY emp_no
;

-- GROUP BY ���� ����� Į����
-- SELECT ������ ���� ��ȸ ����
SELECT
    emp_no, -- �����ž�! ��� ������ ���� ��������� �׷��� ������.
    emp_nm,
    dept_cd,
    COUNT(*)
    --MAX(birth_de)
FROM tb_emp
GROUP BY emp_no, emp_nm, dept_cd --�̷��� �������� ! ��� ���� �������ڱ�
;

SELECT
    dept_cd, sex_cd, COUNT(*), MAX(birth_de) 
    FROM tb_emp
    GROUP BY dept_cd, sex_cd
    ORDER BY dept_cd
    ;
    
-- ������� 2019�� �޿� ��վ�
-- �ּ����޾�, �ִ����޾� ��ȸ

-- WHERE : ���� �� ���͸�

SELECT 
    emp_no, 
   TO_CHAR(SUM(pay_amt),'L999,999,999') "����� �� �޿�", 
    TO_CHAR(ROUND(AVG(pay_amt), 2),'L999,999,999') "����� �޿� ���",
   TO_CHAR(MAX(pay_amt), 'L999,999,999') "����� �ְ� �޿�",
    COUNT(pay_de) "�޿� ����Ƚ��"
FROM tb_sal_his
where pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
ORDER BY emp_no
;

-- ���� �� ���͸� : HAVING
SELECT 
    emp_no, 
   TO_CHAR(SUM(pay_amt),'L999,999,999') "����� �� �޿�", 
    TO_CHAR(ROUND(AVG(pay_amt), 2),'L999,999,999') "����� �޿� ���",
   TO_CHAR(MAX(pay_amt), 'L999,999,999') "����� �ְ� �޿�",
    COUNT(pay_de) "�޿� ����Ƚ��"
FROM tb_sal_his
where pay_de B
BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
HAVING AVG(pay_amt) >= 4000000
ORDER BY emp_no
;--�ܾȵ�

-- �μ����� ���� ������ �������, �������� �������, �μ��� �� ��� ���� ��ȸ
-- �׷��� �μ��� ����� 1���� �μ��� ������ ��ȸ�ϰ� ���� ����.
SELECT
    dept_cd, -- AS DC
    MAX(birth_de),
    MIN(birth_de),
    COUNT(*) cnt -- count �̸� ����
     FROM tb_emp
     GROUP BY --DC >>ALIAS NONO
     HAVING COUNT(*) > 1
     ORDER BY dept_cd
;

SELECT
    SUBSTR(EMP_NM, 1, 1)
     FROM tb_emp
    WHERE ADDR = SUBSTR(ADDR, 1, 2) --WHERE������ ������ �Լ� ��� ����
    ;
    
-- ### ���� ###
-- ORDER BY : ����
-- ASC : ������ ���� (�⺻��), DESC : ������ ����
-- ## �׻� SELECT���� �� �������� ��ġ

SELECT 
    emp_no
    , emp_nm
    , addr
FROM tb_emp
ORDER BY emp_no
;
--�̸� ��������
SELECT 
    emp_no
    , emp_nm
    , addr
FROM tb_emp
ORDER BY emp_nm ASC
;
-- �����ȣ ��������
SELECT 
    emp_no
    , emp_nm
    , dept_cd
FROM tb_emp
ORDER BY dept_cd, emp_nm DESC
;


SELECT 
    emp_no AS ���
    , emp_nm AS �̸�
    , addr AS �ּ�
FROM tb_emp
ORDER BY �̸�, 1 DESC --�̸� ������, ��� ������
;


SELECT 
    emp_no EN
    , emp_nm
    , dept_cd
FROM tb_emp
ORDER BY 3 ASC, EN DESC -- ���� �μ��ڵ尡 ������ 3��°�� ������, 1��°�� ������
;


SELECT 
    emp_no
    , emp_nm
    , dept_cd
FROM tb_emp
ORDER BY 3 ASC, emp_no DESC
;

SELECT emp_no AS ���, emp_nm AS �̸�, addr AS �ּ�
FROM tb_emp
ORDER BY �̸�, 1 DESC
;

SELECT 
    emp_no
    , SUM(pay_amt) ����
FROM tb_sal_his 
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
HAVING AVG(pay_amt) >= 4500000
ORDER BY ���� DESC --ORDER BY���� �Լ� ��� ����
;

SELECT 
	EMP_NM ,
	DIRECT_MANAGER_EMP_NO 
FROM TB_EMP
ORDER BY DIRECT_MANAGER_EMP_NO DESC
;


-- ������� 2019�� ����� ���ɾ��� 450���� �̻��� ����� �����ȣ�� 2019�� ���� ��ȸ
SELECT 
    emp_no
    , SUM(pay_amt) ����
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
