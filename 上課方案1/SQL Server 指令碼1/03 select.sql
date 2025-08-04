---資料篩選
--SELECT *
--FROM 客戶 A
--WHERE A.連絡人職稱='董事長'

--SELECT *
--FROM 客戶 A
--WHERE A.公司名稱='世邦'

--SELECT *
--FROM 客戶 A
--WHERE A.客戶編號='BERGs'


---查詢1994年以後到職的員工
--SELECT *
--FROM 員工 A
--WHERE year(A.雇用日期)>='1994'
--WHERE A.雇用日期 >='1994/1/1'

--【課堂練習】查詢那些產品的庫存小於安全存量
--SELECT *
--FROM 產品資料 A
--WHERE A.安全存量>A.庫存量

--【課堂練習2】查詢哪些產品需要採購
--SELECT *
--FROM 產品資料 A
--WHERE A.已訂購量+A.庫存量<A.安全存量

--【課堂練習3】查詢出"尚未出貨"的訂單
SELECT *
FROM 訂貨主檔 A
WHERE A.送貨日期 is null