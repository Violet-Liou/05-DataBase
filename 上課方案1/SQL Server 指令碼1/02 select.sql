--【課堂練習1】查詢有哪些產品有被買過
--SELECT distinct A.產品編號,B.產品
--FROM 訂貨明細 A
--INNER JOIN 產品資料 B on A.產品編號=B.產品編號


--【課堂練習2】查詢哪些員工有處理過訂單
SELECT distinct A.員工編號, B.姓名
FROM 訂貨主檔 A
INNER JOIN 員工 B on A.員工編號=B.員工編號


--【課堂練習3】
SELECT TOP 15 with ties *
FROM 訂貨明細 A
ORDER BY A.數量 DESC
