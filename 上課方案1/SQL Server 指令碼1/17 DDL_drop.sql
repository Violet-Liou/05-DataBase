--drop

drop table [Member]
--現在這樣無法直接刪除資料表 =>因該資料表有被關聯

--1. 移除Member與Order之間的關聯(刪掉Order資料表上的F.K 條件約束)
alter table [Order]
	drop constraint FK__Order__MemberID__412EB0B6

--2. 刪除[Member]資料庫
drop table [Member]

--===============================================================================================================
--刪除整個資料庫
drop database GoodStore