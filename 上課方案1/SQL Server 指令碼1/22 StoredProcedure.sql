--�s�W Member ��Ʈ�,���ˬd�|���b��(Account)�O�_�s�b
--�]���N�s�W���覡�����w�s�{��
--�إߦbGoodStore DB��

create proc InsertMemberData
	@memid nchar(6), @name nvarchar(30), @gender bit, @memberPoint int,
	@account nvarchar(12), @passwaord nvarchar(20)
as
begin
	declare @r nchar(6)
	select @r=M.MemberID from Member M where M.Account=@account

	if @r is null
		insert into [Member] values(@memid,@name,@gender,@memberPoint,@account,@passwaord,GETDATE())
	else
		print('�|���b������')
end

--------
--�s�W�|����Ʈ�,���ε{���ݤ@�ߨϥθ�Ʈw�ݪ��w�s�{��

exec InsertMemberData 'M00002','test',0,0,'aaaaaaa','asdfj222'  --�i���\�s�W���

exec InsertMemberData 'M00003','test',0,0,'aaaaaaa','asdfj222'  --���|�s�W���
