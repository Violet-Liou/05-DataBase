--【隨堂練習】

--在【員工】資料表中找出所有女員工的資料記錄。
--SELECT *
--FROM 員工 A
--WHERE A.稱呼='小姐'

--在【員工】資料表中找出所有在1968年(含)以後出生的資料記錄。
--SELECT *
--FROM 員工 A
--WHERE year(A.出生日期)>='1968'

--在【訂貨主檔】資料表找出送貨的城市為台北市及高雄市的資料記錄。
SELECT *
FROM 訂貨主檔 A
WHERE A.送貨地址 like '%[台臺]%北%市%'  or A.送貨地址 like '%高%雄%市%'

--在【產品資料】資料表中找出庫存量最多的前6名資料記錄。
SELECT TOP 6 with ties *
FROM 產品資料 A
ORDER BY A.庫存量 DESC

--在【訂貨明細】資料表找出訂單號碼10847共包含哪些產品。
SELECT A.訂單號碼, A.產品編號, B.產品
FROM 訂貨明細 A
INNER JOIN 產品資料 B ON A.產品編號=B.產品編號
WHERE A.訂單號碼='10847'

--在【訂貨明細】資料表找出訂單中包含超過5種產品的資料記錄。
--SELECT A.訂單號碼, count(A.產品編號)as 產品種類數量
--FROM 訂貨明細 A
--GROUP BY A.訂單號碼
--having count(A.產品編號)>=5
--ORDER BY 產品種類數量 DESC

--計算【產品資料】資料表中類別號為2的產品資料平均單價。 
--SELECT A.類別編號, AVG(A.單價)as 平均單價
--FROM 產品資料 A
--WHERE A.類別編號=2
--GROUP BY A.類別編號

--在【產品資料】資料表中找出庫存量小於安全存量，且尚未進行採購的產品資料記錄。
--SELECT *
--FROM 產品資料 A
--WHERE A.庫存量<A.安全存量 and A.已訂購量=0

--在【客戶】資料表中找出公司名稱包含「川」、「生」、「捷」、「天」、「中」、「社」、「材」、「業」、「立」等字的資料記錄。
SELECT *
FROM 客戶 A
WHERE A.公司名稱 like '%[川生捷天中社材業立]%'

--在適當的資料表中找出訂購產品數量介於20~30件的資料記錄。
SELECT A.訂單號碼, SUM(A.數量)as 訂單產品數量
FROM 訂貨明細 A
GROUP BY A.訂單號碼
having SUM(A.數量)>=20 and SUM(A.數量)<=30

--在【訂貨主檔】資料表中找出尚未有送貨日期的記錄資料。
--SELECT *
--FROM 訂貨主檔 A
--WHERE A.送貨日期 is null

--在【訂貨明細】資料表中顯示出訂單號碼10263所有產品的價格小計。
SELECT *, round(A.單價*A.數量*(1-A.折扣),2)as 小計
FROM 訂貨明細 A
WHERE A.訂單號碼='10263'

--利用【產品資料】資料表資料，統計出每一個供應商各提供了幾樣產品。
SELECT A.供應商編號, B.供應商, count(A.產品)as 產品樣數
FROM 產品資料 A
INNER JOIN 供應商 B ON A.供應商編號=B.供應商編號
GROUP BY A.供應商編號, B.供應商

--利用【訂貨主檔】資料表資料，統計出每一位客戶被每一位員工所服務次數。
SELECT A.客戶編號, A.員工編號, count(*)as 服務次數
FROM 訂貨主檔 A
GROUP BY A.客戶編號, A.員工編號
ORDER BY A.客戶編號

--利用【訂貨明細】資料表資料，統計出各項商品的平均單價與平均銷售數量，並僅列出平均銷售數量大於10的資料，且將資料依產品編號由小到大排序。
SELECT A.產品編號, round(AVG(A.單價),2)as 平均單價, AVG(A.數量)as 平均銷售數量
FROM 訂貨明細 A
GROUP BY A.產品編號
having  AVG(A.數量)>10
ORDER BY A.產品編號

