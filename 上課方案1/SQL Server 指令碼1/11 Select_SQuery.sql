--�d�߼B�Ѥ��o����u�B�z�L���Ҧ��q����
--1. ���z�L���u��ƪ�A�Q�έ��u�m�W�d����u�s��
--SELECT * 
--FROM ���u A
--WHERE A.�m�W='�B�Ѥ�'

--2. �Τl�d�߼g�X
--SELECT * FROM �q�f�D�� A
--WHERE A.���u�s��=(SELECT A.���u�s�� 
--FROM ���u A
--WHERE A.�m�W='�B�Ѥ�')

--2.1 �ΦX�֬d�߼g�X
--SELECT *
--FROM �q�f�D�� A
--INNER JOIN ���u B on A.���u�s��=B.���u�s��
--WHERE B.�m�W='�B�Ѥ�'





--�d�ߤj�ث��x�_�o��Ȥ᪺�q����(�ΦX�֬d��)
--SELECT A.*
--FROM �q�f�D�� A
--INNER JOIN �Ȥ� B on A.�Ȥ�s��=B.�Ȥ�s��
--WHERE B.���q�W��='�j�ث��x�_'


-----------------------------------------------------------------------
--�Ьd�߭��ǰӫ~������j������ӫ~���������
--�l�d��
--SELECT A.*
--FROM ���~��� A
--WHERE A.���>(SELECT AVG(A.���) FROM ���~��� A)

--�X�֬d�� (�ۧڦX��)
--�ۧڦX�֪��g�k�i�@�w�n���O�W�j�A�N�s��쳣�n�t����W
--SELECT A.���~�s��, A.���~, A.���, AVG(B.���)as  average
--FROM ���~��� as A
--INNER JOIN ���~��� as B on A.���~�s��!=B.���~�s��  --�ت��O�G ���C�Ӳ��~ A ���t��@���Ҧ��䥦���~ B�A�Ψӭp��u��L���~����������v�C(�ư��ۤv�ӭp��u�۹�v���έp��T)
--GROUP BY A.���~�s��, A.���~, A.���
--having A.���>AVG(B.���)




--�i�Ұ�m�ߡj���ǫȤ�R�L�ަ�
--�D�d�߬O�Ȥ�
--�ߤ@�u���O�ަ�

--�Ρi�ƥ���C���j���R
--(1)�Ȥ�U�q��
--(2)�q��]�t�ӫ~
--(3)�ӫ~���ӫ~�W��
-- >>�z�L���~��Ƨ��ަ׽s��

--�X�֬d��
SELECT DISTINCT B.*,D.���~
FROM �q�f�D�� A
INNER JOIN �Ȥ� B ON A.�Ȥ�s��=B.�Ȥ�s��
INNER JOIN �q�f���� C ON A.�q�渹�X=C.�q�渹�X
INNER JOIN ���~��� D ON C.���~�s��=D.���~�s��
WHERE D.���~='�ަ�'

--�l�d��
SELECT *
FROM �Ȥ� A
WHERE A.�Ȥ�s�� in (
	SELECT DISTINCT A.�Ȥ�s�� FROM �q�f�D�� A
			WHERE A.�q�渹�X in (
				SELECT C.�q�渹�X FROM �q�f���� C 
				WHERE C.���~�s�� in (SELECT ���~�s�� FROM ���~��� WHERE ���~='�ަ�')
			)
)

-----------------------------------------------------------------------------------------------------
--���ǭ��u�B�z�L�Ȥ�W�٬��u���H�귽�v���q��
SELECT * FROM ���u
WHERE ���u�s�� IN (SELECT DISTINCT ���u�s�� FROM �q�f�D��
WHERE �Ȥ�s�� IN (SELECT �Ȥ�s�� FROM �Ȥ�
WHERE ���q�W��='���H�귽'))


-----------------------------------------------------------------------------------------------------
--�iexists �B��l�j(�򥻤W�u�Φb�l�d��)  >>�����Ӹ�ƶ��X��ƬO�_�ۤ��s�b
--�d�ߨ��ǫȤ�U�L�q��
SELECT * 
FROM �Ȥ� C
WHERE EXISTS (SELECT * FROM �q�f�D�� O )