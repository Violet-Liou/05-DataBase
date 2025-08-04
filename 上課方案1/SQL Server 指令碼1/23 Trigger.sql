--Ĳ�o�{�� Trigger
--�P�w�s�{�Ǥ@�ˬO�@�ӹw���g�n���{��
--�����L�k�����I�s����A�ӬO�b�Y�Ӯɾ��I�|�ۤvĲ�o����
--�@��O�Φb��Y�Ӹ�ƪ�Inert�BUpdate�BDelete ����i��Ĳ�o

--�b����Insert�BUpdate�BDelete�o�T�ط|���Ƴy�����ܪ�DML��
--�q����즨�\commit�A�����|�g�L�@�s���K���ˬd�A�u�O�ڭ̬ݤ����Ӥw



--�إ߳f�B���q��ƪ�Trigger,�Ψ�Ū�XInserted
create trigger getInsertedTable on �f�B���q
after insert
as
begin

	select * from Inserted
end


insert into �f�B���q(�f�B���q�s��,�f�B���q�W��  , �q�� )  values(100,'�f�B111'  , '(08)8210171' )




create trigger getUpdateDataTable on �Ȥ�
after update
as
begin
	select '�s��', * from inserted
	union all
	select '�ª�',* from deleted
end


update �Ȥ�
set �s���H='A�p�j',�s���H¾��='�����g�z'
where �Ȥ�s��='ALFKI'


--==========================================================================================================================================
--�p�G�q��ӫ~�q�ʼƶq�j��Ӱӫ~���w�s�q�ΰ���j��q��,�h�q�ʥ���
--�Y�q�ʦ��\,�h�����q�ʪ��w�s�q
--�Ȥ�b�U�q���,�|�ʥΨ�T�i��ƪ�-�q�f�D�ɡB�q�f���ӡB���~���

--���]�q�f�D�ɷs�W���\,�q�f���ӷs�W���\,���Y�@���~�q�ʼƶq�j��w�s�q(�ݱ��Q��ĳ�D)


create trigger checkOurderQtyPrice on �q�f����
after insert
as
begin
	--1.�G�q��ӫ~�q�ʼƶq�j��Ӱӫ~���w�s�q�ΰ���j��q��,�h�q�ʥ���
	--2.�Y�q�ʦ��\,�h�����q�ʪ��w�s�q


		declare @OrderProductID int, @OrderProductPrice money, @OrderProductQty int
		declare @ProductID int, @ProductPrice money, @ProductQty int

		select  @OrderProductID=���~�s��,@OrderProductPrice=���,@OrderProductQty=�ƶq
		from inserted   --���o�Y�N�n�g�J�q�f���Ӫ����

		select  @ProductID=���~�s��,@ProductPrice=���,@ProductQty=�w�s�q
		from ���~��� where ���~�s��=@OrderProductID


		
	if @OrderProductPrice>@ProductPrice
		rollback
	else if @OrderProductQty>@ProductQty
		rollback
	else --�������~��ƪ��w�s�q
		update ���~���
		set �w�s�q=�w�s�q-@OrderProductQty
		where ���~�s��=@OrderProductID

end

insert into �q�f���� values(10248,1,20,10,0)


--=========================================================================================================================================
--�~��Ȥ��ƮɡA�Y�ӫȤ��Ƥw�s�b�A�h�i���ƭק�(insert �� update)

create trigger add_CustomerIDCheck on �Ȥ�
instead of insert
as
begin
	--�p�G�o�{PK�s�b�A�h����ƭק�A�_�h���s�W

	--�p�G�o�{PK�s�b
	declare @CID nchar(5)
	select @CID = �Ȥ�s�� from �Ȥ�
	where �Ȥ�s��=(select �Ȥ�s�� from inserted)

	if @CID !=''	--�p�G�o�{�Ȥ�s���s�b
	begin
		--�i���ƭק�
		update �Ȥ�
		set ���q�W��=inserted.���q�W��, 
			�s���H=inserted.�s���H,
			�s���H¾��=inserted.�s���H¾��,
			�a�}=inserted.�a�},
			�l���ϸ�=inserted.�l���ϸ�,
			�q��=inserted.�q��,
			�ǯu�q��=inserted.�ǯu�q��
		from �Ȥ� inner join inserted on �Ȥ�.�Ȥ�s��=inserted.�Ȥ�s��
	end
	else--�p�G�o�{�Ȥ�s�����s�b
	begin
		--�i���Ʒs�W
		insert into �Ȥ� 
		select * from inserted
	end
end

insert into �Ȥ�
values('AAAAA','�G�t��~�������q','BBB','CCC','DDD','122009','123456','')
