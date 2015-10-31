INSERT INTO `LibraryDb`.`Publications` VALUES ('B1','Introduction to Chemistry',2005,'Book',1);
INSERT INTO `LibraryDb`.`Publications` VALUES ('B2','Introduction to Organic Chemistry',2006,'Book',1);
INSERT INTO `LibraryDb`.`Publications` VALUES ('B3','Introduction to Physical Chemistry',2000,'Book',0);
INSERT INTO `LibraryDb`.`Publications` VALUES ('B4','Introduction to Inorganic Chemistry',2005,'Book',0);
INSERT INTO `LibraryDb`.`Publications` VALUES ('J1','Journal of Web Semantic',2010,'Journal',NULL);
INSERT INTO `LibraryDb`.`Publications` VALUES ('J2','International Journal on Semantic Web and Information',2011,'Journal',NULL);
INSERT INTO `LibraryDb`.`Publications` VALUES ('C1','Optimization Techniques for Large Scale Graph Analytics on Map Reduce',2013,'Conference Proceeding',NULL);
INSERT INTO `LibraryDb`.`Publications` VALUES ('C2','An agglomerative query model for discovery in linked data: semantics and approach',2014,'Conference Proceeding',NULL);

INSERT INTO `LibraryDb`.`Books` VALUES ('B1','Pub1','1',1);
INSERT INTO `LibraryDb`.`Books` VALUES ('B2','Pub2','2',0);
INSERT INTO `LibraryDb`.`Books` VALUES ('B3','Pub3','3',1);
INSERT INTO `LibraryDb`.`Books` VALUES ('B4','Pub4','4',0);

INSERT INTO `LibraryDb`.`Journals` VALUES ('J1');
INSERT INTO `LibraryDb`.`Journals` VALUES ('J2');

INSERT INTO `LibraryDb`.`Conference_Proceedings` VALUES ('C1','WWW');
INSERT INTO `LibraryDb`.`Conference_Proceedings` VALUES ('C2','SIGMOD');

INSERT INTO `LibraryDb`.`Authors` VALUES ('SK Goyal');
INSERT INTO `LibraryDb`.`Authors` VALUES ('HC Verma');
INSERT INTO `LibraryDb`.`Authors` VALUES ('Resnick Halliday Walker');
INSERT INTO `LibraryDb`.`Authors` VALUES ('RC Mukherjee');
INSERT INTO `LibraryDb`.`Authors` VALUES ('Roberto Navigli');
INSERT INTO `LibraryDb`.`Authors` VALUES ('Tim Berners Lee');
INSERT INTO `LibraryDb`.`Authors` VALUES ('HyeongSik Kim');
INSERT INTO `LibraryDb`.`Authors` VALUES ('Sidan Gao');

INSERT INTO `LibraryDb`.`Pub_Authors` VALUES ('B1','SK Goyal');
INSERT INTO `LibraryDb`.`Pub_Authors` VALUES ('B2','HC Verma');
INSERT INTO `LibraryDb`.`Pub_Authors` VALUES ('B3','Resnick Halliday Walker');
INSERT INTO `LibraryDb`.`Pub_Authors` VALUES ('B4','RC Mukherjee');
INSERT INTO `LibraryDb`.`Pub_Authors` VALUES ('J1','Roberto Navigli');
INSERT INTO `LibraryDb`.`Pub_Authors` VALUES ('J2','Tim Berners Lee');
INSERT INTO `LibraryDb`.`Pub_Authors` VALUES ('C1','HyeongSik Kim');
INSERT INTO `LibraryDb`.`Pub_Authors` VALUES ('C2','Sidan Gao');

INSERT INTO `Libraries` VALUES (1,"D. H. Hill");
INSERT INTO `Libraries` VALUES (2,"J. B. Hunt");

INSERT INTO `Library_Publications` VALUES ('B1',1,2);
INSERT INTO `Library_Publications` VALUES ('B1',2,2);
INSERT INTO `Library_Publications` VALUES ('B2',1,2);
INSERT INTO `Library_Publications` VALUES ('B2',2,2);
INSERT INTO `Library_Publications` VALUES ('B3',1,2);
INSERT INTO `Library_Publications` VALUES ('B3',2,2);
INSERT INTO `Library_Publications` VALUES ('B4',1,2);
INSERT INTO `Library_Publications` VALUES ('B4',2,2);
INSERT INTO `Library_Publications` VALUES ('J1',1,1);
INSERT INTO `Library_Publications` VALUES ('J1',2,1);
INSERT INTO `Library_Publications` VALUES ('J2',1,1);
INSERT INTO `Library_Publications` VALUES ('J2',2,1);
INSERT INTO `Library_Publications` VALUES ('C1',1,1);
INSERT INTO `Library_Publications` VALUES ('C1',2,1);
INSERT INTO `Library_Publications` VALUES ('C2',1,1);
INSERT INTO `Library_Publications` VALUES ('C2',2,1);

INSERT INTO `Pub_checkout` VALUES ('S1','B2','2015-11-01','2015-11-08','Available');
INSERT INTO `Pub_checkout` VALUES ('S4','B4','2015-11-01','2015-11-06','Available');
INSERT INTO `Pub_checkout` VALUES ('S2','B2','2015-07-01','2015-08-08','Available');
INSERT INTO `Pub_checkout` VALUES ('S3','B2','2015-10-01','2015-10-10','Available');

INSERT INTO `Library_Rooms` VALUES (2,'R1',3,'Conference',2,'Available');
INSERT INTO `Library_Rooms` VALUES (2,'R2',3,'Study',3,'Available');
INSERT INTO `Library_Rooms` VALUES (1,'R3',2,'Study',4,'Available');
INSERT INTO `Library_Rooms` VALUES (2,'R4',3,'Conference',3,'Available');
INSERT INTO `Library_Rooms` VALUES (2,'R5',3,'Study',4,'Available');
INSERT INTO `Library_Rooms` VALUES (1,'R6',3,'Study',4,'Available');
INSERT INTO `Library_Rooms` VALUES (2,'R7',2,'Study',2,'Available');

INSERT INTO `Room_Reservations` VALUES ('F1',1,'R3','2015-10-10','09:00:00','11:30:00');
INSERT INTO `Room_Reservations` VALUES ('S1',2,'R5','2015-10-12','15:00:00','17:00:00');
INSERT INTO `Room_Reservations` VALUES ('F4',1,'R6','2015-10-15','11:00:00','13:30:00');
INSERT INTO `Room_Reservations` VALUES ('F2',2,'R1','2015-10-20','09:00:00','10:30:00');
delimiter //
Create TRIGGER Insert_Faculty AFTER Insert on LibraryDb.Patrons FOR EACH ROW IF NEW.category LIKE "%Professor%" THEN Insert Into Faculty Values (new.patron_id); END IF;//
delimiter ;


INSERT INTO Patrons VALUES ("S1","jpink","jpink","Jesse","Pinkman","American","123456789","123456787","1988-10-03","Chemistry","First Year","Male");
INSERT INTO Patrons VALUES ("S2","wjr","wjr","Walt","Jr.","American","123456780","123456781","1988-11-03","Chemistry","Second Year","Male");
INSERT INTO Patrons VALUES ("S3","gboet","gboet","Gale","Boetticher","Chile","123456782","123456783","1988-12-03","Chemistry","Third Year","Male");
INSERT INTO Patrons VALUES ("S4","sgood","sgood","Saul","Goodman","American","123456784","123456785","1988-01-03","Chemistry","Second Year","Male");
INSERT INTO Patrons VALUES ("F1","wwhite","wwhite","Walter","White","American",NULL,NULL,NULL,"Chemistry","Professor",NULL);
INSERT INTO Patrons VALUES ("F2","gfring","gfring","Gustavo","Fring","American",NULL,NULL,NULL,"Chemistry","Assistant Professor",NULL);
INSERT INTO Patrons VALUES ("F3","hschrad","hschrad","Hank","Schrader","American",NULL,NULL,NULL,"Chemistry","Associate Professor",NULL);
INSERT INTO Patrons VALUES ("F4","swhite","swhite","Skyler","White","American",NULL,NULL,NULL,"Chemistry","Professor",NULL);

INSERT INTO Students VALUES ("S1","BS","Undergraduate");
INSERT INTO Students VALUES ("S2","BS","Undergraduate");
INSERT INTO Students VALUES ("S3","BS","Undergraduate");
INSERT INTO Students VALUES ("S4","MS","Graduate");

INSERT INTO Patron_Addresses VALUES ("S1","1511 Graduate Lane","NC",27606,"Raleigh");
INSERT INTO Patron_Addresses VALUES ("S2","1512 Graduate Lane","NC",27606,"Raleigh");
INSERT INTO Patron_Addresses VALUES ("S3","1513 Graduate Lane","NC",27606,"Raleigh");
INSERT INTO Patron_Addresses VALUES ("S4","1514 Graduate Lane","NC",27606,"Raleigh");

INSERT INTO Courses VALUES ("CH101","F1","Introduction to Chemistry");
INSERT INTO Courses VALUES ("CH102","F2","Introduction to Organic Chemistry");
INSERT INTO Courses VALUES ("CH103","F3","Introduction to Physical Chemistry");
INSERT INTO Courses VALUES ("CH104","F4","Introduction to Inorganic Chemistry");

INSERT INTO Enrolled_in VALUES ("S1","CH101");
INSERT INTO Enrolled_in VALUES ("S2","CH101");
INSERT INTO Enrolled_in VALUES ("S3","CH101");
INSERT INTO Enrolled_in VALUES ("S2","CH102");
INSERT INTO Enrolled_in VALUES ("S3","CH102");
INSERT INTO Enrolled_in VALUES ("S4","CH102");
INSERT INTO Enrolled_in VALUES ("S3","CH103");
INSERT INTO Enrolled_in VALUES ("S4","CH103");
INSERT INTO Enrolled_in VALUES ("S1","CH103");
INSERT INTO Enrolled_in VALUES ("S1","CH104");
INSERT INTO Enrolled_in VALUES ("S2","CH104");
INSERT INTO Enrolled_in VALUES ("S4","CH104");

INSERT INTO Teaches VALUES ("F1","CH101");
INSERT INTO Teaches VALUES ("F2","CH102");
INSERT INTO Teaches VALUES ("F3","CH103");
INSERT INTO Teaches VALUES ("F4","CH104");

INSERT INTO Cameras VALUES ("CA1","Olympus","E-620","16G","14­42mm lens 1:3.5­5.6");
INSERT INTO Cameras VALUES ("CA2","Canon","EOS Rebel T4i","32G","18­135mm EF­S IS STM Lens");
INSERT INTO Cameras VALUES ("CA3","Canon","EOS Rebel T4i","32G","18­135mm EF­S IS STM Lens");

INSERT INTO Library_Cameras VALUES ("CA1",2,"Available");
INSERT INTO Library_Cameras VALUES ("CA2",2,"Available");
INSERT INTO Library_Cameras VALUES ("CA3",2,"Checked Out");

INSERT INTO Cam_checkout VALUES ("S3","CA2","2015-10-30","2015-11-05");
INSERT INTO Cam_checkout VALUES ("S1","CA1","2015-11-06","2015-11-12");
INSERT INTO Cam_checkout VALUES ("S2","CA3","2015-10-16","2015-10-22");