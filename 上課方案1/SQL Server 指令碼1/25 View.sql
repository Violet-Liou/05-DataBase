create view view_allData
as
SELECT A.產品編號, A.產品, A.單價, AVG(B.單價)as  average
FROM 產品資料 as A
INNER JOIN 產品資料 as B on A.產品編號!=B.產品編號  --目的是： 讓每個產品 A 都配對一次所有其它產品 B，用來計算「其他產品的平均價格」。(排除自己來計算「相對」的統計資訊)
GROUP BY A.產品編號, A.產品, A.單價