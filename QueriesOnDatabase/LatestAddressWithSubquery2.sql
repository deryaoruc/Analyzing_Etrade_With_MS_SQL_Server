-- Finding the most recent address of a user

SELECT U.*,
(SELECT TOP 1 ADDRESSTEXT FROM ADDRESS WHERE USERID=U.ID ORDER BY ID DESC) LASTADRESS,
(SELECT TOP 1 ADDRESSTEXT FROM ADDRESS WHERE USERID=U.ID ORDER BY ID)FIRSTADRESS,
(SELECT COUNT(ADDRESSTEXT) FROM ADDRESS WHERE USERID=U.ID ) NUMBEROFADRESS
FROM USERS U