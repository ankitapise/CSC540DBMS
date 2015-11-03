CREATE PROCEDURE `book_checkout` (
	IN pub_id varchar(50),
    IN patron_id varchar(50),
    OUT book_checkout_status tinyint(2)
)
BEGIN
	SET @student = (
		SELECT S.student_id
        FROM Students S
        WHERE (S.student_id = patron_id)
    );
    SET @availability = (
		SELECT P.number_available
        FROM Publications P
        WHERE (P.pub_id = pub_id)
    );
    SET @already_existing = (
        SELECT P.patron_id
        FROM Pub_checkout PC INNER JOIN Patrons P
        WHERE (P.patron_id = patron_id) AND (P.patron_id = PC.patron_id)
              AND (PC.pub_id = pub_id)
    );
    IF(@availability > 0) THEN
    	IF(@already_existing IS NULL) THEN
		    IF(@student IS NULL) THEN
				INSERT INTO Pub_checkout
				VALUES (patron_id, pub_id, default, DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 1 MONTH),
					   'Not Returned');
			ELSE 
				INSERT INTO Pub_checkout
				VALUES (patron_id, pub_id, default, DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 2 WEEK),
					   'Not Returned');
			END IF;
			UPDATE Publications P
		    SET P.number_available = P.number_available - 1
		    WHERE (P.pub_id = pub_id);
		    SET book_checkout_status = 1;
		ELSE
			SET book_checkout_status = 2;
		END IF;
	ELSE
		IF(@student IS NULL) THEN
			INSERT INTO Faculty_waitlist (faculty_id, pub_id) 
			VALUES (patron_id,pub_id);
		ELSE
			INSERT INTO Student_waitlist (student_id, pub_id) 
			VALUES (patron_id,pub_id);
		END IF;
        SET book_checkout_status = 0;
	END IF;
END