BEGIN TRANSACTION;

UPDATE Shohin
SET hanbai_tanka = hanbai_tanka - 1000
WHERE shohin_mei = 'カッターシャツ';

UPDATE Shohin
SET hanbai_tanka = hanbai_tanka + 1000
WHERE shohin_mei = 'Tシャツ';

COMMIT; -- これは上書き保存を意味するので、実行したら後戻りはできない

BEGIN TRANSACTION;

UPDATE Shohin
SET hanbai_tanka = hanbai_tanka - 1000
WHERE shohin_mei = 'カッターシャツ';

UPDATE Shohin
SET hanbai_tanka = hanbai_tanka + 1000
WHERE shohin_mei = 'Tシャツ';

ROLLBACK; -- これは保存せずに終了を意味するので、どれだけ実行してもTRANSACTION内容は反映されない