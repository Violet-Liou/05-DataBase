--DDL Trigger
--insert update delete ==> DML
--Create alter drop ==> DDL

--我要把這個資料庫裡所有的table都設定成唯讀
create trigger readOnlyTable on database
for drop_table, alter_table
as
begin
	rollback
end

drop table 客戶

------------------------------------------------------------------------
--停用資料庫Trigger
disable trigger readOnlyTable on database

--停用資料表上的Trigger
disable trigger getUpdateDataTable on 客戶
--啟用資料表上的Trigger
enable trigger getUpdateDataTable on 客戶