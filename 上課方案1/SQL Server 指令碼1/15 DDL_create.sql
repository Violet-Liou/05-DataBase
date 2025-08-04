--建立資料表

--商品資料表
create table [Product]( --Product是粉色的，代表是函數 =>也就是Product這個式資料庫內建的指令名稱。  用[]去框起來，告訴資料庫框中的是名字
	ProductID nchar(5) not null primary key,
	ProductName nvarchar(40) not null,
	Price money not null check(Price>=0),
	Description nvarchar(200),
	Picture nvarchar(12) not null,
	CreatedDate datetime not null default getdate(),
	--CateID nchar(2) not null foreign key references Category(CateID)
	--假設漏建CateID 欄位，且此欄位還是一個foreign key，也因此沒有關連到資料表
);

--★ timestamp 時間戳記 =>將時間記錄成案碼，在讀取時將暗碼解析

--會員資料表
create table [Member](
	MemberID nchar(6) not null primary key,
	Name nvarchar(30) not null,
	Gender bit not null,
	MemberPoint int not null default 0,
	Account nvarchar(12) not null unique, --unique 唯一值，不能重複
	Password nvarchar(20) not null,
	CreatedDate datetime not null default getdate()
);

--訂單資料表
create table [Order](
	OrderID nchar(12) not null primary key, --column level =>直接在欄位中描述
	OrderDate datetime not null default getdate(),
	MemberID nchar(6) not null,
	ContactName nvarchar(30) not null,
	ContactAddress nvarchar(100) not null,
	foreign key (MemberID) references [Member](MemberID)
);

--foreign key(MemberID) references Member(MemberID) =>table level(資料表等級)的描述，針對整個資料表在描述 
--這個資料表有一個foreign key；MemberID，需要參考table Member中的MemberID欄位
--★ 要先建立資料欄位後(MemberID nchar(6) not null)，才可以去設定table level

--訂單明細資料表
create table [OrderDetail](
	OrderID nchar(12) not null,
	ProductID nchar(5) not null,
	Qty int not null default 1,
	Price money not null check(Price>=0),
	primary key(OrderID, ProductID),
	foreign key(OrderID)references [Order](OrderID) ,
	foreign key(ProductID)references [Product](ProductID),
);

--訂單明細資料表
create table [Category](
	CateID nchar(2) not null primary key,
	CateName nvarchar(20) not null
);