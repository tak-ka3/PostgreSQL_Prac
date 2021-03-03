-- ビューによる実装
CREATE VIEW ShohinSum (shohin_bunrui, cnt_shohin)
AS
SELECT shohin_bunrui, COUNT(*)
FROM Shohin
GROUP BY shohin_bunrui;

SELECT shohin_bunrui, cnt_shohin
FROM ShohinSum;

-- サブクエリによる実装
-- FROM句に直接ビュー定義のSELECT文を書く
SELECT shohin_bunrui, cnt_shohin
FROM (SELECT shohin_bunrui, COUNT(*) AS cnt_shohin -- この行はあくまでSELECT文と考える
  FROM Shohin
  GROUP BY shohin_bunrui) AS ShohinSum;

-- ネスト深め
SELECT shohin_bunrui, cnt_shohin
FROM(SELECT *
  FROM(
    SELECT shohin_bunrui, COUNT(*) AS cnt_shohin
    FROM Shohin
    GROUP BY shohin_bunrui
  )AS ShohinSum
WHERE cnt_shohin = 4) AS ShohinSum2;

-- スカラサブクエリ
SELECT AVG(hanbai_tanka)
FROM Shohin;
-- スカラサブクエリを中に簡単に用いることができる
SELECT shohin_id, shohin_mei, hanbai_tanka
FROM Shohin
WHERE hanbai_tanka > (SELECT AVG(hanbai_tanka) FROM Shohin);

SELECT shohin_id, shohin_mei, hanbai_tanka, (SELECT AVG(hanbai_tanka) FROM Shohin) AS avg_tanka
FROM Shohin;

SELECT shohin_bunrui, AVG(hanbai_tanka)
FROM Shohin
GROUP BY shohin_bunrui
HAVING AVG(hanbai_tanka) > (SELECT AVG(hanbai_tanka) FROm Shohin); -- 左辺はグループごとの平均、右辺は全体の平均
