-- 全体の合計と分類ごとの合計を同時に表示している
SELECT '合計' AS shohin_bunrui, SUM(hanbai_tanka)
FROM Shohin
UNION ALL
SELECT shohin_bunrui, SUM(hanbai_tanka)
FROM Shohin
GROUP BY shohin_bunrui;

-- ROLLUPを用いた例
SELECT shohin_bunrui, SUM(hanbai_tanka) AS sum_tanka
FROM Shohin
GROUP BY ROLLUP (shohin_bunrui);

-- ROLLUPなし
SELECT shohin_bunrui, torokubi, SUM(hanbai_tanka) AS sum_tanka
FROM Shohin
GROUP BY shohin_bunrui, torokubi;

-- ROLLUPあり
-- 1.GROUP BY(), 2.GROUP BY(shohin_bunrui), 3.GROUP BY(shohin_bunrui, torokubi)をUNION で繋げたような結果が得られる
-- ROLLUPは合計と小計を同時に求められる便利な道具である
SELECT shohin_bunrui, torokubi, SUM(hanbai_tanka) AS sum_tanka
FROM Shohin
GROUP BY ROLLUP(shohin_bunrui, torokubi);

-- 超集合行のNULLは1になる
SELECT GROUPING (shohin_bunrui) AS shohin_bunrui,
  GROUPING(torokubi) AS torokubi, SUM(hanbai_tanka) AS sum_tanka
FROM Shohin
GROUP BY ROLLUP(shohin_bunrui, torokubi);

-- GROUPING 関数はNULLを判別するための特別な関数で、NULLなら１、それ以外なら０を出力する
SELECT CASE WHEN GROUPING(shohin_bunrui) = 1
  THEN '商品分類　合計'
  ELSE shohin_bunrui END AS shohin_bunrui,
  CASE WHEN GROUPING(torokubi) = 1
  THEN '登録日　合計'
  ELSE CAST(torokubi AS VARCHAR(16)) END AS torokubi,
  SUM(hanbai_tanka) AS sum_tanka
FROM Shohin
GROUP BY ROLLUP(shohin_bunrui, torokubi);
-- ROLLUPをCUBEにすることで、登録日も集約キーとして集めることとなる
-- つまり、GROUP BY(torokubi)も追加された事になる
SELECT CASE WHEN GROUPING(shohin_bunrui) = 1
  THEN '商品分類　合計'
  ELSE shohin_bunrui END AS shohin_bunrui,
  CASE WHEN GROUPING(torokubi) = 1
  THEN '登録日　合計'
  ELSE CAST(torokubi AS VARCHAR(16)) END AS torokubi,
  SUM(hanbai_tanka) AS sum_tanka
FROM Shohin
GROUP BY CUBE(shohin_bunrui, torokubi);

-- 今度は獲得したレコードの中から、任意の集約キーを用いたレコードだけを集める関数、GROUPING SETSWO使う
-- 今回は商品分類と登録日だけをを集約キーとして扱い、それぞれ合計を求める
SELECT CASE WHEN GROUPING(shohin_bunrui) = 1
  THEN '商品分類　合計'
  ELSE shohin_bunrui END AS shohin_bunrui,
  CASE WHEN GROUPING(torokubi) = 1
  THEN '登録日　合計'
  ELSE CAST(torokubi AS VARCHAR(16)) END AS torokubi,
  SUM(hanbai_tanka) AS sum_tanka
FROM Shohin
GROUP BY GROUPING SETS(shohin_bunrui, torokubi);