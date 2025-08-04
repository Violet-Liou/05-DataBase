--觸發程序 Trigger
--與預存程序一樣是一個預先寫好的程式
--但它無法直接呼叫執行，而是在某個時機點會自己觸發執行
--一般是用在對某個資料表做Inert、Update、Delete 之後進行觸發

--在執行Insert、Update、Delete這三種會對資料造成改變的DML時
--從執行到成功commit，中間會經過一連串精密的檢查，只是我們看不見而已



--建立貨運公司資料表的Trigger,用來讀出Inserted
create trigger getInsertedTable on 貨運公司
after insert
as
begin

	select * from Inserted
end


insert into 貨運公司(貨運公司編號,貨運公司名稱  , 電話 )  values(100,'貨運111'  , '(08)8210171' )




create trigger getUpdateDataTable on 客戶
after update
as
begin
	select '新的', * from inserted
	union all
	select '舊的',* from deleted
end


update 客戶
set 連絡人='A小姐',連絡人職稱='公關經理'
where 客戶編號='ALFKI'


--==========================================================================================================================================
--如果訂單商品訂購數量大於該商品的庫存量或售價大於訂價,則訂購失敗
--若訂購成功,則扣除訂購的庫存量
--客戶在下訂單時,會動用到三張資料表-訂貨主檔、訂貨明細、產品資料

--假設訂貨主檔新增成功,訂貨明細新增成功,但某一產品訂購數量大於庫存量(需探討的議題)


create trigger checkOurderQtyPrice on 訂貨明細
after insert
as
begin
	--1.果訂單商品訂購數量大於該商品的庫存量或售價大於訂價,則訂購失敗
	--2.若訂購成功,則扣除訂購的庫存量


		declare @OrderProductID int, @OrderProductPrice money, @OrderProductQty int
		declare @ProductID int, @ProductPrice money, @ProductQty int

		select  @OrderProductID=產品編號,@OrderProductPrice=單價,@OrderProductQty=數量
		from inserted   --取得即將要寫入訂貨明細的資料

		select  @ProductID=產品編號,@ProductPrice=單價,@ProductQty=庫存量
		from 產品資料 where 產品編號=@OrderProductID


		
	if @OrderProductPrice>@ProductPrice
		rollback
	else if @OrderProductQty>@ProductQty
		rollback
	else --扣除產品資料的庫存量
		update 產品資料
		set 庫存量=庫存量-@OrderProductQty
		where 產品編號=@OrderProductID

end

insert into 訂貨明細 values(10248,1,20,10,0)


--=========================================================================================================================================
--薪資客戶資料時，若該客戶資料已存在，則進行資料修改(insert → update)

create trigger add_CustomerIDCheck on 客戶
instead of insert
as
begin
	--如果發現PK存在，則做資料修改，否則做新增

	--如果發現PK存在
	declare @CID nchar(5)
	select @CID = 客戶編號 from 客戶
	where 客戶編號=(select 客戶編號 from inserted)

	if @CID !=''	--如果發現客戶編號存在
	begin
		--進行資料修改
		update 客戶
		set 公司名稱=inserted.公司名稱, 
			連絡人=inserted.連絡人,
			連絡人職稱=inserted.連絡人職稱,
			地址=inserted.地址,
			郵遞區號=inserted.郵遞區號,
			電話=inserted.電話,
			傳真電話=inserted.傳真電話
		from 客戶 inner join inserted on 客戶.客戶編號=inserted.客戶編號
	end
	else--如果發現客戶編號不存在
	begin
		--進行資料新增
		insert into 客戶 
		select * from inserted
	end
end

insert into 客戶
values('AAAAA','二川實業有限公司','BBB','CCC','DDD','122009','123456','')
