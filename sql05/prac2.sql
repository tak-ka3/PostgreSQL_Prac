CREATE VIEW ShohinSum (shohin_bunrui, cnt_shohin)
AS
SELECT shohin_bunrui, COUNT (*)
FROM Shohin
GROUP BY shohin_bunrui;

SELECT shohin_bunrui, cnt_shohin
FROM ShohinSum; -- FROm 句にテーブルの代わりにビューを指定する