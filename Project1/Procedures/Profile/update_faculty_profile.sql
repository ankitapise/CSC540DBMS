CREATE PROCEDURE `update_faculty_profile` (
	IN user_id varchar(20),
    IN password varchar(20),
    IN first_name varchar(45),
    IN last_name varchar(45),
    IN nationality varchar(45)
)
BEGIN
	SET @pid = (
		SELECT P.patron_id
        FROM Patrons P
        WHERE P.user_id = user_id
    );
    Update Patrons P
    SET P.password = COALESCE(password,P.password), 
		P.first_name = COALESCE(first_name,P.first_name),
        P.last_name = COALESCE(last_name,P.last_name),
		P.nationality = COALESCE(nationality, P.nationality)
	WHERE (P.patron_id = @pid) AND (CHAR_LENGTH(password) !=0) 
    AND (CHAR_LENGTH(first_name) != 0) AND (CHAR_LENGTH(last_name) != 0) 
    AND (CHAR_LENGTH(nationality) != 0);
END