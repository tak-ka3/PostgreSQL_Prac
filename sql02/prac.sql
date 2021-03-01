SELECT shohin_mei, hanbai_tanka,
hanbai_tanka*2 AS "hanbai_tankax2"
FROM Shohin;

SELECT shohin_mei,hanbai_tanka, shohin_bunrui -- この順番に表示される
FROM Shohin
WHERE hanbai_tanka <> 500;

SELECT shohin_mei, shohin_bunrui, torokubi
FROM Shohin
WHERE torokubi < '2009-09-27';

SELECT shohin_mei, shiire_tanka
FROM Shohin
WHERE shiire_tanka IS NULL;

SELECT shohin_mei, shiire_tanka
FROM Shohin
WHERE shiire_tanka IS NOT NULL;

SELECT shohin_mei, shohin_bunrui, hanbai_tanka
FROM Shohin
WHERE NOT hanbai_tanka >= 1000;

SELECT shohin_mei, shiire_tanka
FROM Shohin
WHERE shohin_bunrui = 'キッチン用品'
AND hanbai_tanka >= 3000;

SELECT shohin_mei, shiire_tanka
FROM Shohin
WHERE shohin_bunrui = 'キッチン用品'
AND hanbai_tanka >= 3000;