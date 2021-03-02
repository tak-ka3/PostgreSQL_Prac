SELECT COUNT (*) -- *だけは例外的にNULLを除かない
FROM Shohin;

SELECT COUNT (shiire_tanka) -- NULLを除外して数える
FROM Shohin;

SELECT SUM(hanbai_tanka), SUM(shiire_tanka) -- 最初にNULLを除外してから計算している
FROM Shohin;

SELECT AVG(hanbai_tanka), AVG(shiire_tanka) -- 最初からNULLを除くので、分母も変わる
FROM Shohin;

SELECT MAX(hanbai_tanka), MAX(torokubi),MIN(torokubi)
FROM Shohin;

SELECT COUNT(DISTINCT shohin_bunrui) --DISTINCT を付けることで、重複を避けることができる
FROM Shohin;

SELECT SUM(hanbai_tanka), SUM(DISTINCT hanbai_tanka) --DISTINCTにより重複を避けるので、二つの値は異なる
FROM Shohin;

SELECT shohin_bunrui, COUNT(*)
FROM Shohin
-- WHERE shohin_bunrui = 'キッチン用品'
GROUP BY shohin_bunrui; -- これにより商品分類ごとに数を数えてくれる

SELECT shiire_tanka, COUNT(*)
FROM Shohin
GROUP BY shiire_tanka;  -- NULLも一つのグループとして集約される

-- 実際はFROM->WHERE->GROUPBY->SELECT
-- SELECTに書けるのは、GROUP BYで指定したもの、集約関数（COUNTなど）、定数のみ
SELECT shiire_tanka, COUNT(*)
FROM Shohin
WHERE shohin_bunrui = '衣服' -- WHERE句での条件指定の方がHAVING句より、行に対して最初に条件指定をしてくれるので、実行速度が速くなる
GROUP BY shiire_tanka;

SELECT shohin_bunrui, COUNT(*)
FROM Shohin
GROUP BY shohin_bunrui
HAVING COUNT(*) = 2;

SELECT shohin_bunrui, AVG(hanbai_tanka)
FROM Shohin
GROUP BY shohin_bunrui
HAVING AVG(hanbai_tanka) >= 2500; -- HAVING句に書くことができる内容の条件は、SELECT句と全く同じ

SELECT shohin_id, shohin_mei, hanbai_tanka, shiire_tanka
FROM Shohin
ORDER BY hanbai_tanka;

SELECT shohin_id, shohin_mei, hanbai_tanka, shiire_tanka
FROM Shohin
ORDER BY hanbai_tanka DESC; -- DESCにより降順にすることが可能
-- なぜかDESCがうまく機能しない

SELECT shohin_id, shohin_mei, hanbai_tanka, shiire_tanka
FROM Shohin
ORDER BY hanbai_tanka, shohin_id; -- 最初のキーでソートした後、二つ目のキーでソートする

SELECT shohin_id, shohin_mei, hanbai_tanka, shiire_tanka
FROM Shohin
ORDER BY shiire_tanka; -- NULLは下にまとめられる

SELECT shohin_id, shohin_mei, hanbai_tanka, shiire_tanka
FROM Shohin
ORDER BY 3 DESC, 1; -- 列番号指定はいずれ削除されるので、使うべきではない

-- 練習問題3-2
SELECT shohin_bunrui, SUM(hanbai_tanka), SUM(shiire_tanka)
FROM Shohin
GROUP BY shohin_bunrui
HAVING SUM(hanbai_tanka) > SUM(shiire_tanka) * 1.5;
-- 練習問題3-3
SELECT *
FROM Shohin
ORDER BY torokubi DESC, hanbai_tanka;


-- WHEREは先に条件を指定して、いらないものを削除しておく
-- HAVINGはGROUP BYした後にそのグループ化されたデータをもとに条件を絞る
