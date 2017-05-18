/* ======= STORED PROCEDURE DRILLS =======
     Database and SQL Course, Item #27     */


-- USE db_library
-- EXEC uspLibraryQueries


CREATE PROCEDURE dbo.uspLibraryQueries
AS

-- 1) How many copies of "The Lost Tribe" are owned by the Sharptown branch?

	-- v1: book title and branch specified in query:

	SELECT tbl_book.title, tbl_library_branch.branch_name AS 'branch', tbl_book_copy.num_copies AS 'copies owned'
	FROM tbl_book_copy
	INNER JOIN tbl_library_branch ON tbl_library_branch.branch_id = tbl_book_copy.branch_id
	INNER JOIN tbl_book ON tbl_book.book_id = tbl_book_copy.book_id
	WHERE tbl_book.title = 'The Lost Tribe'
		AND tbl_library_branch.branch_name = 'Sharptown'
	;

	-- v2: above query that prints result in sentence form	
	 
	/*
	DECLARE @branchCopies SMALLINT;
	SET @branchCopies =
		(SELECT COUNT (tbl_book_copy.num_copies)
		FROM tbl_book_copy
		INNER JOIN tbl_library_branch ON tbl_library_branch.branch_id = tbl_book_copy.branch_id
		INNER JOIN tbl_book ON tbl_book.book_id = tbl_book_copy.book_id
		WHERE tbl_book.title = 'The Lost Tribe' AND tbl_library_branch.branch_name = 'Sharptown'
		)
	PRINT (
		'The Sharpstown Branch has ' + CONVERT(char(2),@branchCopies) + 'copies of ''The Lost Tribe'''
	);
	*/

	-- v3: above query with parameters to specify title and branch

	/*
	ALTER PROCEDURE dbo.uspLibraryQueries @branch VARCHAR(50), @title VARCHAR(75)
	AS	 
		DECLARE @branchCopies SMALLINT
		SET @branchCopies =
			(SELECT SUM (tbl_book_copy.num_copies) AS "Copies owned by branch:"
			FROM tbl_book_copy
			INNER JOIN tbl_library_branch ON tbl_library_branch.branch_id = tbl_book_copy.branch_id
			INNER JOIN tbl_book ON tbl_book.book_id = tbl_book_copy.book_id
			WHERE tbl_book.title = @title AND tbl_library_branch.branch_name = @branch
			)
		PRINT (
			'The ' + @branch + ' Branch has ' + CONVERT(char(2),@branchCopies) + 'copies of ' + @title
		);
	
	uspLibraryQueries @title = 'The Lost Tribe', @branch = 'Fullerton'
	*/ 


-- 2) How many copies of "The Lost Tribe" are owned by each branch?
		/*
		This query actually answers the question 'Which branch has copies of "The Lost Tribe" and how many?'
		Since this particular data has only one unique bookID per Title, the distinction between Title and bookID is only semantic.
		A 'number of copies' column in tbl_book_copy does not seem to be the right approach since it implies that there can be multiple copies of a uniqe physical book vs multiple copies of a title.  If there were multiple bookID's per Title, the number of occurrences of a Title at a branch could be counted.
		*/

	SELECT tbl_book.title AS 'Title: ', tbl_library_branch.branch_name AS 'Branch: ', tbl_book_copy.num_copies AS 'Copies Owned:'
	FROM tbl_book_copy
	INNER JOIN tbl_library_branch ON tbl_library_branch.branch_id = tbl_book_copy.branch_id
	INNER JOIN tbl_book ON tbl_book.book_id = tbl_book_copy.book_id
	WHERE tbl_book.title = 'The Lost Tribe'
	;


-- 3) Names of all borrowers who do not have any books checked out

	SELECT tbl_borrower.name
	FROM tbl_borrower
	INNER JOIN tbl_book_loan ON tbl_book_loan.card_no = tbl_borrower.card_no
	WHERE tbl_book_loan.book_id = NULL
	;

	-- Since above query returns no results because all borrowers have books checked out, this query lists borrowers in order of card# with the books they have checked out:
			
	SELECT tbl_borrower.name, tbl_book.title
	FROM tbl_borrower
	INNER JOIN tbl_book_loan ON tbl_book_loan.card_no = tbl_borrower.card_no
	INNER JOIN tbl_book ON tbl_book.book_id = tbl_book_loan.book_id
	ORDER BY tbl_borrower.card_no ASC
	;


-- 4) Book title, the borrower's name, and the borrower's address for books loaned from "Sharpstown" branch whose DueDate is today

	SELECT DISTINCT tbl_book.title AS 'DUE TODAY', tbl_borrower.name AS 'borrowed by', tbl_borrower.address
	FROM tbl_library_branch, tbl_book
	INNER JOIN tbl_book_loan ON tbl_book_loan.book_id = tbl_book.book_id
	INNER JOIN tbl_borrower ON tbl_borrower.card_no = tbl_book_loan.card_no
	WHERE tbl_book_loan.due_date = CAST(GETDATE() AS DATE) AND tbl_library_branch.branch_name = 'Sharpstown'
	-- use to test (without above WHERE clause):
		-- WHERE tbl_book_loan.due_date = '20170605'
	;


-- 5) Branch name and the total number of books loaned from each branch
	
	SELECT tbl_library_branch.branch_name AS 'Branch', COUNT(tbl_book_loan.book_id) AS '# of books out'
		FROM tbl_library_branch
		INNER JOIN tbl_book_loan ON tbl_book_loan.branch_id = tbl_library_branch.branch_id
		GROUP BY tbl_library_branch.branch_name
	;

-- 6) Names, addresses, and number of books checked out for all borrowers who have more than five books checked out

	SELECT tbl_borrower.name, tbl_borrower.address, COUNT(tbl_book_loan.book_id) AS '# of books checked out'
	FROM tbl_borrower
	INNER JOIN tbl_book_loan ON tbl_book_loan.card_no = tbl_borrower.card_no
	INNER JOIN tbl_book ON tbl_book.book_id = tbl_book_loan.book_id
	GROUP BY tbl_borrower.name, tbl_borrower.address
	HAVING COUNT(tbl_book_loan.book_id) > 5
	;

-- 7) Title and the number of copies of books by Stephen King owned by the "Central" branch

	SELECT tbl_book.title, tbl_book_copy.num_copies AS '# of copies', tbl_library_branch.branch_name AS 'branch'
	FROM tbl_author
	INNER JOIN tbl_book_copy ON tbl_book_copy.book_id = tbl_author.book_id
	INNER JOIN tbl_book ON tbl_book.book_id = tbl_book_copy.book_id
	INNER JOIN tbl_library_branch ON tbl_library_branch.branch_id = tbl_book_copy.branch_id
	WHERE tbl_author.author = 'Stephen King'
	-- comment out AND below to test for all branches:
		AND tbl_library_branch.branch_id = 'Central'
	;