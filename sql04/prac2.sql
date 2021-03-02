-- PRIMARY KEY(今回でいうshohin_id)が同じものは何度も登録することができない
INSERT INTO ShohinIns (shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka,shiire_tanka, torokubi) VALUES (
  '0001', 'Tシャツ', '衣服', 1000, 500, '2009-09-20'
);
INSERT INTO ShohinIns (shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka,shiire_tanka, torokubi) VALUES (
  '0007', 'おろしがね', 'キッチン用品', DEFAULT, 500, '2009-09-20' -- このようにdefaultで指定することも可能（ただし最初にdefaultにしておく必要がある）
); -- 暗黙的なデフォルト値の設定では、データ項目とvalueを省略することで、デフォルト値を設定できる
-- defaultが設定されていないものを省略すると、NULLが代入される
