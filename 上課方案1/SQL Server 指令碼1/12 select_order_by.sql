--order by的子句 offset
--

--SELECT * 
--FROM 產品資料 A
--ORDER BY A.產品編號 desc

--取排除前10筆的資料
--SELECT *
--FROM 產品資料 A
--ORDER BY A.產品編號
--offset 10 rows　--排除前10筆


--取指定的筆數 => 排除前10筆後，往後取10筆資料
SELECT *
FROM 產品資料 A
ORDER BY A.產品編號
offset 10 rows
fetch next 10 rows only