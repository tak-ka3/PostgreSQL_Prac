-- テーブル内のデータの削除方法

-- テーブルは残したまま、全ての行を削除する方法
DELETE FROM ShohinCopy;

-- このように条件に適したデータだけを削除することもできる
DELETE FROM Shohin
WHERE hanbai_tanka >= 4000;

-- TRUNCATEというコマンドを使う方法もある