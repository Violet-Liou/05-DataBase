--SELECT *
--FROM �q�f�D�� A
--INNER JOIN �q�f���� B ON A.�q�渹�X=B.�q�渹�X
--INNER JOIN �Ȥ� C ON A.�Ȥ�s��=c.�Ȥ�s��
--INNER JOIN ���u D ON A.���u�s��=D.���u�s��
--INNER JOIN ���~��� E ON B.���~�s��=E.���~�s��
--INNER JOIN ���~���O F ON E.���O�s��=F.���O�s��
--INNER JOIN ������ G ON E.�����ӽs��=G.�����ӽs��
--INNER JOIN �f�B���q H ON A.�e�f�覡=H.�f�B���q�s��

--inner join ���ĤG�ؼg�k
SELECT *
FROM �f�B���q H INNER JOIN
(������ G INNER JOIN 
(���~���O F INNER JOIN
(���u E INNER JOIN(
�Ȥ� D INNER JOIN 
(���~��� C INNER JOIN 
(�q�f���� A INNER JOIN �q�f�D�� B 
ON A.�q�渹�X=B.�q�渹�X)
ON A.���~�s��=C.���~�s��)
ON B.�Ȥ�s��=D.�Ȥ�s��)
ON B.���u�s��=E.���u�s��)
ON C.���O�s��=F.���O�s��)
ON C.�����ӽs��=G.�����ӽs��)
ON B.�e�f�覡=H.�f�B���q�s��


---------------------------------
--inner join �ĤT�ؼg�k
--�۵M�X�֪k�B���t�X�֪k
SELECT *
FROM �f�B���q H ,������ G ,���~���O F ,���u E ,�Ȥ� D ,���~��� C ,�q�f���� A ,�q�f�D�� B
WHERE A.�q�渹�X=B.�q�渹�X
and A.���~�s��=C.���~�s��
and B.�Ȥ�s��=D.�Ȥ�s��
and B.���u�s��=E.���u�s��
and C.���O�s��=F.���O�s��
and C.�����ӽs��=G.�����ӽs��
and B.�e�f�覡=H.�f�B���q�s��