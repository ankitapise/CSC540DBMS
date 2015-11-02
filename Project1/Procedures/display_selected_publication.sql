CREATE PROCEDURE `display_selected_publication` (
	IN pub_id varchar(50)
)
BEGIN
	SET @category = (
		SELECT P.category
        FROM Publications P
        WHERE P.pub_id = pub_id
    );
	IF @category = 'Book' THEN
		SELECT B.ISBN, P.title, B.edition, PA.author_name, P.pub_year, B.publisher
        FROM Publications P INNER JOIN Books B INNER JOIN Pub_Authors PA
        WHERE (P.pub_id = pub_id) AND (P.pub_id = B.ISBN) AND (P.pub_id = PA.pub_id);
	ELSEIF @category = 'Conference Proceeding' THEN
		SELECT C.conf_num, P.title, C.conf_name, PA.author_name, P.pub_year
        FROM Publications P INNER JOIN Conference_Proceedings C INNER JOIN Pub_Authors PA
        WHERE (P.pub_id = pub_id) AND (P.pub_id = C.conf_num) AND (P.pub_id = PA.pub_id);
	ELSEIF @category = 'Journal' THEN
		SELECT J.ISSN, P.title, PA.author_name, P.pub_year
        FROM Publications P INNER JOIN Journals J INNER JOIN Pub_Authors PA
        WHERE (P.pub_id = pub_id) AND (P.pub_id = J.ISSN) AND (P.pub_id = PA.pub_id);
	END IF;
END