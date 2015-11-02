CREATE PROCEDURE `checkout_e_copy` (
	IN pub_id varchar(50),
    IN patron_id varchar(50),
    OUT checkout_status tinyint(2)
)
BEGIN
    DECLARE already_existing INT;
    SET @availability = (
		SELECT P.e_copy 
        FROM Publications P
        WHERE (P.pub_id = pub_id)
    );
    SET @already_existing = (
		SELECT E.pub_id
        FROM E_copy_checkout E
        WHERE (E.pub_id = pub_id) AND (E.patron_id = patron_id)
    );
    IF(@availability >0) THEN
		IF(@already_existing IS NULL) THEN
			BEGIN
				INSERT INTO E_copy_checkout
				VALUES (pub_id, patron_id,default);
				SET checkout_status = 1;
			END;
		ELSE
			SET checkout_status = 2;
		END IF;
	ELSE
		SET checkout_status = 0;
	END IF;
END