-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Cam_history`(
	IN patron_id varchar(50)
)
BEGIN
	SELECT * FROM Cam_checkout C
	WHERE C.patron_id = patron_id 
	AND DATE_FORMAT(C.due_date,'%Y-%m-%d') < CURDATE()
	AND C.return_date IS NULL AND TIMESTAMPDIFF(HOUR,C.due_date,C.return_date) >= 0;
END