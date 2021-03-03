CREATE VIEW ShohinJim (shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, shiire_tanka, torokubi)
AS 
SELECT *
FROM Shohin
WHERE shohin_bunrui = '事務用品';

-- CREATE OR REPLACE RULE insert_rule
-- AS ON INSERT
-- TO ShohinJim DO INSTEAD
-- INSERT INTO Shohin VALUES(
--   new.shohin_id
--   new.shohin_mei
--   new.shohin_bunrui
--   new.hanbai_tanka
--   new.shiire_tanka
--   new.torokubi
-- );