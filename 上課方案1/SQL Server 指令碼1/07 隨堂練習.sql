--�i�H��m�ߡj

--�b�i���u�j��ƪ���X�Ҧ��k���u����ưO���C
--SELECT *
--FROM ���u A
--WHERE A.�٩I='�p�j'

--�b�i���u�j��ƪ���X�Ҧ��b1968�~(�t)�H��X�ͪ���ưO���C
--SELECT *
--FROM ���u A
--WHERE year(A.�X�ͤ��)>='1968'

--�b�i�q�f�D�ɡj��ƪ��X�e�f���������x�_���ΰ���������ưO���C
SELECT *
FROM �q�f�D�� A
WHERE A.�e�f�a�} like '%[�x�O]%�_%��%'  or A.�e�f�a�} like '%��%��%��%'

--�b�i���~��ơj��ƪ���X�w�s�q�̦h���e6�W��ưO���C
SELECT TOP 6 with ties *
FROM ���~��� A
ORDER BY A.�w�s�q DESC

--�b�i�q�f���ӡj��ƪ��X�q�渹�X10847�@�]�t���ǲ��~�C
SELECT A.�q�渹�X, A.���~�s��, B.���~
FROM �q�f���� A
INNER JOIN ���~��� B ON A.���~�s��=B.���~�s��
WHERE A.�q�渹�X='10847'

--�b�i�q�f���ӡj��ƪ��X�q�椤�]�t�W�L5�ز��~����ưO���C
--SELECT A.�q�渹�X, count(A.���~�s��)as ���~�����ƶq
--FROM �q�f���� A
--GROUP BY A.�q�渹�X
--having count(A.���~�s��)>=5
--ORDER BY ���~�����ƶq DESC

--�p��i���~��ơj��ƪ����O����2�����~��ƥ�������C 
--SELECT A.���O�s��, AVG(A.���)as �������
--FROM ���~��� A
--WHERE A.���O�s��=2
--GROUP BY A.���O�s��

--�b�i���~��ơj��ƪ���X�w�s�q�p��w���s�q�A�B�|���i����ʪ����~��ưO���C
--SELECT *
--FROM ���~��� A
--WHERE A.�w�s�q<A.�w���s�q and A.�w�q�ʶq=0

--�b�i�Ȥ�j��ƪ���X���q�W�٥]�t�u�t�v�B�u�͡v�B�u���v�B�u�ѡv�B�u���v�B�u���v�B�u���v�B�u�~�v�B�u�ߡv���r����ưO���C
SELECT *
FROM �Ȥ� A
WHERE A.���q�W�� like '%[�t�ͱ��Ѥ������~��]%'

--�b�A����ƪ���X�q�ʲ��~�ƶq����20~30�󪺸�ưO���C
SELECT A.�q�渹�X, SUM(A.�ƶq)as �q�沣�~�ƶq
FROM �q�f���� A
GROUP BY A.�q�渹�X
having SUM(A.�ƶq)>=20 and SUM(A.�ƶq)<=30

--�b�i�q�f�D�ɡj��ƪ���X�|�����e�f������O����ơC
--SELECT *
--FROM �q�f�D�� A
--WHERE A.�e�f��� is null

--�b�i�q�f���ӡj��ƪ���ܥX�q�渹�X10263�Ҧ����~������p�p�C
SELECT *, round(A.���*A.�ƶq*(1-A.�馩),2)as �p�p
FROM �q�f���� A
WHERE A.�q�渹�X='10263'

--�Q�Ρi���~��ơj��ƪ��ơA�έp�X�C�@�Ө����ӦU���ѤF�X�˲��~�C
SELECT A.�����ӽs��, B.������, count(A.���~)as ���~�˼�
FROM ���~��� A
INNER JOIN ������ B ON A.�����ӽs��=B.�����ӽs��
GROUP BY A.�����ӽs��, B.������

--�Q�Ρi�q�f�D�ɡj��ƪ��ơA�έp�X�C�@��Ȥ�Q�C�@����u�ҪA�Ȧ��ơC
SELECT A.�Ȥ�s��, A.���u�s��, count(*)as �A�Ȧ���
FROM �q�f�D�� A
GROUP BY A.�Ȥ�s��, A.���u�s��
ORDER BY A.�Ȥ�s��

--�Q�Ρi�q�f���ӡj��ƪ��ơA�έp�X�U���ӫ~����������P�����P��ƶq�A�öȦC�X�����P��ƶq�j��10����ơA�B�N��ƨ̲��~�s���Ѥp��j�ƧǡC
SELECT A.���~�s��, round(AVG(A.���),2)as �������, AVG(A.�ƶq)as �����P��ƶq
FROM �q�f���� A
GROUP BY A.���~�s��
having  AVG(A.�ƶq)>10
ORDER BY A.���~�s��

