--資料統計
--聚合函數
--count()

--SELECT count(A.員工編號) as 員工人數
--FROM 員工 A

--SELECT count(A.送貨日期) as 已出貨訂單數量 
--FROM 訂貨主檔 A


--【課堂練習】查詢出未出貨的訂單有幾筆
--SELECT count(*)as 未出貨的訂單數
--FROM 訂貨主檔 A
--WHE  is null


--SUM()
--SELECT SUM(A.庫存量) as 剩餘產品件數
--FROM 產品資料 A

--SELECT *, A.單價*A.數量*(1-A.折扣)as 小計
--FROM 訂貨明細 A

--SELECT A.訂單號碼, SUM(A.單價*A.數量*(1-A.折扣))as 訂貨總金額  --數字呈現"精準度遺失"
--FROM 訂貨明細 A
--GROUP BY A.訂單號碼  

--avg()
SELECT avg(A.單價) as 平均單價
FROM 產品資料 A

--max()
SELECT MAX(A.單價) as 最高單價
FROM 產品資料 A


--min()
SELECT MIN(A.單價) as 最低單價
FROM 產品資料 A



SELECT SUM(A.單價) as 總單價, avg(A.單價) as 平均單價, MAX(A.單價) as 最高單價, MIN(A.單價) as 最低單價, count(*)as 單價筆數
FROM 產品資料 A