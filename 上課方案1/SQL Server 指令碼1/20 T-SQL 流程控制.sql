--�y�{����
--if/else

--�p�G����120�H�W�A����140�����R�b��
--140�����H�W�R����
--120�����H�U�K��

declare @height int
set @height=130

if @height>=140
begin	
	print '����'
end
if @height>=120
	print  '�b��'
else
	print '�K��'

go
--=====================================================================================================================
--�icase�j
select A.���u�s��, A.�m�W, A.�٩I, 
		iif(A.�٩I='�p�j','�k��','�k��')as �ʧO
from ���u A

--²��case
select A.���u�s��, A.�m�W, A.�٩I,
		case A.�٩I
			when '�p�j' then '�k��'
			when '����' then '�k��'
		end as �ʧO
from ���u A

--�j�Mcase
--�p�G����120�H�W�A����140�����R�b��
--140�����H�W�R����
--120�����H�U�K��

declare @height int
set @height=180
declare @result nvarchar(5)

set @result=
	case
		when @height>=140 then '����'
		when @height>=120 then '�b��'
		else '�K��'
	end

print @result

go
--=============================================================================================
--�iwhile�j

--��1�[��100
declare @i int=1, @sum int=0

while @i<=100
begin
	set @sum=@sum+@i
	set @i+=1
end

print @sum
go
--------------------------------------------------------------------------------
--*
--**
--***
--****
--*****

declare @i int =1, @result varchar(max) = ''

while @i<=100
begin
	set @result +='*'
	print @result
	set @i+=1
end