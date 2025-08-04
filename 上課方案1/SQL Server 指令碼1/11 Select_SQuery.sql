--查詢劉天王這位員工處理過的所有訂單資料
--1. 先透過員工資料表，利用員工姓名查到員工編號
--SELECT * 
--FROM 員工 A
--WHERE A.姓名='劉天王'

--2. 用子查詢寫出
--SELECT * FROM 訂貨主檔 A
--WHERE A.員工編號=(SELECT A.員工編號 
--FROM 員工 A
--WHERE A.姓名='劉天王')

--2.1 用合併查詢寫出
--SELECT *
--FROM 訂貨主檔 A
--INNER JOIN 員工 B on A.員工編號=B.員工編號
--WHERE B.姓名='劉天王'





--查詢大華城台北這位客戶的訂單資料(用合併查詢)
--SELECT A.*
--FROM 訂貨主檔 A
--INNER JOIN 客戶 B on A.客戶編號=B.客戶編號
--WHERE B.公司名稱='大華城台北'


-----------------------------------------------------------------------
--請查詢哪些商品的單價大於全部商品的平均單價
--子查詢
--SELECT A.*
--FROM 產品資料 A
--WHERE A.單價>(SELECT AVG(A.單價) FROM 產品資料 A)

--合併查詢 (自我合併)
--自我合併的寫法【一定要取別名】，就連欄位都要另位取名
--SELECT A.產品編號, A.產品, A.單價, AVG(B.單價)as  average
--FROM 產品資料 as A
--INNER JOIN 產品資料 as B on A.產品編號!=B.產品編號  --目的是： 讓每個產品 A 都配對一次所有其它產品 B，用來計算「其他產品的平均價格」。(排除自己來計算「相對」的統計資訊)
--GROUP BY A.產品編號, A.產品, A.單價
--having A.單價>AVG(B.單價)




--【課堂練習】那些客戶買過豬肉
--主查詢是客戶
--唯一線索是豬肉

--用【事件條列式】分析
--(1)客戶下訂單
--(2)訂單包含商品
--(3)商品有商品名稱
-- >>透過產品資料找到豬肉編號

--合併查詢
SELECT DISTINCT B.*,D.產品
FROM 訂貨主檔 A
INNER JOIN 客戶 B ON A.客戶編號=B.客戶編號
INNER JOIN 訂貨明細 C ON A.訂單號碼=C.訂單號碼
INNER JOIN 產品資料 D ON C.產品編號=D.產品編號
WHERE D.產品='豬肉'

--子查詢
SELECT *
FROM 客戶 A
WHERE A.客戶編號 in (
	SELECT DISTINCT A.客戶編號 FROM 訂貨主檔 A
			WHERE A.訂單號碼 in (
				SELECT C.訂單號碼 FROM 訂貨明細 C 
				WHERE C.產品編號 in (SELECT 產品編號 FROM 產品資料 WHERE 產品='豬肉')
			)
)

-----------------------------------------------------------------------------------------------------
--那些員工處理過客戶名稱為「正人資源」的訂單
SELECT * FROM 員工
WHERE 員工編號 IN (SELECT DISTINCT 員工編號 FROM 訂貨主檔
WHERE 客戶編號 IN (SELECT 客戶編號 FROM 客戶
WHERE 公司名稱='正人資源'))


-----------------------------------------------------------------------------------------------------
--【exists 運算子】(基本上只用在子查詢)  >>比較兩個資料集合資料是否相互存在
--查詢那些客戶下過訂單
SELECT * 
FROM 客戶 C
WHERE EXISTS (SELECT * FROM 訂貨主檔 O )