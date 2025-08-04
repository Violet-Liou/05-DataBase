--【alter】 修改資料表定義 (★注意：要修改的資料表必須已存在，才可以使用alter修改)
--在Product資料中增加一個CateID
alter table [Product]
	add CateID nchar(2) not null

--建立Product資料表與Category資料表之間的關聯
alter table [Product]
	add foreign key (CateID) references Category(CateID)

--建立OrderDatail資料表與Product資料比朝間的關聯
alter table OrderDatail
	add foreign key (ProductID) references [Product](ProductID)



--假設在系統施作期間有需求變更，要將MemberPoint欄位刪除
---這時該用drop還是alter
alter table [Member]
	drop column MemberPoint
--當這個資料表變更執行時，將會出現相依性的錯誤
--在相依姓未消除前，無法刪除MemberPoint

alter table [Member]
	drop constraint DF__Member__MemberPo__5BE2A6F2 

alter table [Member]
	drop column MemberPoint

