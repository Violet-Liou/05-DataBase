--order by���l�y offset
--

--SELECT * 
--FROM ���~��� A
--ORDER BY A.���~�s�� desc

--���ư��e10�������
--SELECT *
--FROM ���~��� A
--ORDER BY A.���~�s��
--offset 10 rows�@--�ư��e10��


--�����w������ => �ư��e10����A�����10�����
SELECT *
FROM ���~��� A
ORDER BY A.���~�s��
offset 10 rows
fetch next 10 rows only