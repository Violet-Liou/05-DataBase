create view view_allData
as
SELECT A.���~�s��, A.���~, A.���, AVG(B.���)as  average
FROM ���~��� as A
INNER JOIN ���~��� as B on A.���~�s��!=B.���~�s��  --�ت��O�G ���C�Ӳ��~ A ���t��@���Ҧ��䥦���~ B�A�Ψӭp��u��L���~����������v�C(�ư��ۤv�ӭp��u�۹�v���έp��T)
GROUP BY A.���~�s��, A.���~, A.���