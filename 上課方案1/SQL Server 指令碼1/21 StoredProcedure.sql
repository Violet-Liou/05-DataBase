--�w�s�{�� Stored Procedure
--�N�q�G�w���g�n���@�q�{���A���ݭn�ɦA���楦�A�D�`�������
--��Ƴq�`�Φb�n���o�@�Ӧ^�ǭȡA�w�s�{�ǳq�`�u�O����@�q�{��
--�@��O�Φb��ƾާ@�A�b�ާ@��Ʀs�J�~�h

create procedure getOrderListWithOtherData
as
begin

SELECT          �q�f�D��.�q�渹�X, �Ȥ�.���q�W�� AS �Ȥ�W��, ���~���.���~ AS �~�W, �q�f����.���, �q�f����.�ƶq, 
                            �q�f����.�馩, ���~���O.���O�W��, �q�f�D��.�q����, �q�f�D��.�n�f���, �q�f�D��.�e�f���, ���u.�m�W
							, �q�f����.���*�q�f����.�ƶq*(1-�q�f����.�馩) as �p�p
FROM              �q�f�D�� INNER JOIN
                            �Ȥ� ON �q�f�D��.�Ȥ�s�� = �Ȥ�.�Ȥ�s�� INNER JOIN
                            �q�f���� ON �q�f�D��.�q�渹�X = �q�f����.�q�渹�X INNER JOIN
                            ���u ON �q�f�D��.���u�s�� = ���u.���u�s�� INNER JOIN
                            ���~��� ON �q�f����.���~�s�� = ���~���.���~�s�� INNER JOIN
                            ���~���O ON ���~���.���O�s�� = ���~���O.���O�s�� 
end
------------
--����w�x�{��
execute getOrderListWithOtherData
exec  getOrderListWithOtherData


--===================================================================================================================================================
--�i�ǤJ�Ѽƪ��w�s�{��
--�ǤJ�q�渹�X,�Y�i�d�߸ӭq����
create procedure getOrderListWithOtherDataByOrderID
--�i²�g�� create proc getOrderListWithOtherDataByOrderID
	@oid char(5)
as
begin

SELECT          �q�f�D��.�q�渹�X, �Ȥ�.���q�W�� AS �Ȥ�W��, ���~���.���~ AS �~�W, �q�f����.���, �q�f����.�ƶq, 
                            �q�f����.�馩, ���~���O.���O�W��, �q�f�D��.�q����, �q�f�D��.�n�f���, �q�f�D��.�e�f���, ���u.�m�W
							, �q�f����.���*�q�f����.�ƶq*(1-�q�f����.�馩) as �p�p
FROM              �q�f�D�� INNER JOIN
                            �Ȥ� ON �q�f�D��.�Ȥ�s�� = �Ȥ�.�Ȥ�s�� INNER JOIN
                            �q�f���� ON �q�f�D��.�q�渹�X = �q�f����.�q�渹�X INNER JOIN
                            ���u ON �q�f�D��.���u�s�� = ���u.���u�s�� INNER JOIN
                            ���~��� ON �q�f����.���~�s�� = ���~���.���~�s�� INNER JOIN
                            ���~���O ON ���~���.���O�s�� = ���~���O.���O�s�� 
							where �q�f�D��.�q�渹�X=@oid
end
-------------------
exec getOrderListWithOtherDataByOrderID 10284

--==================================================================================================================================================

