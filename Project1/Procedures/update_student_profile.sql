CREATE PROCEDURE `update_student_profile` (
	IN user_id varchar(20),
    IN password varchar(20),
    IN first_name varchar(45),
    IN last_name varchar(45),
    IN nationality varchar(45),
    IN phone_no char(20),
    IN alternate_phone char(20),
    IN DOB date,
    IN sex enum('Male','Female'),
    IN address_line1 varchar(100),
    IN address_line2 varchar(100),
    IN city varchar(30),
    IN postal_code int(11)
)
BEGIN
	SET @pid = (
		SELECT P.patron_id
        FROM Patrons P
        WHERE P.user_id = user_id
    );
    Update Patrons P, Student_Addresses SA
    SET P.password = password, P.first_name = first_name, P.last_name = last_name,
		P.nationality = nationality, P.phone_no = phone_no, P.alternate_phone = alternate_phone,
        P.DOB = DOB, P.sex = sex, SA.address_line1 = address_line1, SA.address_line2 = address_line2,
        SA.city = city, SA.postal_code = postal_code
	WHERE (P.patron_id = @pid) AND (SA.student_id = @pid);
END