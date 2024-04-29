CREATE TABLE goods (
    id NUMBER(6) PRIMARY KEY, --pr�� ������ ������ �����ϴ� ����
    goods_name VARCHAR2(10) NOT NULL,
    price NUMBER(10) DEFAULT 1000, 
    reg_date DATE
    );
    --insert Ű ������ ���ľ���� ����� �� 
    
    -- INSERT into table�̸�
    INSERT INTO goods
    (id, goods_name, price, reg_date)
    VALUES
     (1, '��ǳ��', 120000, SYSDATE);
     
         INSERT INTO goods
    (id, goods_name, price, reg_date)
    VALUES
     (2, '��Ź��', 2000000, SYSDATE);
     
      INSERT INTO goods
    (id, goods_name, reg_date)
    VALUES
     (3, '�ް�', SYSDATE);
     
           INSERT INTO goods
    (id, goods_name)
    VALUES
     (4, '���');
     
      INSERT INTO goods
    ( goods_name, id, reg_date, price) -- insert �� �� ������ �ٲ� �ȴ�. 
    VALUES --������ �°� ���� �Է��ϸ� ��
     ( '����', 5, SYSDATE,'49200'); --�Ϲ��� �� ��ȯ
     
           INSERT INTO goods -- �÷�������� ���̺��� ������� �ڵ� ����
    VALUES
     (6,'�����',100000, SYSDATE);--���, �����Ͱ� �ϳ��� ������ ����
     --��¥�� ���� �� ���ڷ� ���� �ʱ�. SYSDATE-1 : �Ϸ� ��
     
     -- ������ �����ϱ� UPDATE
     UPDATE goods --Ÿ������ ������ ��ü Į���� �ٲ����
     SET goods_name = '������'
     WHERE id = 1 --�׷��� Ÿ������ �������, ���ǹ���
     ;
     
     UPDATE goods
     SET price = 9999;
     -- ��ũ ������Ʈ ��� �θ��⵵ �Ѵ�. 
     
     -- �ڷΰ��� ��ư�� ������? DML�� ��Ұ� �����ϴ�. roll-back�ϸ� ��
     -- DDL�� �ѹ� �� �� ����. 
     
     UPDATE goods
     SET id = 1
     WHERE id = 11;
     
     UPDATE goods
    SET price = null
    WHERE id = 3;
    
    UPDATE goods
    SET goods_name = 'û����', 
    price = 299000
    WHERE id = 3;
    
    -- DELETE ���� : �� ���� �� ����
    DELETE FROM goods
    WHERE id = 11;
    
    DELETE FROM goods; --���Ǿ��� DELETE : ��ü����
    -- �׷��� �� ������ ������ ������ /DML
    TRUNCATE TABLE giids;  --���� �Ұ� /DDL
    DROP TABLE goods; --�����Ұ�, ���̺� ���� /DDL
    
    DELETE FROM goods
    WHERE price > 1000 --�Ű�Ƚ��1ȸ�̻� ��� Ȱ�� ���Ѥ���
    ;
    
     SELECT * FROM goods; --�� ��ȸ�ϱ�
     
--select �⺻ (��ȸ)
SELECT
 certi_cd,
 certi_nm,
 issue_insti_nm
FROM tb_certi;
  
SELECT --�÷� ���� �ٲ� ��ȸ ���� , ã����� Į���� ���� ����
 certi_nm,
-- certi_cd,
 issue_insti_nm
FROM tb_certi;

  --SELECT ALL�� �⺻����, ALL �� �������ִ�.
SELECT DISTINCT --�ߺ� ���� 
issue_insti_nm
FROM tb_certi;

-- ��� Į�� ��ȸ
SELECT 
     *
 FROM tb_certi
 ;
 
 -- �� ��Ī �ο�
 SELECT 
    emp_nm AS "�����",
    addr AS "�ּ�"
 FROM tb_emp
 ;
 
SELECT 
    emp_nm  �����ۤ�������,
    addr  "�ּ�??123" -- ���⳪ Ư��, ���ڰ� ���� �� �ֵ���ǥ ����ϱ�
 FROM tb_emp
 ;
  
  --���ڿ� �����ϱ� 
  
  SELECT 
   '�ڰ��� : ' || certi_nm AS "�ڰ��� ����"
  FROM tb_certi;
     
     SELECT 
     certi_nm || '(' || issue_insti_nm || ')' AS �ڰ���
     FROM tb_certi;
     
     