
select * from tb_emp;

-- ���̺� ����(DDL:  ������ ���Ǿ�)
-- �л����� ���� ������ ������ ������ ����
-- ��ҹ��� ���� ����
-- NOT NULL , NULL �� �� �ִ� ��ɾ���

CREATE TABLE tbl_score (
    name VARCHAR2(4) NOT NULL,
    kor NUMBER(3) NOT NULL CHECK(kor >= 0 AND kor <= 100),
    eng NUMBER(3) NOT NULL CHECK(eng >= 0 AND eng <= 100), 
    math NUMBER(3) NOT NULL CHECK(math >= 0 AND math <= 100), 
    total NUMBER (3) NULL,
    -- �Ҽ������� ������ �� �ڸ��� , �Ҽ��� �ڸ���
    average NUMBER(5,2),
    -- �ѱ��� ǥ��
    grade CHAR(1), 
    stu_num NUMBER (6) PRIMARY KEY
    );
    
    -- Alter ���� �������� �߰��ϱ�
    -- STU_NUM�� �����ϰ� PRIMARY KEY�� �Ȱɾ���...!
    ALTER TABLE TBL_SCORE
    -- ��������(?) ����� ������ ������ �� �ִ�.
    -- ���߿� ���ﶧ �� ���ִ�.
    ADD CONSTRAINT PK_TBL_SCORE
    PRIMARY KEY (STU_NUM);

    -- PK REMOVE
    ALTER TABLE TBL_SCORE
    DROP CONSTRAINT PK_TBL_SCORE
    
    -- �����͸� ��ȸ�� ��
    SELECT * FROM tbl_score;

-- �÷� �߰��ϱ� (ALTER)
ALTER TABLE tbl_score
ADD (sci NUMBER(3) NOT NULL);

-- �÷� �����ϱ� 
ALTER TABLE tbl_score
DROP COLUMN sci;

-- drop : ���� ������ ���̺� ����
-- ���̺� ���� (CTAS)
CREATE TABLE tb_emp_copy
AS SELECT * FROM tb_emp;

DROP TABLE tb_emp_copy;

SELECT * FROM tb_emp_copy;

-- TRUNCATE : 
-- ������ ����� ���� �����͸� �����Ͽ�
-- ���̺��� ������ �ʱ� ���·� ���ư���. 

TRUNCATE TABLE tb_emp_copy; 

    