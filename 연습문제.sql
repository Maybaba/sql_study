CREATE TABLE 绊按_38 (
    customer_ID NUMBER PRIMARY KEY,
    customer_NAME VARCHAR2(100)
    );
    
CREATE TABLE 牧刨明_38 (
    content_ID NUMBER PRIMARY KEY,
    content_name VARCHAR2(100)
);
    
CREATE TABLE 眠玫牧镁明_38 (
    ID NUMBER,
    content_ID NUMBER,
    the_DATE DATE
    );
    
CREATE TABLE 厚眠玫牧镁明_38 (
     ID NUMBER,
    content_ID NUMBER,
    the_DATE DATE
    );
    
INSERT INTO 绊按_38 VALUES (1, '辫枚荐');
INSERT INTO 绊按_38 VALUES (2, '冠康锐');
COMMIT;


INSERT INTO 牧刨明_38 VALUES (1, '康拳');
INSERT INTO 牧刨明_38 VALUES (2, '局聪皋捞记');
INSERT INTO 牧刨明_38 VALUES (3, '促钮膏磐府');

INSERT INTO 眠玫牧刨明_38 VALUES (1, 1, SYSDATE);
INSERT INTO 眠玫牧刨明_38 VALUES (1, 2, SYSDATE);
INSERT INTO 眠玫牧刨明_38 VALUES (2, 2, SYSDATE);

INSERT INTO 厚急龋牧刨明_38 VALUES (1, 2, SYSDATE);
INSERT INTO 厚急龋牧刨明_38 VALUES (2, 1, SYSDATE);
INSERT INTO 厚急龋牧刨明_38 VALUES (2, 3, SYSDATE);
