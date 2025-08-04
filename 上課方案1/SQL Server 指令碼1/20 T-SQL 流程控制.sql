--瑈祘北
--if/else

--狦ō蔼120ゼ骸140そだ禦布
--140そだ禦布
--120そだ布

declare @height int
set @height=130

if @height>=140
begin	
	print '布'
end
if @height>=120
	print  '布'
else
	print '布'

go
--=====================================================================================================================
--case
select A.絪腹, A.﹎, A.嘿㊣, 
		iif(A.嘿㊣='﹋','┦','╧┦')as ┦
from  A

--虏虫case
select A.絪腹, A.﹎, A.嘿㊣,
		case A.嘿㊣
			when '﹋' then '┦'
			when 'ネ' then '╧┦'
		end as ┦
from  A

--穓碝case
--狦ō蔼120ゼ骸140そだ禦布
--140そだ禦布
--120そだ布

declare @height int
set @height=180
declare @result nvarchar(5)

set @result=
	case
		when @height>=140 then '布'
		when @height>=120 then '布'
		else '布'
	end

print @result

go
--=============================================================================================
--while

--暗1100
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