SELECT shohin_mei AS 商品名,
  CASE WHEN shohin_bunrui = '衣服'
    THEN 'A: ' || shohin_bunrui
    WHEN shohin_bunrui = '事務用品'
    THEN 'B: ' || shohin_bunrui
    WHEN shohin_bunrui = 'キッチン用品'
    THEN 'C: ' || shohin_bunrui
    ELSE NULL
  END AS abc_shohin_bunrui
FROM Shohin;

SELECT shohin_bunrui, SUM(hanbai_tanka) AS sum_tanka -- sumなどの集約関数にはASで名前をつける必要がある
FROM Shohin
GROUP BY shohin_bunrui;

SELECT SUM(CASE WHEN shohin_bunrui = '衣服'
THEN hanbai_tanka ELSE 0 END) AS sum_tanka_ihuku,
SUM(CASE WHEN shohin_bunrui = 'キッチン用品'
THEN hanbai_tanka ELSE 0 END) AS sum_tanka_kitchen,
SUM(CASE WHEN shohin_bunrui = '事務用品'
THEN hanbai_tanka ELSE 0 END) AS 事務
FROM Shohin;