-- T-SQL�{���y��

print 'Hello World'

select 'Hello World'

select tb1.*
from (select 'Hello World' as aaa) as tb1

--================================================================================================
--�ܼ� (�ܼƫe�|�[�W@)
--1.�«G���ܼ�
--2.��ƪ��ܼ�

declare @MyName nvarchar(20) = 'Jack Lee'
--�ŧi�ܼơuMyName�v�A��ƫ��A���unvarchar�v�A���׬��u20�v�A��l�Ƹ�Ƭ��uJack Lee�v

print @MyName

select @MyName

--------------------------------------------------------------------
declare @Number int
set @Number=456 --�Ρuset....=...�v����
select @Number=789  --�Ρuselect...=...�v����

print @Number

--��T-SQL�����j�p�g

--=============================================================================================================================
declare @EmpName nvarchar(20)

select @EmpName=�m�W
from ���u
where ���u�s��=1

print '���u���m�W�s'+@EmpName

------------------------------------------------------------------------------------------------
declare @salary money=50000
print '�z���~���O'+ cast(@salary as varchar) --SQL�L�k���t�ഫ���A�A�ݭn�ϥ�cast �����A��money���Ʀr�নvarchar

declare @birthday datetime = '2025-6-23'
print '�z���ͤ�O'+ convert (varchar, @birthday, 111)

------------------------------------------------------------------------
declare @dDay datetime

select @dDay=�n�f���
from �q�f�D�� 
where �q�渹�X=10259
print '���q�檺�n�f����O'+convert(varchar, @dDay, 111)

-------------------------------------------------------------------------------
--��ƪ��ܼ�
declare @myTable table(
	[name] nvarchar(30),
	birthday datetime,
	tel varchar(20),
	note nvarchar(max)
)

insert into @myTable values('���p�W','2025-6-23','07-8878778','���o�ܥi�R')

insert into @myTable
select �m�W,�X�ͤ��,�q�ܸ��X,���� from  ���u

select * from @myTable