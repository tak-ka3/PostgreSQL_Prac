SELECT shohin_mei, shohin_bunrui, hanbai_tanka, 
RANK () OVER (PARTITION BY shohin_bunrui
  ORDER BY hanbai_tanka) AS ranking
FROM Shohin;

-- PARTITIONをつけないと、商品分類関係なく、hanbai_tankaのみでランキングをつけられる
SELECT shohin_mei, shohin_bunrui, hanbai_tanka, 
RANK () OVER (
  ORDER BY hanbai_tanka) AS ranking
FROM Shohin;

-- このようなウインド関数はSELECT句でしか使うことができない
-- ORDER BY はあくまで、ランキングなどのウインドウ関数の対象となるものにすぎず、表示順などとは関係ない
SELECT shohin_mei, shohin_bunrui, hanbai_tanka, 
RANK () OVER (ORDER BY hanbai_tanka) AS ranking, -- 通常の順位の付け方
DENSE_RANK () OVER (ORDER BY hanbai_tanka) AS dense_ranking, -- 1, 2, 2, 3...となるようなランキング
ROW_NUMBER () OVER (ORDER BY hanbai_tanka) AS row_num -- 1, 2, 3, 4,...というように同じものも無視するランキング
FROM Shohin;

-- shohin_idで並べられた後、どんどんhanbai_tankaが累計されていく
SELECT shohin_id, shohin_mei, hanbai_tanka, 
SUM(hanbai_tanka) OVER (ORDER BY shohin_id) AS current_sum
FROM Shohin;
-- 今度は平均がどんどん更新されていく
SELECT shohin_id, shohin_mei, hanbai_tanka, 
AVG(hanbai_tanka) OVER (ORDER BY shohin_id) AS current_avg
FROM Shohin;

-- 移動平均
-- ここ最近のトレンドを知りたい時に用いる
SELECT shohin_id, shohin_mei, hanbai_tanka, 
AVG(hanbai_tanka) OVER (ORDER BY shohin_id 
  ROWS 
  2 PRECEDING) AS moving_agv -- これにより自分、自分より1行前、自分より2行前に指定できる
FROM Shohin;

SELECT shohin_id, shohin_mei, hanbai_tanka, 
AVG(hanbai_tanka) OVER (ORDER BY shohin_id 
  ROWS 
  BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS moving_agv -- これにより自分と前後1行を指定することができた
FROM Shohin;

-- 順番を指定するためのORDER BYの使用
SELECT shohin_mei, shohin_bunrui, hanbai_tanka,
RANK () OVER (ORDER BY hanbai_tanka) AS ranking
FROM Shohin
ORDER BY ranking DESC; -- 下の順位(今回は8)から表示している

