CREATE PROCEDURE `publication_renewal` (
	IN pub_id varchar(50),
    IN patron_id varchar(50),
    OUT renewal_status tinyint(2)
)
BEGIN
	SET @checkedOut = (
		SELECT P.patron_id
        FROM Pub_checkout P
        WHERE (P.patron_id = patron_id) AND (P.pub_id = pub_id)
    );
    SET @student_waitlisted = (
		SELECT S.student_id
        FROM Student_waitlist S
        WHERE (S.pub_id = pub_id)
    );
    SET @faculty_waitlisted = (
		SELECT F.faculty_id
        FROM Faculty_waitlist F
        WHERE (F.pub_id = pub_id)
    );
    SET @category = (
		SELECT P.category
        FROM Publications P
        WHERE (P.pub_id = pub_id)
    );
    SET @reserved = (
		SELECT B.reserved
        FROM Publications P INNER JOIN Books B
        WHERE (P.pub_id = pub_id) AND (B.ISBN = P.pub_id)
    );
    SET @student = (
		SELECT S.student_id
        FROM Students S
        WHERE (S.student_id = patron_id)
    );
    
    IF(@checkedOut IS NULL) THEN
		SET renewal_status = 2;
    ELSE
        IF((@student_waitlisted IS NULL) AND (@faculty_waitlisted IS NULL)) THEN
			BEGIN
                IF(@reserved = 1) THEN
					UPDATE Pub_checkout P
                    SET P.out_date = CURRENT_TIMESTAMP,
						P.due_date = DATE_ADD(P.out_date, INTERVAL 4 HOUR)
                    WHERE (P.patron_id = patron_id) AND (P.pub_id = pub_id);
				ELSE
					IF((@category = 'Journal') OR (@category = 'Conference Proceeding')) THEN
						UPDATE Pub_checkout P
						SET P.out_date = CURRENT_TIMESTAMP,
							P.due_date = DATE_ADD(P.out_date, INTERVAL 12 HOUR)
						WHERE (P.patron_id = patron_id) AND (P.pub_id = pub_id);
					ELSE
						IF(@student IS NULL) THEN
							UPDATE Pub_checkout P
							SET P.out_date = CURRENT_TIMESTAMP,
								P.due_date = DATE_ADD(P.out_date, INTERVAL 1 MONTH)
							WHERE (P.patron_id = patron_id) AND (P.pub_id = pub_id);
						ELSE
							UPDATE Pub_checkout P
							SET P.out_date = CURRENT_TIMESTAMP,
								P.due_date = DATE_ADD(P.out_date, INTERVAL 2 WEEK)
							WHERE (P.patron_id = patron_id) AND (P.pub_id = pub_id);
						END IF;
					END IF;
				END IF;
                SET renewal_status = 1;
			END;
		ELSE
			SET renewal_status = 0;
		END IF;
	END IF;
END