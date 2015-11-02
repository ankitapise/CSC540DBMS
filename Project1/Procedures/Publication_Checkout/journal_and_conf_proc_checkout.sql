CREATE PROCEDURE `journal_and_conf_proc_checkout` (
	IN pub_id varchar(50),
    IN patron_id varchar(50)
)
BEGIN
	INSERT INTO Pub_checkout
    VALUES (patron_id, pub_id, default, DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 12 HOUR),
			'Not Returned');
	UPDATE Publications P
    SET P.number_available = P.number_available - 1
    WHERE (P.pub_id = pub_id);
END