-- #transaction

CREATE TABLE student (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    age NUMBER
)
;

INSERT INTO student VALUES (1, '±èÃ¶¼ö', 15);
INSERT INTO student VALUES (2, 'È«±æµ¿', 16);

SELECT
    * FROM student;
    
COMMIT; -- #saved in database, couldn't roll back when commit has done

INSERT INTO student VALUES (3, 'µµ¿ì³Ê', 12);

ROLLBACK; -- # you can rollback when insert some data and before commit

-- account withdtaw
UPDATE tb_account
SET balance = balance + 5000
WHERE name = '±èÃ¶¼ö';

UPDATE tb_account
SET balance = balance - 5000
WHERE name = 'È«±æµ¿';

COMMIT; -- # save point , same as git

DELETE FROM student; -- # able to rollback
-- # delete rows one by one 
-- # when you using <DELETE FROM> it has *trigger(doing other func?) and *logs.
TRUNCATE TABLE student;
-- # delete