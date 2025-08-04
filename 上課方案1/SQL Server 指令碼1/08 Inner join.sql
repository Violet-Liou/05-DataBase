--SELECT *
--FROM 訂貨主檔 A
--INNER JOIN 訂貨明細 B ON A.訂單號碼=B.訂單號碼
--INNER JOIN 客戶 C ON A.客戶編號=c.客戶編號
--INNER JOIN 員工 D ON A.員工編號=D.員工編號
--INNER JOIN 產品資料 E ON B.產品編號=E.產品編號
--INNER JOIN 產品類別 F ON E.類別編號=F.類別編號
--INNER JOIN 供應商 G ON E.供應商編號=G.供應商編號
--INNER JOIN 貨運公司 H ON A.送貨方式=H.貨運公司編號

--inner join 的第二種寫法
SELECT *
FROM 貨運公司 H INNER JOIN
(供應商 G INNER JOIN 
(產品類別 F INNER JOIN
(員工 E INNER JOIN(
客戶 D INNER JOIN 
(產品資料 C INNER JOIN 
(訂貨明細 A INNER JOIN 訂貨主檔 B 
ON A.訂單號碼=B.訂單號碼)
ON A.產品編號=C.產品編號)
ON B.客戶編號=D.客戶編號)
ON B.員工編號=E.員工編號)
ON C.類別編號=F.類別編號)
ON C.供應商編號=G.供應商編號)
ON B.送貨方式=H.貨運公司編號


---------------------------------
--inner join 第三種寫法
--自然合併法、隱含合併法
SELECT *
FROM 貨運公司 H ,供應商 G ,產品類別 F ,員工 E ,客戶 D ,產品資料 C ,訂貨明細 A ,訂貨主檔 B
WHERE A.訂單號碼=B.訂單號碼
and A.產品編號=C.產品編號
and B.客戶編號=D.客戶編號
and B.員工編號=E.員工編號
and C.類別編號=F.類別編號
and C.供應商編號=G.供應商編號
and B.送貨方式=H.貨運公司編號