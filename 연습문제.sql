CREATE TABLE ��_38 (
    customer_ID NUMBER PRIMARY KEY,
    customer_NAME VARCHAR2(100)
    );
    
CREATE TABLE ������_38 (
    content_ID NUMBER PRIMARY KEY,
    content_name VARCHAR2(100)
);
    
CREATE TABLE ��õ��þ��_38 (
    ID NUMBER,
    content_ID NUMBER,
    the_DATE DATE
    );
    
CREATE TABLE ����õ��þ��_38 (
     ID NUMBER,
    content_ID NUMBER,
    the_DATE DATE
    );
    
INSERT INTO ��_38 VALUES (1, '��ö��');
INSERT INTO ��_38 VALUES (2, '�ڿ���');
COMMIT;


INSERT INTO ������_38 VALUES (1, '��ȭ');
INSERT INTO ������_38 VALUES (2, '�ִϸ��̼�');
INSERT INTO ������_38 VALUES (3, '��ť���͸�');

INSERT INTO ��õ������_38 VALUES (1, 1, SYSDATE);
INSERT INTO ��õ������_38 VALUES (1, 2, SYSDATE);
INSERT INTO ��õ������_38 VALUES (2, 2, SYSDATE);

INSERT INTO ��ȣ������_38 VALUES (1, 2, SYSDATE);
INSERT INTO ��ȣ������_38 VALUES (2, 1, SYSDATE);
INSERT INTO ��ȣ������_38 VALUES (2, 3, SYSDATE);
