--資料型態與轉換
--CAST( data as type)
SELECT A.類別編號, B.類別名稱, CAST(count(*) as varchar)+'種' as 數量
FROM 產品資料 A
INNER JOIN 產品類別 B ON A.類別編號=B.類別編號
GROUP BY A.類別編號, B.類別名稱

SELECT * FROM 產品資料

SELECT DISTINCT A.類別編號
FROM 產品資料 A


--資料型態轉換及格式的問題
--convert(type , value, 格式代碼)
SELECT iif(A.送貨日期 is null , '尚未出貨', CONVERT(varchar, A.訂單日期, 111))as 訂單日期
FROM 訂貨主檔 A

--統計每天有幾張訂單
SELECT CONVERT(varchar, A.訂單日期, 111)as 訂單日期, count(*)as 訂單數量
FROM 訂貨主檔 A
GROUP BY A.訂單日期


-----------------------------------------------------------------------------

--ISNULL()
select isnull(convert(varchar,送貨日期,111), '尚未出貨' )
from 訂貨主檔

