--SELECT 子句
--group by

--訂單總額
--SELECT A.訂單號碼, round(SUM(A.單價*A.數量*(1-A.折扣)),2)as 訂單總額
--FROM 訂貨明細 A
--GROUP BY A.訂單號碼

--列出訂單總額最高的前十筆資料
--SELECT TOP 10 with ties A.訂單號碼, round(SUM(A.單價*A.數量*(1-A.折扣)),2)as 訂單總額
--FROM 訂貨明細 A
--GROUP BY A.訂單號碼
--ORDER BY 訂單總額 DESC

--【課堂練習1】每一位客戶下單次數
--SELECT A.客戶編號, B.連絡人 ,count(A.客戶編號)as 下單次數
--FROM 訂貨主檔 A
--INNER JOIN 客戶 B ON A.客戶編號=B.客戶編號
--GROUP BY A.客戶編號, B.連絡人

--【課堂練習2】哪些客戶下單超過10次
--SELECT *
--FROM(
--	SELECT A.客戶編號, B.連絡人 ,count(A.客戶編號)as 下單次數
--	FROM 訂貨主檔 A
--	INNER JOIN 客戶 B ON A.客戶編號=B.客戶編號
--	GROUP BY A.客戶編號, B.連絡人
--)Z
--WHERE Z.下單次數>10 


--SELECT A.客戶編號, B.連絡人 ,count(A.客戶編號)as 下單次數
--FROM 訂貨主檔 A
--INNER JOIN 客戶 B ON A.客戶編號=B.客戶編號
--GROUP BY A.客戶編號, B.連絡人
--having count(*)>10


--統計每一位員工處理訂單的次數
--SELECT A.員工編號, count(*)as 處理訂單的次數
--FROM 訂貨主檔 A
--GROUP BY A.員工編號
--ORDER BY 處理訂單的次數 DESC

--【課堂練習3】找出前10名的銷售熱門商品(營業額)
SELECT TOP 10 with ties A.產品編號, B.產品, count(*)as 銷售次數 , round(SUM(A.單價*A.數量),2)as 營業額
FROM 訂貨明細 A
INNER JOIN 產品資料 B ON A.產品編號=B.產品編號
GROUP BY A.產品編號, B.產品
ORDER BY 營業額 DESC
