-- torokubi列を全行'2009-10-10'に統一
-- NULLだったところにも入る
UPDATE Shohin
SET torokubi = '2009-10-10';

UPDATE Shohin
SET hanbai_tanka = hanbai_tanka * 10, shiire_tanka = shiire_tanka / 2
WHERE shohin_bunrui = 'キッチン用品';

-- データ内容をNULLにすることもできる
UPDATE Shohin
SET torokubi = NULL
WHERE shohin_id = '0008';