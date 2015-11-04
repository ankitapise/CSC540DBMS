-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `check_dues`(
	IN patron_id varchar(50)
)
BEGIN
	SELECT * FROM Accounts A
	WHERE A.patron_id = patron_id;
END