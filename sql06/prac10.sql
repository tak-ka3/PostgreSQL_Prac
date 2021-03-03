SELECT shohin_mei, hanbai_tanka
FROM Shohin
WHERE shohin_id IN (
  SELECT shohin_id
  FROM TenpoShohin
  WHERE tenpo_id = '000C'
)
ORDER BY hanbai_tanka;

SELECT shohin_mei, hanbai_tanka
FROM Shohin AS S
WHERE EXISTS (
  SELECT * -- ここを*と書くのは、ただの慣習であり、実際はなんでも良い
  FROM TenpoShohin AS TS
  WHERE TS.tenpo_id = '000C'
  AND TS.shohin_id = S.shohin_id
);

SELECT shohin_mei, hanbai_tanka
FROM Shohin AS S
WHERE NOT EXISTS (
  SELECT *
  FROM TenpoShohin AS TS
  WHERE TS.tenpo_id = '000A'
  AND TS.shohin_id = S.shohin_id
);