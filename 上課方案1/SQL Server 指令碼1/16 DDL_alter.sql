--�ialter�j �ק��ƪ�w�q (���`�N�G�n�ק諸��ƪ����w�s�b�A�~�i�H�ϥ�alter�ק�)
--�bProduct��Ƥ��W�[�@��CateID
alter table [Product]
	add CateID nchar(2) not null

--�إ�Product��ƪ�PCategory��ƪ��������p
alter table [Product]
	add foreign key (CateID) references Category(CateID)

--�إ�OrderDatail��ƪ�PProduct��Ƥ�¶������p
alter table OrderDatail
	add foreign key (ProductID) references [Product](ProductID)



--���]�b�t�άI�@�������ݨD�ܧ�A�n�NMemberPoint���R��
---�o�ɸӥ�drop�٬Oalter
alter table [Member]
	drop column MemberPoint
--��o�Ӹ�ƪ��ܧ����ɡA�N�|�X�{�̩ۨʪ����~
--�b�̩ۨm�������e�A�L�k�R��MemberPoint

alter table [Member]
	drop constraint DF__Member__MemberPo__5BE2A6F2 

alter table [Member]
	drop column MemberPoint

