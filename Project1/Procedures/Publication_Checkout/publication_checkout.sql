CREATE PROCEDURE `publication_checkout` (
	IN pub_id varchar(50),
    IN patron_id varchar(50),
    OUT checkout_status tinyint(2)
)
BEGIN
    SET @reserved_status = (
		SELECT B.reserved
        FROM Publications P INNER JOIN Books B
        WHERE (P.pub_id = pub_id) AND (P.pub_id = B.ISBN)
    );
    SET @category = (
		SELECT P.category
        FROM Publications P
        WHERE (P.pub_id = pub_id)
    );
	IF(@reserved_status = 1) THEN
		CALL reserved_book_checkout(pub_id, patron_id, checkout_status);
	ELSE
		BEGIN
			IF((@category = 'Journal') OR (@category = 'Conference Proceeding')) THEN
				CALL journal_and_conf_proc_checkout(pub_id, patron_id, checkout_status);
			ELSE
				CALL book_checkout(pub_id, patron_id, checkout_status);
			END IF;
		END;
	END IF;
END