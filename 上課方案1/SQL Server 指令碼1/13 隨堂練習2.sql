--1. �иռg�@�X�֬d�ߡA�d�ߥX�q�ʤ�����b1996�~7��ë��w�e�f�覡���u�ֻ��v�����q�椧�q�f���Ӹ�ơA
--�æC�X �q�渹�X�B���~���O�W�١B���~�W�١B���~�q�ʳ���B���~�q�ʼƶq�B���~�����p�p�B�Ȥ�s���B�Ȥ�W�١B
--���f�H�W�r�B�q�ʤ���B�B�z�q����u���m�W�B�f�B���q�B�����ӦW�� ����ƶ��ءA
--�䤤���~�����p�p�ХH�|�ˤ��J�p��ܾ�Ʀ�C
--SELECT A.�q�渹�X, E.���O�W��, D.���~, B.���, B.�ƶq, ROUND((B.���*B.�ƶq),0)as ���~�����p�p, F.�Ȥ�s��, F.���q�W��, 
--		A.���f�H, A.�q����, G.�m�W, C.�f�B���q�W��, H.������
--FROM �q�f�D�� A
--INNER JOIN �q�f���� B ON A.�q�渹�X=B.�q�渹�X
--INNER JOIN �f�B���q C ON A.�e�f�覡=C.�f�B���q�s��
--INNER JOIN ���~��� D ON B.���~�s��=D.���~�s��
--INNER JOIN ���~���O E ON D.���O�s��=E.���O�s��
--INNER JOIN �Ȥ� F ON A.�Ȥ�s��=F.�Ȥ�s��
--INNER JOIN ���u G ON A.���u�s��=G.���u�s��
--INNER JOIN ������ H ON D.�����ӽs��=h.�����ӽs��
--WHERE C.�f�B���q�W��='�ֻ�' AND YEAR(A.�q����)='1996' AND MONTH(A.�q����)='7'



--2. �иռg�@�X�֬d�ߡA�d�߫Ȥ�u�s�s�Ȧ�v���~�өҭq�ʪ��Ҧ����~�A�òέp�X�U�ز��~���q�ʼƶq
--��X��߬��Ȥ�s���B���q�W�١B�p���H�B���~�W�١B�q�ʼƶq
--SELECT A.�Ȥ�s��, A.���q�W��, A.�s���H, D.���~, C.�ƶq
--FROM �Ȥ� A
--INNER JOIN �q�f�D�� B ON A.�Ȥ�s��=B.�Ȥ�s��
--INNER JOIN �q�f���� C ON B.�q�渹�X=C.�q�渹�X
--INNER JOIN ���~��� D ON C.���~�s��=D.���~�s��
--WHERE A.���q�W��='�s�s�Ȧ�'



--3. �ЧQ��exists�B��l�t�X�l�d�ߦ��A��X���ǫȤ�q���U�L�q��A�æC�X�Ȥ᪺�Ҧ����C
--(���i�Ψ�in�B��A�礣�i�ΦX�֬d�ߦ�) 
--SELECT *
--FROM �Ȥ� A
--WHERE NOT EXISTS (SELECT �Ȥ�s�� FROM �q�f�D�� B WHERE A.�Ȥ�s��=B.�Ȥ�s��)


--4. �ЧQ��in�B��l�t�X�l�d�ߦ��A�d�߭��ǭ��u���B�z�L�q��A�æC�X���u�����u�s���B�m�W�B¾�١B�����������X�B
--�������C(���i�Ψ�exists�B��A�礣�i�ΦX�֬d�ߦ�) 
SELECT A.���u�s��, A.�m�W, A.¾��, A.�����������X
FROM ���u A
WHERE A.���u�s�� IN(SELECT B.���u�s�� FROM �q�f�D�� B)
ORDER BY A.���u�s��



--5. �ЦX�֬d�߻P�l�d�ߨ�ؼg�k�A�C�X1998�~�שҦ��Q�q�ʹL�����~��ơA�æC�X���~���Ҧ����A�B�̲��~�s���Ѥp��j�ƧǡC
--(�g�X�֬d�߮ɤ��o�Υ���l�d�ߦ��A�g�l�d�߮ɤ��o�Υ���X�֬d�ߦ�)

--�X�֬d��
SELECT DISTINCT C.*
FROM �q�f�D�� A
INNER JOIN �q�f���� B ON A.�q�渹�X=B.�q�渹�X
INNER JOIN ���~��� C ON B.���~�s��=C.���~�s��
WHERE YEAR(A.�q����)='1998'
ORDER BY C.���~�s��, C.���~, C.�����ӽs��, C.���O�s��, C.���ƶq, C.���, C.�w�s�q, C.�w�q�ʶq, C.�w���s�q, C.���A�P��

--�l�d��
SELECT *
FROM ���~��� A
WHERE A.���~�s�� IN (
	SELECT B.���~�s�� FROM �q�f���� B 
	WHERE B.�q�渹�X IN (
		SELECT C.�q�渹�X FROM �q�f�D�� C
		WHERE YEAR(C.�q����)='1998'
	)
)
