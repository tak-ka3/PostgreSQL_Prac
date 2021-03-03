SELECT m, ABS(m) AS abs_col
FROM SampleMath;

SELECT n, p, MOD(n, p) AS mod_col
FROM SampleMath;

SELECT m, n, ROUND(m, n) AS round_col
FROM SampleMath;