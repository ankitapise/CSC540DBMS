CREATE PROCEDURE `reserved_book_checkout` (
	IN pub_id varchar(50),
    IN patron_id varchar(50),
    OUT reserved_book_checkout_status tinyint(2)
)
BEGIN
	SET @availability = (
		SELECT P.number_available
        FROM Publications P
        WHERE (P.pub_id = pub_id)
    );
    SET @reserved_student = (
		SELECT PU.pub_id
		FROM Publications PU
		WHERE (PU.pub_id = pub_id) AND PU.title IN (SELECT DISTINCT C.book_name
			  FROM Patrons P INNER JOIN Students S INNER JOIN Enrolled_in E INNER JOIN Courses C
			  WHERE (P.patron_id = patron_id) AND (P.patron_id = S.student_id)
			  AND (P.patron_id = E.student_id) AND (E.course_id = C.course_id))
    );
    SET @already_existing = (
        SELECT P.patron_id
        FROM Pub_checkout PC INNER JOIN Patrons P
        WHERE (P.patron_id = patron_id) AND (P.patron_id = PC.patron_id)
              AND (PC.pub_id = pub_id)
    );
    IF(@reserved_student IS NULL) THEN
		SET reserved_book_checkout_status = 3;
	ELSE
		BEGIN
            IF(@availability > 0) THEN
                IF(@already_existing IS NULL) THEN
				    BEGIN
					   INSERT INTO Pub_checkout 
                        VALUES (patron_id, pub_id, default, DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 4 HOUR),
                        'Not Returned');
                        UPDATE Publications P
                        SET P.number_available = P.number_available - 1
                        WHERE (P.pub_id = pub_id);
                        SET reserved_book_checkout_status = 1;
                    END;
                ELSE
				    SET reserved_book_checkout_status = 2;
                END IF;
            ELSE
                BEGIN
                    INSERT INTO Student_waitlist (student_id, pub_id) 
                    VALUES (patron_id,pub_id);
                    SET reserved_book_checkout_status = 0;
                END;
            END IF;
        END;
    END IF;
END