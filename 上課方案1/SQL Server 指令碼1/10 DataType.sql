--��ƫ��A�P�ഫ
--CAST( data as type)
SELECT A.���O�s��, B.���O�W��, CAST(count(*) as varchar)+'��' as �ƶq
FROM ���~��� A
INNER JOIN ���~���O B ON A.���O�s��=B.���O�s��
GROUP BY A.���O�s��, B.���O�W��

SELECT * FROM ���~���

SELECT DISTINCT A.���O�s��
FROM ���~��� A


--��ƫ��A�ഫ�ή榡�����D
--convert(type , value, �榡�N�X)
SELECT iif(A.�e�f��� is null , '�|���X�f', CONVERT(varchar, A.�q����, 111))as �q����
FROM �q�f�D�� A

--�έp�C�Ѧ��X�i�q��
SELECT CONVERT(varchar, A.�q����, 111)as �q����, count(*)as �q��ƶq
FROM �q�f�D�� A
GROUP BY A.�q����


-----------------------------------------------------------------------------

--ISNULL()
select isnull(convert(varchar,�e�f���,111), '�|���X�f' )
from �q�f�D��

