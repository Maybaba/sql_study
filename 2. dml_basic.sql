CREATE TABLE goods (
    id NUMBER(6) PRIMARY KEY, --pr精 政析廃 葵生稽 竺舛馬澗 依績
    goods_name VARCHAR2(10) NOT NULL,
    price NUMBER(10) DEFAULT 1000, 
    reg_date DATE
    );
    --insert 徹 刊牽檎 違団床奄稽 痕井喫 ぬ 
    
    -- INSERT into table戚硯
    INSERT INTO goods
    (id, goods_name, price, reg_date)
    VALUES
     (1, '識燃奄', 120000, SYSDATE);
     
         INSERT INTO goods
    (id, goods_name, price, reg_date)
    VALUES
     (2, '室店奄', 2000000, SYSDATE);
     
      INSERT INTO goods
    (id, goods_name, reg_date)
    VALUES
     (3, '含壱蟹', SYSDATE);
     
           INSERT INTO goods
    (id, goods_name)
    VALUES
     (4, '域空');
     
      INSERT INTO goods
    ( goods_name, id, reg_date, price) -- insert 拝 凶 授辞亜 郊餓嬢亀 吉陥. 
    VALUES --授辞拭 限惟 葵聖 脊径馬檎 喫
     ( '繊遁', 5, SYSDATE,'49200'); --章幸旋 莫 痕発
     
           INSERT INTO goods -- 鎮軍誤持繰獣 砺戚鷺姥繕 授辞企稽 切疑 奄脊
    VALUES
     (6,'鈎舌壱',100000, SYSDATE);--企重, 汽戚斗亜 馬蟹虞亀 匙走檎 神嫌
     --劾促研 隔聖 凶 収切稽 隔走 省奄. SYSDATE-1 : 馬欠 穿
     
     -- 汽戚斗 呪舛馬奄 UPDATE
     UPDATE goods --展掴特戚 蒸生檎 穿端 町軍聖 郊蚊獄顕
     SET goods_name = '拭嬢珍'
     WHERE id = 1 --益掘辞 展為特聖 背操醤敗, 繕闇庚績
     ;
     
     UPDATE goods
     SET price = 9999;
     -- 忽滴 穣汽戚闘 虞壱 採牽奄亀 廃陥. 
     
     -- 及稽亜奄 獄動精 蒸聖猿? DML精 昼社亜 亜管馬陥. roll-back馬檎 喫
     -- DDL精 継拷 拝 呪 蒸陥. 
     
     UPDATE goods
     SET id = 1
     WHERE id = 11;
     
     UPDATE goods
    SET price = null
    WHERE id = 3;
    
    UPDATE goods
    SET goods_name = '短郊走', 
    price = 299000
    WHERE id = 3;
    
    -- DELETE 肢薦 : 廃 匝聖 陥 肢薦
    DELETE FROM goods
    WHERE id = 11;
    
    DELETE FROM goods; --繕闇蒸戚 DELETE : 穿端肢薦
    -- 益掘亀 戚 庚狛精 差姥亜 亜管敗 /DML
    TRUNCATE TABLE giids;  --差姥 災亜 /DDL
    DROP TABLE goods; --差姥災亜, 砺戚鷺亀 劾虞姶 /DDL
    
    DELETE FROM goods
    WHERE price > 1000 --重壱判呪1噺戚雌 去去 醗遂 亜ぱいし
    ;
    
     SELECT * FROM goods; --楳 繕噺馬奄
     
--select 奄沙 (繕噺)
SELECT
 certi_cd,
 certi_nm,
 issue_insti_nm
FROM tb_certi;
  
SELECT --鎮軍 授辞 郊餓嬢辞 繕噺 亜管 , 達壱粛精 町軍幻 左奄 亜管
 certi_nm,
-- certi_cd,
 issue_insti_nm
FROM tb_certi;

  --SELECT ALL戚 奄沙生稽, ALL 精 持繰掬赤陥.
SELECT DISTINCT --掻差 薦暗 
issue_insti_nm
FROM tb_certi;

-- 乞窮 町軍 繕噺
SELECT 
     *
 FROM tb_certi
 ;
 
 -- 伸 紺暢 採食
 SELECT 
    emp_nm AS "紫据誤",
    addr AS "爽社"
 FROM tb_emp
 ;
 
SELECT 
    emp_nm  紫据誤雇けしけし,
    addr  "爽社??123" -- 句嬢床奄蟹 働庚, 収切亜 赤聖 匡 瞬魚身妊 紫遂馬奄
 FROM tb_emp
 ;
  
  --庚切伸 衣杯馬奄 
  
  SELECT 
   '切維装 : ' || certi_nm AS "切維装 舛左"
  FROM tb_certi;
     
     SELECT 
     certi_nm || '(' || issue_insti_nm || ')' AS 切維装
     FROM tb_certi;
     
     