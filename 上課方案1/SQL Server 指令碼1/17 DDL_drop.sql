--drop

drop table [Member]
--�{�b�o�˵L�k�����R����ƪ� =>�]�Ӹ�ƪ��Q���p

--1. ����Member�POrder���������p(�R��Order��ƪ�W��F.K �������)
alter table [Order]
	drop constraint FK__Order__MemberID__412EB0B6

--2. �R��[Member]��Ʈw
drop table [Member]

--===============================================================================================================
--�R����Ӹ�Ʈw
drop database GoodStore