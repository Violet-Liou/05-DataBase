--��Ʋέp
--�E�X���
--count()

--SELECT count(A.���u�s��) as ���u�H��
--FROM ���u A

--SELECT count(A.�e�f���) as �w�X�f�q��ƶq 
--FROM �q�f�D�� A


--�i�Ұ�m�ߡj�d�ߥX���X�f���q�榳�X��
--SELECT count(*)as ���X�f���q���
--FROM �q�f�D�� A
--WHE  is null


--SUM()
--SELECT SUM(A.�w�s�q) as �Ѿl���~���
--FROM ���~��� A

--SELECT *, A.���*A.�ƶq*(1-A.�馩)as �p�p
--FROM �q�f���� A

--SELECT A.�q�渹�X, SUM(A.���*A.�ƶq*(1-A.�馩))as �q�f�`���B  --�Ʀr�e�{"��ǫ׿�"
--FROM �q�f���� A
--GROUP BY A.�q�渹�X  

--avg()
SELECT avg(A.���) as �������
FROM ���~��� A

--max()
SELECT MAX(A.���) as �̰����
FROM ���~��� A


--min()
SELECT MIN(A.���) as �̧C���
FROM ���~��� A



SELECT SUM(A.���) as �`���, avg(A.���) as �������, MAX(A.���) as �̰����, MIN(A.���) as �̧C���, count(*)as �������
FROM ���~��� A