--自訂函數(function)

print getdate()

declare @OrderDate datetime = getdate()
print '下訂日期' + convert(varchar, @OrderDate ,111)

 --依據合約，最慢的交貨日是30天以後
set @OrderDate+=30
print '交貨期限' + convert(varchar, @OrderDate ,111)

--==================================================================================================================================
--呼叫函數取得交貨期限
--create --創建
alter --修改已存在的函數
function fnGetDeadline()  --function命名前面加上「fn」以便辨識
	--returns datetime  --回傳datetime這個格式
	returns varchar(10)
as

begin
	--return getdate()+30
	return convert(varchar, getdate()+30 ,111)
end

---------------------------------------------------------------------------------

print '交貨期限' + dbo.fnGetDeadline()


--===============================================================================================================================
--可以傳參數的function
create function fnGetDeadlineByDate(@date datetime)  --參數傳遞：先命名，後格式
	--returns datetime  --回傳datetime這個格式
	returns varchar(10)
as

begin
	--return getdate()+30
	return convert(varchar, @date+30 ,111)
end
-----------------------------------------------
print '交貨期限' + dbo.fnGetDeadlineByDate('2025/6/13')
print '交貨期限' + dbo.fnGetDeadlineByDate(getDate())

--===============================================================================================================================================
--用客戶編號查詢公司名稱
Select A.公司名稱
From 客戶 A
Where A.客戶編號='BSBEV' 
--1. Select完，就算只有一筆資料，他也是一個Table

--2. 轉成純亮值 >> 設立一個變數
declare @CName varchar(40)

Select @CName = A.公司名稱
From 客戶 A
Where A.客戶編號='BSBEV' 

print @CName

--3.轉成function >> 可輸入參數值
create function fnGetCNameById(@id char(5))
	returns varchar(40)
as
begin
	if @id ='' or @id is null
		return '請檢察客戶代碼'
		--設立一個檢查點 >> 如果沒有正確輸入客戶代碼

	declare @CName varchar(40)

	Select @CName = A.公司名稱
	From 客戶 A
	Where A.客戶編號=@id

	if @CName is null
		return '查無該客戶'
		--因若查無資料，SQL並不會報錯，所以設立一個if來給予一個錯誤訊息

	return @CName
end
----------------------------------
print dbo.fnGetCNameById('')

--========================================================================================================================================================
--用客戶資料進行關鍵字查詢
create function fnGetCustomerListByKeyword(@keyword nvarchar(20))
	returns table

return
	(select *
	from 客戶 A
	where A.公司名稱 like '%'+@keyword+'%' or A.連絡人 like '%'+@keyword+'%'
		or A.連絡人職稱 like '%'+@keyword+'%' or A.地址 like '%'+@keyword+'%')

-----------------------------------------------------------------
select *
from dbo.fnGetCustomerListByKeyword('市中')


--========================================================================================================================================================
--【課堂練習】
--情境：在新增訂單時，使用者不能自己漸入訂單編號，因此必須由系統自己按照編號規則產生一個訂單編號
--我們決定在資料庫端建立一個函數，使其在新增訂單資料時能透過函數抓到一個訂單編號

--建立一個名為「getOrderID」的函數
--其功能為新增訂單時可呼叫此函數自動取得一個新的訂單編號
--訂單編號的編碼規則為訂單當天日期西元年月日(8碼)+4碼流水號
--(例如：202412212015為2024/12/21第2015張訂單的編號)

alter function fngetOrderID(@OrderDate varchar(10))
	returns varchar(12)
as
begin

declare @OrderDate varchar(10) = '1998-05-06'
	declare @Date char(8) = convert(varchar, @OrderDate ,112)
	declare @List nchar(4) 

	select @List = count(A.訂單日期)+1
	from 訂貨主檔 A
	where A.訂單日期=@OrderDate
	


	set @List =  right( '0000' + CAST('1' as nvarchar(4)) ,4)

	print @List
	return  @Date + @List
end

------------------------------------------------------------------------------------
print dbo.fngetOrderID('1998-05-06')



-------------------------------------------------------
--【老師版本】

create function getOrderID()
	returns nchar(12)
as
begin
	--取得當天日期年月日(8碼)
	declare @today char(8) = convert(varchar, getdate(), 112)


	--四碼流水號產生規則

	--1.抓今天最後一張訂單號碼加1
	declare @lastID nchar(12) , @newID nchar(12)

	select top 1 @lastID=OrderID
	from [Order]
	where convert(varchar, OrderDate, 112) = @today
	order by OrderDate desc

	--2.若今天沒有任何訂單則為'0001'
	if @lastID is null
		set @newID=@today+'0001'  --今天的第一張訂單
	else
		set @newID = cast( cast(@lastID as bigint)+1  as nchar)
	
	

	return @newID
end


--測試
print dbo.getOrderID()