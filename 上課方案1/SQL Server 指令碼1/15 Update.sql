--��s���
--update
--update �@���u���@�Ӹ�ƪ�
--���i�H�@����s1~N��

--UPDATE �f�B���q
--SET �q��='08-8888888', �f�B���q�W��='�v�t'
--WHERE �f�B���q�s��=5    -- WHRER����ܭ��n�A�p�G�S����WHERE����A�N�|�y���Ҧ�����Ƴ��Q��s���@�˪�


--UPDATE �Ȥ�
--SET �s���H¾��='�~�ȧU�z', �s���H='���p�^'
--WHERE �Ȥ�s��='KPPTR'


---------------------------------------------------------------------------------------------------------------

--��B�z�L100�i(�t)�H�W�q�檺���u�A�������[�W�u�Ծġv��r
--SELECT A.���u�s��, COUNT(*)
--FROM �q�f�D�� A
--GROUP BY A.���u�s��
--having COUNT(*)>=100

--UPDATE ���u
--SET ���� = ���� +',�Ծ�'
--WHERE ���u�s�� IN (SELECT A.���u�s��
--					FROM �q�f�D�� A
--					GROUP BY A.���u�s��
--					having COUNT(*)>=100 )


--��q���B�z�L�q�檺���u�A�������[�W�u���Ρv��r
--SELECT DISTINCT A.���u�s��
--FROM ���u A
--WHERE NOT EXISTS (SELECT * FROM �q�f�D�� B WHERE A.���u�s��=B.���u�s��)

--UPDATE ���u
--SET ���� = ���� +',����'
--WHERE ���u�s�� IN (SELECT DISTINCT A.���u�s��
--					FROM ���u A
--					WHERE NOT EXISTS (SELECT * FROM �q�f�D�� B WHERE A.���u�s��=B.���u�s��) )



--=========================================================================================================================================
--�o�ͦb�����p����ƪ�

--�s�W��Ʋ{�H
--EX�G�q�f���Ӹ�ƪ��s�W
INSERT INTO �q�f���� VALUES(10325 ,5 ,10 ,5 ,0)

--INSERT INTO �q�f���� VALUES(10325 ,500 ,10 ,5 ,0) --�������|�s�W���\ =>>�]���~�s���S��500

SELECT *
FROM �q�f����
WHERE �q�渹�X=10325

--�ק��Ʋ{�H =>>�ק���N�O�s�W�A�p�A�ƦX�D��W�J��䤤�@�D��ƭȿ�J���~�A�N�N�N��ƧR���A�s��Ʒs�W�i�h
UPDATE �q�f����
SET ���~�s��=50
WHERE �q�渹�X=10325 --�o�ˤ��|�ק令�\ =>�]�q�f���ӥΪ��O�ƦX�D��A��SQL�y�k�|���Ҧ�"�q�渹�X=10325"�����~�s�����令50�A�y���ƦX�D��Ȥ��A�O�ߤ@��

--


