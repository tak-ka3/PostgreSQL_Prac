SELECT *
FROM SampleLike
WHERE strcol LIKE 'ddd%';

SELECT *
FROM SampleLike
WHERE strcol LIKE '%ddd%';

SELECT *
FROM SampleLike
WHERE strcol LIKE '%ddd';

SELECT *
FROM SampleLike
WHERE strcol LIKE 'abc__'; -- _が二つあるので、任意の二文字を表す

SELECT shohin_mei, hanbai_tanka
FROM Shohin
WHERE hanbai_tanka BETWEEN 100 AND 1000
ORDER BY hanbai_tanka;

SELECT shohin_mei, hanbai_tanka
FROM Shohin
WHERE hanbai_tanka > 100 AND hanbai_tanka < 1000; -- こうすることで端を含めない

SELECT shohin_mei, shiire_tanka
FROM Shohin
WHERE shiire_tanka IS NULL;
SELECT shohin_mei, shiire_tanka
FROM Shohin
WHERE shiire_tanka IS NOT NULL;

SELECT shohin_mei, shiire_tanka
FROM Shohin
WHERE shiire_tanka IN (320, 500, 5000);
SELECT shohin_mei, shiire_tanka
FROM Shohin
WHERE shiire_tanka NOT IN (320, 500, 5000);