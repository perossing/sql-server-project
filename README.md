SQL server lesson -- TechAcad
emy

** Schema with tables & columns was specified in assignment

** Criteria specified for data:
- There is a book called 'The Lost Tribe'.
- There is a library branch called 'Sharpstown' and one called 'Central'.
- There are at least 20 books in the BOOK table.
- There are at least 10 authors in the BOOK_AUTHORS table.
- Each library branch has at least 10 book titles, and at least two copies of each of those titles.
- There are at least 8 borrowers in the BORROWER table, and at least 2 of those borrowers have more than 5 books loaned to them.
- There are at least 4 branches in the LIBRARY_BRANCH table.
- There are at least 50 loans in the BOOK_LOANS table.
- There must be at least one book written by 'Stephen King'.


** To populate tables, I set up data in Excel sheets with columns to match tables.  Then since using INSERT statements in SQL Server was part of the lesson, I worked the proper syntax into Excel columns to copy & paste INSERT statements into SQL Server

** Assignment for stored procedure -- Write queries for:
- How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?
- How many copies of the book titled "The Lost Tribe" are owned by each library branch?
- Retrieve the names of all borrowers who do not have any books checked out.
- For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address.
- For each library branch, retrieve the branch name and the total number of books loaned out from that branch.
- Retrieve the names, addresses, and number of books checked out for all borrowers who have more than five books checked out.
- For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".

** See note on query #2 in Stored-procedure-drills_library.sql file. May want to revisit and experiment with different set-up for book & book_copy tables