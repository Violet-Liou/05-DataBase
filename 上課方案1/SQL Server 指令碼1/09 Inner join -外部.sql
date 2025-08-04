--外部合併查詢 (以某一個資料表為主) RIGHT JOIN、LEFT JOIN
SELECT *
FROM 訂貨主檔 A 
RIGHT JOIN 員工 B ON A.員工編號=B.員工編號

--找出從未處理訂單的員工資料
SELECT *
FROM 訂貨主檔 A 
RIGHT JOIN 員工 B ON A.員工編號=B.員工編號
WHERE A.訂單號碼 is null

--找出從未下過訂單的客戶資料
SELECT *
FROM 訂貨主檔 A 
RIGHT JOIN 客戶 B ON A.客戶編號=B.客戶編號
WHERE A.訂單號碼 is null

--找出從未被買過的商品資料
SELECT *
FROM 訂貨明細 A 
RIGHT JOIN 產品資料 B ON A.產品編號=B.產品編號
WHERE A.訂單號碼 is null

