--SELECT �l�y
--group by

--�q���`�B
--SELECT A.�q�渹�X, round(SUM(A.���*A.�ƶq*(1-A.�馩)),2)as �q���`�B
--FROM �q�f���� A
--GROUP BY A.�q�渹�X

--�C�X�q���`�B�̰����e�Q�����
--SELECT TOP 10 with ties A.�q�渹�X, round(SUM(A.���*A.�ƶq*(1-A.�馩)),2)as �q���`�B
--FROM �q�f���� A
--GROUP BY A.�q�渹�X
--ORDER BY �q���`�B DESC

--�i�Ұ�m��1�j�C�@��Ȥ�U�榸��
--SELECT A.�Ȥ�s��, B.�s���H ,count(A.�Ȥ�s��)as �U�榸��
--FROM �q�f�D�� A
--INNER JOIN �Ȥ� B ON A.�Ȥ�s��=B.�Ȥ�s��
--GROUP BY A.�Ȥ�s��, B.�s���H

--�i�Ұ�m��2�j���ǫȤ�U��W�L10��
--SELECT *
--FROM(
--	SELECT A.�Ȥ�s��, B.�s���H ,count(A.�Ȥ�s��)as �U�榸��
--	FROM �q�f�D�� A
--	INNER JOIN �Ȥ� B ON A.�Ȥ�s��=B.�Ȥ�s��
--	GROUP BY A.�Ȥ�s��, B.�s���H
--)Z
--WHERE Z.�U�榸��>10 


--SELECT A.�Ȥ�s��, B.�s���H ,count(A.�Ȥ�s��)as �U�榸��
--FROM �q�f�D�� A
--INNER JOIN �Ȥ� B ON A.�Ȥ�s��=B.�Ȥ�s��
--GROUP BY A.�Ȥ�s��, B.�s���H
--having count(*)>10


--�έp�C�@����u�B�z�q�檺����
--SELECT A.���u�s��, count(*)as �B�z�q�檺����
--FROM �q�f�D�� A
--GROUP BY A.���u�s��
--ORDER BY �B�z�q�檺���� DESC

--�i�Ұ�m��3�j��X�e10�W���P������ӫ~(��~�B)
SELECT TOP 10 with ties A.���~�s��, B.���~, count(*)as �P�⦸�� , round(SUM(A.���*A.�ƶq),2)as ��~�B
FROM �q�f���� A
INNER JOIN ���~��� B ON A.���~�s��=B.���~�s��
GROUP BY A.���~�s��, B.���~
ORDER BY ��~�B DESC
