/* ======= POPULATE TABLES w DATA =======
     Database and SQL Course, Item #27     */


--USE db_library

CREATE TABLE tbl_publisher (
	name VARCHAR(75) PRIMARY KEY NOT NULL,
	address VARCHAR(150) NOT NULL,
	phone VARCHAR(12) NOT NULL
);

CREATE TABLE tbl_book (
	book_id SMALLINT PRIMARY KEY NOT NULL IDENTITY (1,1),
	title VARCHAR(100) NOT NULL,
	publisher_name VARCHAR(75) NOT NULL FOREIGN KEY REFERENCES tbl_publisher(name) ON UPDATE CASCADE ON DELETE CASCADE,
);

CREATE TABLE tbl_author (
	book_id SMALLINT PRIMARY KEY NOT NULL FOREIGN KEY REFERENCES tbl_book(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	author VARCHAR(75) NOT NULL,
);

CREATE TABLE tbl_library_branch (
	branch_id CHAR(3) PRIMARY KEY NOT NULL,
	branch_name VARCHAR(75) NOT NULL,
	address VARCHAR(150) NOT NULL,
);

CREATE TABLE tbl_borrower (
	card_no BIGINT NOT NULL PRIMARY KEY IDENTITY (21168000001000, 1),
	name VARCHAR(75) NOT NULL,
	address VARCHAR(150) NOT NULL,
	phone VARCHAR(12) NOT NULL
);

CREATE TABLE tbl_book_copy (
	book_id SMALLINT PRIMARY KEY NOT NULL FOREIGN KEY REFERENCES tbl_book(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	branch_id CHAR(3) NOT NULL FOREIGN KEY REFERENCES tbl_library_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	num_copies SMALLINT NOT NULL
);

CREATE TABLE tbl_book_loan (
	book_id SMALLINT PRIMARY KEY NOT NULL FOREIGN KEY REFERENCES tbl_book(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	branch_id CHAR(3) NOT NULL FOREIGN KEY REFERENCES tbl_library_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	card_no BIGINT FOREIGN KEY REFERENCES tbl_borrower(card_no) ON UPDATE CASCADE ON DELETE CASCADE,
	date_out DATE,
	due_date DATE
);

INSERT INTO tbl_publisher
	(name, address, phone)
	VALUES
	('Random House', '1745 Broadway, New York, NY 10019', '212-782-9000'),
	('Simon & Schuster', '5666 La Jolla Boulevard, #154, La Jolla, CA, 92037', '858-551-0869'),
	('Llewellyn Worldwide', '2143 Wooddale Drive, Woodbury, MN 55125','651-291-1970'),
	('W.W. Norton', '500 Fifth Avenue, New York, NY 10010', '212-354-5500'),
	('Macmillan', '175 Fifth Avenue, New York, NY 10010', '646-307-5151'),
	('Verso', '20 Jay Street, Suite 1010 Brooklyn, New York, NY 11201', '718-246-8160')
;

INSERT INTO tbl_book
	(title, publisher_name)
	VALUES
	('Don Quixote','Random House'),
	('Pilgrim''s Progress','Random House'),
	('Robinson Crusoe','Random House'),
	('Gulliver''s Travels','Random House'),
	('Tom Jones','Random House'),
	('Clarissa','Random House'),
	('Tristram Shandy','Random House'),
	('Dangerous Liaisons','Random House'),
	('Emma','Random House'),
	('Frankenstein','Random House'),
	('Nightmare Abbey','Simon & Schuster'),
	('The Black Sheep','Simon & Schuster'),
	('The Charterhouse of Parma','Simon & Schuster'),
	('The Count of Monte Cristo','Simon & Schuster'),
	('Sybil','Simon & Schuster'),
	('David Copperfield','Simon & Schuster'),
	('Wuthering Heights','Simon & Schuster'),
	('Jane Eyre','Simon & Schuster'),
	('Vanity Fair','Simon & Schuster'),
	('The Scarlet Letter','Simon & Schuster'),
	('Moby-Dick','Simon & Schuster'),
	('Madame Bovary','Simon & Schuster'),
	('The Woman in White','Llewellyn Worldwide'),
	('Alice''s Adventures In Wonderland','Llewellyn Worldwide'),
	('Little Women','Llewellyn Worldwide'),
	('The Way We Live Now','Llewellyn Worldwide'),
	('Anna Karenina','Llewellyn Worldwide'),
	('Daniel Deronda','Llewellyn Worldwide'),
	('The Brothers Karamazov','W.W. Norton'),
	('The Portrait of a Lady','W.W. Norton'),
	('Huckleberry Finn','W.W. Norton'),
	('The Strange Case of Dr. Jekyll and Mr. Hyde','W.W. Norton'),
	('Three Men in a Boat','W.W. Norton'),
	('The Picture of Dorian Gray','W.W. Norton'),
	('The Diary of a Nobody','W.W. Norton'),
	('Jude the Obscure','Macmillan'),
	('The Riddle of the Sands','Macmillan'),
	('The Call of the Wild','Macmillan'),
	('Nostromo','Macmillan'),
	('The Wind in the Willows','Macmillan'),
	('In Search of Lost Time','Macmillan'),
	('The Rainbow','Macmillan'),
	('The Good Soldier','Macmillan'),
	('The Thirty-Nine Steps','Macmillan'),
	('Ulysses','Macmillan'),
	('Mrs Dalloway','Macmillan'),
	('A Passage to India','Macmillan'),
	('The Great Gatsby','Macmillan'),
	('The Trial','Macmillan'),
	('Men Without Women','Macmillan'),
	('Journey to the End of the Night','Macmillan'),
	('As I Lay Dying','Macmillan'),
	('Brave New World','Macmillan'),
	('Scoop','Verso'),
	('USA','Verso'),
	('The Big Sleep','Verso'),
	('The Pursuit Of Love','Verso'),
	('The Plague','Verso'),
	('Nineteen Eighty-Four','Verso'),
	('Malone Dies','Verso'),
	('Catcher in the Rye','Verso'),
	('Wise Blood','Verso'),
	('Charlotte''s Web','Verso'),
	('The Lord Of The Rings','Random House'),
	('Lucky Jim','Random House'),
	('Lord of the Flies','Random House'),
	('The Quiet American','Random House'),
	('On the Road','Random House'),
	('Lolita','Random House'),
	('The Tin Drum','Random House'),
	('Things Fall Apart','Random House'),
	('The Prime of Miss Jean Brodie','Random House'),
	('To Kill A Mockingbird','Random House'),
	('Catch-22','Random House'),
	('Herzog','Random House'),
	('One Hundred Years of Solitude','Random House'),
	('Mrs Palfrey at the Claremont','Random House'),
	('Tinker Tailor Soldier Spy','Random House'),
	('Song of Solomon','Simon & Schuster'),
	('The Bottle Factory Outing','Simon & Schuster'),
	('The Executioner''s Song','Simon & Schuster'),
	('If on a Winter''s Night a Traveller','Simon & Schuster'),
	('A Bend in the River','Simon & Schuster'),
	('Waiting for the Barbarians','Simon & Schuster'),
	('Housekeeping','Simon & Schuster'),
	('Lanark','Simon & Schuster'),
	('The New York Trilogy','Simon & Schuster'),
	('The BFG','Simon & Schuster'),
	('The Periodic Table','Simon & Schuster'),
	('Money','Simon & Schuster'),
	('An Artist of the Floating World','Simon & Schuster'),
	('Oscar And Lucinda','Simon & Schuster'),
	('The Book of Laughter and Forgetting','Simon & Schuster'),
	('Haroun and the Sea of Stories','Simon & Schuster'),
	('LA Confidential','Simon & Schuster'),
	('Wise Children','Simon & Schuster'),
	('Atonement','Simon & Schuster'),
	('Northern Lights','Simon & Schuster'),
	('American Pastoral','Simon & Schuster'),
	('Austerlitz','Simon & Schuster'),
	('Pet Sematary','Simon & Schuster'),
	('The Mist','W.W. Norton'),
	('The Hobbit','W.W. Norton'),
	('Hard Times','W.W. Norton'),
	('Tom Sawyer','W.W. Norton'),
	('The Lost Tribe','W.W. Norton')
;

INSERT INTO tbl_author
	(book_id, author)
	VALUES
	(1,'Miguel De Cervantes'),
	(2,'John Bunyan'),
	(3,'Daniel Defoe'),
	(4,'Jonathan Swift'),
	(5,'Henry Fielding'),
	(6,'Samuel Richardson'),
	(7,'Laurence Sterne'),
	(8,'Pierre Choderlos De Laclos'),
	(9,'Jane Austen'),
	(10,'Mary Shelley'),
	(11,'Thomas Love Peacock'),
	(12,'Honore De Balzac'),
	(13,'Stendhal'),
	(14,'Alexandre Dumas'),
	(15,'Benjamin Disraeli'),
	(16,'Charles Dickens'),
	(17,'Emily Bronte'),
	(18,'Charlotte Bronte'),
	(19,'William Makepeace Thackeray'),
	(20,'Nathaniel Hawthorne'),
	(21,'Herman Melville'),
	(22,'Gustave Flaubert'),
	(23,'Wilkie Collins'),
	(24,'Lewis Carroll'),
	(25,'Louisa M. Alcott'),
	(26,'Anthony Trollope'),
	(27,'Leo Tolstoy'),
	(28,'George Eliot'),
	(29,'Fyodor Dostoevsky'),
	(30,'Henry James'),
	(31,'Mark Twain'),
	(32,'Robert Louis Stevenson'),
	(33,'Jerome K. Jerome'),
	(34,'Oscar Wilde'),
	(35,'George Grossmith'),
	(36,'Thomas Hardy'),
	(37,'Erskine Childers'),
	(38,'Jack London'),
	(39,'Joseph Conrad'),
	(40,'Kenneth Grahame'),
	(41,'Marcel Proust'),
	(42,'D.H. Lawrence'),
	(43,'Ford Madox Ford'),
	(44,'John Buchan'),
	(45,'James Joyce'),
	(46,'Virginia Woolf'),
	(47,'EM Forster'),
	(48,'F. Scott Fitzgerald'),
	(49,'Franz Kafka'),
	(50,'Ernest Hemingway'),
	(51,'Louis-Ferdinand Celine'),
	(52,'William Faulkner'),
	(53,'Aldous Huxley'),
	(54,'Evelyn Waugh'),
	(55,'John Dos Passos'),
	(56,'Raymond Chandler'),
	(57,'Nancy Mitford'),
	(58,'Albert Camus'),
	(59,'George Orwell'),
	(60,'Samuel Beckett'),
	(61,'J.D. Salinger'),
	(62,'Flannery O''Connor'),
	(63,'EB White'),
	(64,'J.R.R. Tolkien'),
	(65,'Kingsley Amis'),
	(66,'William Golding'),
	(67,'Graham Greene'),
	(68,'Jack Kerouac'),
	(69,'Vladimir Nabokov'),
	(70,'Gunter Grass'),
	(71,'Chinua Achebe'),
	(72,'Muriel Spark'),
	(73,'Harper Lee'),
	(74,'Joseph Heller'),
	(75,'Saul Bellow'),
	(76,'Gabriel Garc�a M�rquez'),
	(77,'Elizabeth Taylor'),
	(78,'John Le Carre'),
	(79,'Toni Morrison'),
	(80,'Beryl Bainbridge'),
	(81,'Norman Mailer'),
	(82,'Italo Calvino'),
	(83,'V.S. Naipaul'),
	(84,'J.M. Coetzee'),
	(85,'Marilynne Robinson'),
	(86,'Alasdair Gray'),
	(87,'Paul Auster'),
	(88,'Roald Dahl'),
	(89,'Primo Levi'),
	(90,'Martin Amis'),
	(91,'Kazuo Ishiguro'),
	(92,'Peter Carey'),
	(93,'Milan Kundera'),
	(94,'Salman Rushdie'),
	(95,'James Ellroy'),
	(96,'Angela Carter'),
	(97,'Ian McEwan'),
	(98,'Philip Pullman'),
	(99,'Philip Roth'),
	(100,'W.G. Sebald'),
	(101,'Stephen King'),
	(102,'Stephen King'),
	(103,'J.R.R. Tolkien'),
	(104,'Charles Dickens'),
	(105,'Mark Twain'),
	(106,'Mark Lee')
;

INSERT INTO tbl_borrower
	(name, address, phone)
	VALUES
	('Tom Miles', '84 John Ave', '503-351-4512'),
	('Neil Stephenson', '56 Oak Meadow Street', '503-231-5483'),
	('Ryan Burgess', '6 Bridle Avenue', '503-236-1215'),
	('Patricia Mcguire', '135 Golf St', '503-536-4315'),
	('Clarence Frank', '6 Kirkland Street', '503-548-9754'),
	('Shirley Zimmerman', '41 Sycamore Street', '503-845-6485'),
	('Judith Hensley', '136 W. High Dr', '503-565-3485'),
	('Thomas Suarez', '588 Boston Street', '503-252-9753'),
	('Michael Rivers', '53 North Lane', '503-355-6785'),
	('John Watson', '9602 Beach Ave', '971-234-9781'),
	('Tyrone Benson', '8268 East Arch Lane', '971-454-3485'),
	('Ferris Gonzalez', '9238 Lakeview Street', '971-789-6451'),
	('Fazil Contreras', '792 Kirkland St', '971-654-2794'),
	('Tezic Salinas', '567 Hawthorne Street', '971-238-3785'),
	('Pauline Schneider', '234 Warren Rd', '503-485-6487')
;

INSERT INTO tbl_library_branch
	(branch_id, branch_name, address)
	VALUES
	('sha', 'Sharpstown', '8312 Center Road'),
	('cen', 'Central', '96 Gartner St'),
	('wes', 'Westside', '586 Manor St'),
	('sou', 'Southside', '245 Wall Avenue'),
	('nor', 'Northside', '9872 Branch Drive'),
	('eas', 'Eastside', '52 Tarkiln Hill Lane'),
	('orc', 'Orchardville', '901 Liberty Street'),
	('mou', 'Mountaindale', '91 Bear Hill Ave'),
	('gar', 'Gardendale', '7384 Prairie Street'),
	('ful', 'Fullerton', '646 Bridge St')
;

INSERT INTO tbl_book_copy
	(book_id, branch_id, num_copies)
	VALUES
	(1, 'sha', 2),
	(2, 'sha', 2),
	(3, 'sha', 3),
	(4, 'sha', 4),
	(5, 'sha', 5),
	(6, 'sha', 2),
	(7, 'sha', 2),
	(8, 'sha', 3),
	(9, 'sha', 2),
	(10, 'sha', 2),
	(11, 'sha', 2),
	(12, 'cen', 2),
	(13, 'cen', 8),
	(14, 'cen', 6),
	(15, 'cen', 2),
	(16, 'cen', 3),
	(17, 'cen', 2),
	(18, 'cen', 4),
	(19, 'cen', 5),
	(20, 'cen', 8),
	(21, 'cen', 3),
	(22, 'wes', 4),
	(23, 'wes', 2),
	(24, 'wes', 2),
	(25, 'wes', 2),
	(26, 'wes', 2),
	(27, 'wes', 2),
	(28, 'wes', 2),
	(29, 'wes', 2),
	(30, 'wes', 2),
	(31, 'wes', 2),
	(32, 'sou', 2),
	(33, 'sou', 2),
	(34, 'sou', 2),
	(35, 'sou', 2),
	(36, 'sou', 2),
	(37, 'sou', 2),
	(38, 'sou', 2),
	(39, 'sou', 2),
	(40, 'sou', 2),
	(41, 'sou', 2),
	(42, 'nor', 2),
	(43, 'nor', 2),
	(44, 'nor', 2),
	(45, 'nor', 2),
	(46, 'nor', 2),
	(47, 'nor', 2),
	(48, 'nor', 2),
	(49, 'nor', 2),
	(50, 'nor', 2),
	(51, 'nor', 2),
	(52, 'eas', 2),
	(53, 'eas', 2),
	(54, 'eas', 2),
	(55, 'eas', 2),
	(56, 'eas', 2),
	(57, 'eas', 2),
	(58, 'eas', 2),
	(59, 'eas', 2),
	(60, 'eas', 3),
	(61, 'eas', 2),
	(62, 'eas', 2),
	(63, 'orc', 4),
	(64, 'orc', 2),
	(65, 'orc', 3),
	(66, 'orc', 2),
	(67, 'orc', 2),
	(68, 'orc', 2),
	(69, 'orc', 2),
	(70, 'orc', 2),
	(71, 'orc', 3),
	(72, 'orc', 2),
	(73, 'orc', 4),
	(74, 'mou', 2),
	(75, 'mou', 2),
	(76, 'mou', 4),
	(77, 'mou', 3),
	(78, 'mou', 2),
	(79, 'mou', 2),
	(80, 'mou', 2),
	(81, 'mou', 3),
	(82, 'mou', 3),
	(83, 'mou', 2),
	(84, 'gar', 2),
	(85, 'gar', 4),
	(86, 'gar', 2),
	(87, 'gar', 2),
	(88, 'gar', 4),
	(89, 'gar', 2),
	(90, 'gar', 3),
	(91, 'gar', 2),
	(92, 'gar', 3),
	(93, 'gar', 2),
	(94, 'gar', 2),
	(95, 'ful', 6),
	(96, 'ful', 2),
	(97, 'ful', 2),
	(98, 'ful', 2),
	(99, 'ful', 4),
	(100, 'ful', 2),
	(101, 'ful', 4),
	(102, 'ful', 2),
	(103, 'ful', 4),
	(104, 'ful', 2),
	(105, 'ful', 3),
	(106, 'ful', 2)
;

INSERT INTO tbl_book_loan
	(book_id, branch_id, card_no, date_out, due_date)
	VALUES
	(1, 'sha',21168000001000, '20170501', '20170522'),
	(2, 'sha',21168000001001, '20170502', '20170523'),
	(3, 'sha',21168000001002, '20170503', '20170524'),
	(4, 'sha',21168000001000, '20170501', '20170522'),
	(5, 'sha',NULL,NULL,NULL),
	(6, 'sha',NULL,NULL,NULL),
	(7, 'sha',21168000001000, '20170501', '20170522'),
	(8, 'sha',21168000001001, '20170502', '20170523'),
	(9, 'sha',21168000001002, '20170503', '20170524'),
	(10, 'sha',21168000001001, '20170502', '20170523'),
	(11, 'sha',NULL,NULL,NULL),
	(12, 'cen',21168000001000, '20170501', '20170522'),
	(13, 'cen',21168000001001, '20170502', '20170523'),
	(14, 'cen',NULL,NULL,NULL),
	(15, 'cen',NULL,NULL,NULL),
	(16, 'cen',21168000001004, '20170511', '20170602'),
	(17, 'cen',21168000001005, '20170512', '20170603'),
	(18, 'cen',21168000001006, '20170513', '20170604'),
	(19, 'cen',21168000001007, '20170514', '20170605'),
	(20, 'cen',NULL,NULL,NULL),
	(21, 'cen',NULL,NULL,NULL),
	(22, 'wes',21168000001003, '20170510', '20170601'),
	(23, 'wes',21168000001004, '20170511', '20170602'),
	(24, 'wes',21168000001005, '20170512', '20170603'),
	(25, 'wes',21168000001006, '20170513', '20170604'),
	(26, 'wes',NULL,NULL,NULL),
	(27, 'wes',NULL,NULL,NULL),
	(28, 'wes',NULL,NULL,NULL),
	(29, 'wes',NULL,NULL,NULL),
	(30, 'wes',NULL,NULL,NULL),
	(31, 'wes',NULL,NULL,NULL),
	(32, 'sou',21168000001008, '20170515', '20170606'),
	(33, 'sou',21168000001009, '20170516', '20170607'),
	(34, 'sou',21168000001010, '20170515', '20170606'),
	(35, 'sou',NULL,NULL,NULL),
	(36, 'sou',NULL,NULL,NULL),
	(37, 'sou',21168000001008, '20170515', '20170606'),
	(38, 'sou',21168000001009, '20170516', '20170607'),
	(39, 'sou',NULL,NULL,NULL),
	(40, 'sou',21168000001011, '20170516', '20170607'),
	(41, 'sou',21168000001012, '20170517', '20170608'),
	(42, 'nor',21168000001006, '20170513', '20170604'),
	(43, 'nor',NULL,NULL,NULL),
	(44, 'nor',NULL,NULL,NULL),
	(45, 'nor',21168000001009, '20170516', '20170607'),
	(46, 'nor',21168000001010, '20170517', '20170608'),
	(47, 'nor',21168000001011, '20170518', '20170609'),
	(48, 'nor',21168000001012, '20170519', '20170610'),
	(49, 'nor',21168000001013, '20170520', '20170611'),
	(50, 'nor',NULL,NULL,NULL),
	(51, 'nor',21168000001006, '20170513', '20170604'),
	(52, 'eas',21168000001006, '20170513', '20170604'),
	(53, 'eas',21168000001006, '20170513', '20170604'),
	(54, 'eas',21168000001000, '20170506', '20170527'),
	(55, 'eas',NULL,NULL,NULL),
	(56, 'eas',NULL,NULL,NULL),
	(57, 'eas',NULL,NULL,NULL),
	(58, 'eas',21168000001000, '20170506', '20170527'),
	(59, 'eas',21168000001001, '20170507', '20170528'),
	(60, 'eas',NULL,NULL,NULL),
	(61, 'eas',21168000001003, '20170509', '20170530'),
	(62, 'eas',21168000001007, '20170502', '20170523'),
	(63, 'orc',NULL,NULL,NULL),
	(64, 'orc',21168000001009, '20170504', '20170525'),
	(65, 'orc',21168000001010, '20170505', '20170526'),
	(66, 'orc',21168000001011, '20170506', '20170527'),
	(67, 'orc',21168000001007, '20170502', '20170523'),
	(68, 'orc',NULL,NULL,NULL),
	(69, 'orc',NULL,NULL,NULL),
	(70, 'orc',21168000001010, '20170505', '20170526'),
	(71, 'orc',21168000001011, '20170506', '20170527'),
	(72, 'orc',21168000001007, '20170502', '20170523'),
	(73, 'orc',NULL,NULL,NULL),
	(74, 'mou',21168000001009, '20170504', '20170525'),
	(75, 'mou',21168000001010, '20170505', '20170526'),
	(76, 'mou',NULL,NULL,NULL),
	(77, 'mou',21168000001000, '20170506', '20170527'),
	(78, 'mou',21168000001001, '20170507', '20170528'),
	(79, 'mou',NULL,NULL,NULL),
	(80, 'mou',21168000001004, '20170509', '20170530'),
	(81, 'mou',21168000001004, '20170510', '20170601'),
	(82, 'mou',21168000001005, '20170511', '20170602'),
	(83, 'mou',NULL,NULL,NULL),
	(84, 'gar',21168000001007, '20170513', '20170604'),
	(85, 'gar',21168000001008, '20170514', '20170605'),
	(86, 'gar',NULL,NULL,NULL),
	(87, 'gar',NULL,NULL,NULL),
	(88, 'gar',21168000001011, '20170518', '20170609'),
	(89, 'gar',21168000001012, '20170519', '20170610'),
	(90, 'gar',NULL,NULL,NULL),
	(91, 'gar',NULL,NULL,NULL),
	(92, 'gar',NULL,NULL,NULL),
	(93, 'gar',NULL,NULL,NULL),
	(94, 'gar',21168000001013, '20170520', '20170611'),
	(95, 'ful',21168000001014, '20170521', '20170612'),
	(96, 'ful',21168000001009, '20170520', '20170611'),
	(97, 'ful',NULL,NULL,NULL),
	(98, 'ful',NULL,NULL,NULL),
	(99, 'ful',21168000001012, '20170519', '20170610'),
	(100, 'ful',21168000001013, '20170520', '20170611'),
	(101, 'ful',21168000001014, '20170521', '20170612'),
	(102, 'ful',NULL,NULL,NULL),
	(103, 'ful',NULL,NULL,NULL),
	(104, 'ful',21168000001005, '20170520', '20170611'),
	(105, 'ful',21168000001011, '20170518', '20170609'),
	(106, 'ful',NULL,NULL,NULL)
;


-- Queries to show all columns & records in each table:

SELECT * FROM tbl_author;
SELECT * FROM tbl_book;
SELECT * FROM tbl_book_copy;
SELECT * FROM tbl_book_loan;
SELECT * FROM tbl_borrower;
SELECT * FROM tbl_library_branch;
SELECT * FROM tbl_publisher;