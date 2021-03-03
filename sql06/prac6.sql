SELECT CAST('0001' AS INTEGER) AS int_col;
SELECT CAST('2009-12-14' AS DATE) AS date_col;

-- 最初から見ていき、最初に出てくるNULLでない値を返す
SELECT COALESCE(NULL, 1, 2) AS col_1,
  COALESCE(NULL, 'test', NULL, 'orange') AS col_2,
  COALESCE(NULL, NULL, '2009-11-01', '2000- 12-13') AS col_3;

-- これによりNULL値が別の値に代入されるのでとても便利
SELECT COALESCE(str2, 'NULLです')
FROM SampleStr;