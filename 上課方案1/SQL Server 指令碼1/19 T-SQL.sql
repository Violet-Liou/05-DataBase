-- T-SQL程式語言

print 'Hello World'

select 'Hello World'

select tb1.*
from (select 'Hello World' as aaa) as tb1

--================================================================================================
--變數 (變數前會加上@)
--1.純亮值變數
--2.資料表變數

declare @MyName nvarchar(20) = 'Jack Lee'
--宣告變數「MyName」，資料型態為「nvarchar」，長度為「20」，初始化資料為「Jack Lee」

print @MyName

select @MyName

--------------------------------------------------------------------
declare @Number int
set @Number=456 --用「set....=...」給值
select @Number=789  --用「select...=...」給值

print @Number

--★T-SQL不分大小寫

--=============================================================================================================================
declare @EmpName nvarchar(20)

select @EmpName=姓名
from 員工
where 員工編號=1

print '員工的姓名叫'+@EmpName

------------------------------------------------------------------------------------------------
declare @salary money=50000
print '您的薪水是'+ cast(@salary as varchar) --SQL無法隱含轉換型態，需要使用cast 讓型態為money的數字轉成varchar

declare @birthday datetime = '2025-6-23'
print '您的生日是'+ convert (varchar, @birthday, 111)

------------------------------------------------------------------------
declare @dDay datetime

select @dDay=要貨日期
from 訂貨主檔 
where 訂單號碼=10259
print '此訂單的要貨日期是'+convert(varchar, @dDay, 111)

-------------------------------------------------------------------------------
--資料表變數
declare @myTable table(
	[name] nvarchar(30),
	birthday datetime,
	tel varchar(20),
	note nvarchar(max)
)

insert into @myTable values('王小名','2025-6-23','07-8878778','長得很可愛')

insert into @myTable
select 姓名,出生日期,電話號碼,附註 from  員工

select * from @myTable