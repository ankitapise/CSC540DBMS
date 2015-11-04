-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `overdue_checkout`(
	IN patron_id varchar(50)
)
BEGIN
	SET @days1 = (SELECT SUM(CASE WHEN DAYS>0 THEN DAYS ELSE 0 END) FROM (SELECT TIMESTAMPDIFF(HOUR,C.due_date,C.return_date) AS DAYS FROM Cam_checkout C
	WHERE C.patron_id = patron_id 
	AND DATE_FORMAT(C.due_date,'%Y-%m-%d') < CURDATE()
	AND C.return_date IS NOT NULL) as temp);

	SET @days2 = (SELECT SUM(CASE WHEN DAYS>0 THEN DAYS ELSE 0 END) FROM (SELECT TIMESTAMPDIFF(HOUR,C.due_date,CURRENT_TIMESTAMP) AS DAYS FROM Cam_checkout C
	WHERE C.patron_id = patron_id 
	AND DATE_FORMAT(C.due_date,'%Y-%m-%d') < CURDATE()
	AND C.return_date IS NULL) as temp);

	SET @days3 = (SELECT SUM(CASE WHEN DAYS>0 THEN DAYS ELSE 0 END) FROM (SELECT TIMESTAMPDIFF(DAY,C.due_date,C.return_date) AS DAYS FROM Pub_checkout C
	WHERE C.patron_id = patron_id 
	AND DATE_FORMAT(C.due_date,'%Y-%m-%d') < CURDATE()
	AND C.return_date IS NOT NULL) as temp);

	SET @days4 = (SELECT SUM(CASE WHEN DAYS>0 THEN DAYS ELSE 0 END) FROM (SELECT TIMESTAMPDIFF(DAY,C.due_date,CURRENT_TIMESTAMP) AS DAYS FROM Pub_checkout C
	WHERE C.patron_id = patron_id 
	AND DATE_FORMAT(C.due_date,'%Y-%m-%d') < CURDATE()
	AND C.return_date IS NULL) as temp);

	SET @fine = (@days1+@days2)*1 + (@days3+@days4)*2;
	SET @date_cleared = (Select last_cleared_date from Accounts A where A.patron_id = patron_id); 
	if(@date_cleared IS NULL) THEN
		UPDATE Accounts A
		SET A.due_balance=fine, A.last_cleared_date=CURDATE()
		WHERE A.patron_id = patron_id;
	else
		UPDATE Accounts A
		SET A.due_balance=fine
		WHERE A.patron_id = patron_id;
	END IF;
END