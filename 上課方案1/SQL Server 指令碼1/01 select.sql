select 'Hello World!' as 欄位1


----------------------------------------------------
--1. 查看特定欄位
SELECT 客戶編號, 公司名稱
FROM 客戶


--2. 有條件的資料篩選
SELECT *
FROM 客戶
WHERE 連絡人職稱='董事長'

--3. 資料統計
SELECT 連絡人職稱, count(連絡人職稱)as 人數
FROM 客戶
GROUP BY 連絡人職稱