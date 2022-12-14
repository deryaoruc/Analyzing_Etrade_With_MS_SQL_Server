-- Order distribution by date

SELECT 
	DATEPART(YEAR,O.DATE_) AS YEAR,
	DATEPART(MONTH,O.DATE_) AS MONTH,
	CASE 
		WHEN DATEPART(MONTH,O.DATE_) = 1 THEN 'JENUARY'
		WHEN DATEPART(MONTH,O.DATE_) = 2 THEN 'FEBRUARY'
		WHEN DATEPART(MONTH,O.DATE_) = 3 THEN 'MARCH'
		WHEN DATEPART(MONTH,O.DATE_) = 4 THEN 'APRIL'
		WHEN DATEPART(MONTH,O.DATE_) = 5 THEN 'MAY'
		WHEN DATEPART(MONTH,O.DATE_) = 6 THEN 'JUNE'
		WHEN DATEPART(MONTH,O.DATE_) = 7 THEN 'JULY'
		WHEN DATEPART(MONTH,O.DATE_) = 8 THEN 'AUGUST'
		WHEN DATEPART(MONTH,O.DATE_) = 9 THEN 'SEPTEMBER'
		WHEN DATEPART(MONTH,O.DATE_) = 10 THEN 'OCTOBER'
		WHEN DATEPART(MONTH,O.DATE_) = 11 THEN 'NOVEMBER'
		WHEN DATEPART(MONTH,O.DATE_) = 12 THEN 'DECEMBER'
	END AS MONTHNAME_,
	SUM(OD.LINETOTAL) AS TOTALORDELINE,
	SUM(OD.AMOUNT) AS TOTALORDERAMOUNT,
	COUNT(OD.ID) AS TOTALNUMBEROFORDERS

FROM ORDERS O 
	INNER JOIN USERS U ON U.ID = O.USERID
	INNER JOIN ADDRESS A ON A.ID = O.ADDRESSID
	INNER JOIN CITIES CT ON CT.ID = A.CITYID
	INNER JOIN TOWNS T ON T.ID = A.TOWNID
	INNER JOIN DISTRICTS D ON D.ID = A.DISTRICTID
	INNER JOIN PAYMENTS P ON P.ORDERID = O.ID
	INNER JOIN INVOICES I ON I.ORDERID = O.ID
	INNER JOIN ORDERDETAILS OD ON OD.ORDERID = O.ID 
	INNER JOIN ITEMS ITM ON ITM.ID = OD.ITEMID

-- WHERE ITM.CATEGORY1='EV'

GROUP BY DATEPART(YEAR,O.DATE_), DATEPART(MONTH,O.DATE_)
ORDER BY DATEPART(MONTH,O.DATE_), DATEPART(YEAR,O.DATE_)
