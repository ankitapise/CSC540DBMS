-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pay_dues`(
	IN patron_id varchar(50),
	IN amount int(3)
)
BEGIN
	SET @credit = (SELECT A.credit FROM Accounts A WHERE A.patron_id = patron_id);
	SET @dues = (SELECT A.due_balance FROM Accounts A WHERE A.patron_id = patron_id);
	SET @credit = @credit+amount;
	IF(@credit=@dues) THEN
		UPDATE Accounts A
		SET A.credit = @credit, A.last_cleared_date = CURDATE()
		WHERE A.patron_id = patron_id;
	else
		UPDATE Accounts A
		SET A.credit = @credit
		WHERE A.patron_id = patron_id;
	END IF;
END