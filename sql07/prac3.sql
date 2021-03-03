-- 内部結合
SELECT TS.tenpo_id, TS.tenpo_mei, TS.shohin_id, S.shohin_mei, S.hanbai_tanka
FROM TenpoShohin AS TS INNER JOIN Shohin AS S
ON TS.shohin_id = S.shohin_id;

SELECT TS.tenpo_id, TS.tenpo_mei, TS.shohin_id, S.shohin_mei, S.hanbai_tanka
FROM TenpoShohin AS TS INNER JOIN Shohin AS S
ON TS.shohin_id = S.shohin_id
WHERE TS.tenpo_id = '000A';

-- 外部結合
-- 内部結合の時は、二つのテーブルに共通して含まれるデータが入っている行しか持ってこなかったが、
-- 外部結合は全ての指定された情報を持ってくる
-- RIGHTとするとFROMで右に書いたShohinをマスタとして全ての情報を表示するようにする
SELECT TS.tenpo_id, TS.tenpo_mei, TS.shohin_id, S.shohin_mei, S.hanbai_tanka
FROM TenpoShohin AS TS RIGHT OUTER JOIN Shohin AS S
ON TS.shohin_id = S.shohin_id;

SELECT TS.tenpo_id, TS.tenpo_mei, TS.shohin_id, S.shohin_mei, S.hanbai_tanka
FROM TenpoShohin AS TS LEFT OUTER JOIN Shohin AS S
ON TS.shohin_id = S.shohin_id;