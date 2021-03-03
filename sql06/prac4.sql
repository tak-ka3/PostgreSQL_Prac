SELECT str1, str2, 
str1 || str2 AS str_concat
FROM SampleStr;

SELECT str1, str2, str3,
str1 || str2 || str3 AS str_concat
FROM SampleStr
WHERE str1 = '山田';

SELECT str1, LENGTH(str1) AS len_str
FROM SampleStr;

SELECT str1, LOWER(str1) AS low_str, UPPER(str1) AS up_str
FROM SampleStr
WHERE str1 IN('ABC','abc', 'aBC', '山田', 'aag'); -- 適当な項目を入れてもOK、例えば'aag'

SELECT str1, str2, str3,
REPLACE(str1, str2, str3) AS rep_str -- REPLACE(対象文字列, 置換前の文字列, 置換後の文字列), 
FROM SampleStr;

SELECT str1, SUBSTRING(str1 FROM 3 FOR 2) AS sub_str
FROM SampleStr;