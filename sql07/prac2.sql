-- このように集合演算子を使うと重複行は一つにまとめられて出力される
SELECT shohin_id, shohin_mei
FROM Shohin
UNION
SELECT shohin_id, shohin_mei
FROM Shohin2;

-- 重複を許容する
SELECT shohin_id, shohin_mei
FROM Shohin
UNION ALL
SELECT shohin_id, shohin_mei
FROM Shohin2;

SELECT shohin_id, shohin_mei
FROM Shohin
INTERSECT
SELECT shohin_id, shohin_mei
FROM Shohin2;

-- （最初）-（次）のデータの計算結果を表す
SELECT shohin_id, shohin_mei
FROM Shohin
EXCEPT
SELECT shohin_id, shohin_mei
FROM Shohin2;