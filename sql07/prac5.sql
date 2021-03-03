-- 3つ以上のテーブルの結合、今回は内部結合
SELECT TS.tenpo_id, TS.tenpo_mei, TS.shohin_id, S.shohin_mei, S.hanbai_tanka, ZS.zaiko_suryo
FROM TenpoShohin AS TS INNER JOIN Shohin AS S 
ON TS.shohin_id = S.shohin_id
  INNER JOIN ZaikoShohin AS ZS 
  ON TS.shohin_id = ZS.shohin_id
  WHERE ZS.souko_id = 'S001';

-- クロス結合
SELECT TS.tenpo_id, TS.tenpo_mei, TS.shohin_id, S.shohin_mei
FROM TenpoShohin AS TS CROSS JOIN Shohin AS S;