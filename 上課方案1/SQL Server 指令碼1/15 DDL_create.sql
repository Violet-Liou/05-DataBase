--�إ߸�ƪ�

--�ӫ~��ƪ�
create table [Product]( --Product�O���⪺�A�N��O��� =>�]�N�OProduct�o�Ӧ���Ʈw���ت����O�W�١C  ��[]�h�ذ_�ӡA�i�D��Ʈw�ؤ����O�W�r
	ProductID nchar(5) not null primary key,
	ProductName nvarchar(40) not null,
	Price money not null check(Price>=0),
	Description nvarchar(200),
	Picture nvarchar(12) not null,
	CreatedDate datetime not null default getdate(),
	--CateID nchar(2) not null foreign key references Category(CateID)
	--���]�|��CateID ���A�B������٬O�@��foreign key�A�]�]���S�����s���ƪ�
);

--�� timestamp �ɶ��W�O =>�N�ɶ��O�����׽X�A�bŪ���ɱN�t�X�ѪR

--�|����ƪ�
create table [Member](
	MemberID nchar(6) not null primary key,
	Name nvarchar(30) not null,
	Gender bit not null,
	MemberPoint int not null default 0,
	Account nvarchar(12) not null unique, --unique �ߤ@�ȡA���୫��
	Password nvarchar(20) not null,
	CreatedDate datetime not null default getdate()
);

--�q���ƪ�
create table [Order](
	OrderID nchar(12) not null primary key, --column level =>�����b��줤�y�z
	OrderDate datetime not null default getdate(),
	MemberID nchar(6) not null,
	ContactName nvarchar(30) not null,
	ContactAddress nvarchar(100) not null,
	foreign key (MemberID) references [Member](MemberID)
);

--foreign key(MemberID) references Member(MemberID) =>table level(��ƪ���)���y�z�A�w���Ӹ�ƪ�b�y�z 
--�o�Ӹ�ƪ��@��foreign key�FMemberID�A�ݭn�Ѧ�table Member����MemberID���
--�� �n���إ߸������(MemberID nchar(6) not null)�A�~�i�H�h�]�wtable level

--�q����Ӹ�ƪ�
create table [OrderDetail](
	OrderID nchar(12) not null,
	ProductID nchar(5) not null,
	Qty int not null default 1,
	Price money not null check(Price>=0),
	primary key(OrderID, ProductID),
	foreign key(OrderID)references [Order](OrderID) ,
	foreign key(ProductID)references [Product](ProductID),
);

--�q����Ӹ�ƪ�
create table [Category](
	CateID nchar(2) not null primary key,
	CateName nvarchar(20) not null
);