--�ۭq���(function)

print getdate()

declare @OrderDate datetime = getdate()
print '�U�q���' + convert(varchar, @OrderDate ,111)

 --�̾ڦX���A�̺C����f��O30�ѥH��
set @OrderDate+=30
print '��f����' + convert(varchar, @OrderDate ,111)

--==================================================================================================================================
--�I�s��ƨ��o��f����
--create --�Ы�
alter --�ק�w�s�b�����
function fnGetDeadline()  --function�R�W�e���[�W�ufn�v�H�K����
	--returns datetime  --�^��datetime�o�Ӯ榡
	returns varchar(10)
as

begin
	--return getdate()+30
	return convert(varchar, getdate()+30 ,111)
end

---------------------------------------------------------------------------------

print '��f����' + dbo.fnGetDeadline()


--===============================================================================================================================
--�i�H�ǰѼƪ�function
create function fnGetDeadlineByDate(@date datetime)  --�Ѽƶǻ��G���R�W�A��榡
	--returns datetime  --�^��datetime�o�Ӯ榡
	returns varchar(10)
as

begin
	--return getdate()+30
	return convert(varchar, @date+30 ,111)
end
-----------------------------------------------
print '��f����' + dbo.fnGetDeadlineByDate('2025/6/13')
print '��f����' + dbo.fnGetDeadlineByDate(getDate())

--===============================================================================================================================================
--�ΫȤ�s���d�ߤ��q�W��
Select A.���q�W��
From �Ȥ� A
Where A.�Ȥ�s��='BSBEV' 
--1. Select���A�N��u���@����ơA�L�]�O�@��Table

--2. �ন�«G�� >> �]�ߤ@���ܼ�
declare @CName varchar(40)

Select @CName = A.���q�W��
From �Ȥ� A
Where A.�Ȥ�s��='BSBEV' 

print @CName

--3.�নfunction >> �i��J�Ѽƭ�
create function fnGetCNameById(@id char(5))
	returns varchar(40)
as
begin
	if @id ='' or @id is null
		return '���˹�Ȥ�N�X'
		--�]�ߤ@���ˬd�I >> �p�G�S�����T��J�Ȥ�N�X

	declare @CName varchar(40)

	Select @CName = A.���q�W��
	From �Ȥ� A
	Where A.�Ȥ�s��=@id

	if @CName is null
		return '�d�L�ӫȤ�'
		--�]�Y�d�L��ơASQL�ä��|�����A�ҥH�]�ߤ@��if�ӵ����@�ӿ��~�T��

	return @CName
end
----------------------------------
print dbo.fnGetCNameById('')

--========================================================================================================================================================
--�ΫȤ��ƶi������r�d��
create function fnGetCustomerListByKeyword(@keyword nvarchar(20))
	returns table

return
	(select *
	from �Ȥ� A
	where A.���q�W�� like '%'+@keyword+'%' or A.�s���H like '%'+@keyword+'%'
		or A.�s���H¾�� like '%'+@keyword+'%' or A.�a�} like '%'+@keyword+'%')

-----------------------------------------------------------------
select *
from dbo.fnGetCustomerListByKeyword('����')


--========================================================================================================================================================
--�i�Ұ�m�ߡj
--���ҡG�b�s�W�q��ɡA�ϥΪ̤���ۤv���J�q��s���A�]�������Ѩt�Φۤv���ӽs���W�h���ͤ@�ӭq��s��
--�ڭ̨M�w�b��Ʈw�ݫإߤ@�Ө�ơA�Ϩ�b�s�W�q���Ʈɯ�z�L��Ƨ��@�ӭq��s��

--�إߤ@�ӦW���ugetOrderID�v�����
--��\�ର�s�W�q��ɥi�I�s����Ʀ۰ʨ��o�@�ӷs���q��s��
--�q��s�����s�X�W�h���q���Ѥ���褸�~���(8�X)+4�X�y����
--(�Ҧp�G202412212015��2024/12/21��2015�i�q�檺�s��)

alter function fngetOrderID(@OrderDate varchar(10))
	returns varchar(12)
as
begin

declare @OrderDate varchar(10) = '1998-05-06'
	declare @Date char(8) = convert(varchar, @OrderDate ,112)
	declare @List nchar(4) 

	select @List = count(A.�q����)+1
	from �q�f�D�� A
	where A.�q����=@OrderDate
	


	set @List =  right( '0000' + CAST('1' as nvarchar(4)) ,4)

	print @List
	return  @Date + @List
end

------------------------------------------------------------------------------------
print dbo.fngetOrderID('1998-05-06')



-------------------------------------------------------
--�i�Ѯv�����j

create function getOrderID()
	returns nchar(12)
as
begin
	--���o��Ѥ���~���(8�X)
	declare @today char(8) = convert(varchar, getdate(), 112)


	--�|�X�y�������ͳW�h

	--1.�줵�ѳ̫�@�i�q�渹�X�[1
	declare @lastID nchar(12) , @newID nchar(12)

	select top 1 @lastID=OrderID
	from [Order]
	where convert(varchar, OrderDate, 112) = @today
	order by OrderDate desc

	--2.�Y���ѨS������q��h��'0001'
	if @lastID is null
		set @newID=@today+'0001'  --���Ѫ��Ĥ@�i�q��
	else
		set @newID = cast( cast(@lastID as bigint)+1  as nchar)
	
	

	return @newID
end


--����
print dbo.getOrderID()