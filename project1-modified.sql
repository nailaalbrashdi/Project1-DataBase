create database librarySystem1
use librarySystem1
create table library1
(
ID int primary key identity(1,1),
LibraryName nvarchar(50) not null,
contactNumber int,
EstablishYear int,
)
create table location1
(
IDLibrary int ,
loc nvarchar(100),
primary key(IDLibrary,loc),
foreign key (IDLibrary) references library1(ID)
)
create table loan1
(
loanStatus nvarchar(20)primary key,
LoanDate date,
DueDate date,
ReturnDate date,
)
create table members1
(
ID int primary key identity(1,1),
Fname nvarchar(20),
email nvarchar(100) not null,
phoneNumber int,
memberStartDate date not null ,
loanStatus nvarchar(20),
foreign key(loanStatus) references loan1(loanStatus)
)
create table staff1
(
ID int primary key identity(1,1),
Fname nvarchar(20),
position nvarchar(20),
contactNumber int,
)
create table payment1
(
Amount int primary key,
paymentDate date,
method nvarchar(20),
statusLoan nvarchar(20),
foreign key(statusLoan) references loan1(loanStatus)
)
create table review1
(
ratingComment nvarchar primary key,
ratingReviewDate date,
IDMembers int,
foreign key(IDMembers) references members1(ID)
)
create table book1
(
ID int primary key identity(1,1),
ISBN int,
title nvarchar(100),
gender nvarchar(20),
price int,
AvaiStatus nvarchar(50),
shelfLocation nvarchar(100),
IDLibrary int,
IDMembers int,
RatingComment nvarchar,
foreign key(IDLibrary) references library1(ID),
foreign key(IDMembers) references members1(ID),
foreign key(RatingComment) references review1(ratingComment)
)

alter table library1
add StaffID int foreign key references staff1(ID);

INSERT INTO library1(LibraryName, contactNumber, EstablishYear)
VALUES
('Central Library', '24567890', 1995),
('City Knowledge Hub', '25678901', 2002),
('University Library', '26789012', 1988),
('Community Library', '27890123', 2010),
('Digital Learning Center', '28901234', 2018),
('National Archive Library', '29102345', 1975),
('Children Reading Center', '30213456', 2005),
('Public Research Library', '31324567', 1990),
('Innovation Library', '32435678', 2015),
('Cultural Heritage Library', '33546789', 1982);

select*from library1

INSERT INTO location1 (IDLibrary, loc)
VALUES
(1, 'Muscat'),
(2, 'Sohar'),
(3, 'Nizwa'),
(4, 'Sur'),
(5, 'Ibri'),
(6, 'Buraimi'),
(7, 'Rustaq'),
(8, 'Duqm'),
(9, 'Salalah'),
(10, 'Khasab');


select*from location1

INSERT INTO loan1(loanStatus,LoanDate,DueDate,ReturnDate)
VALUES
('Borrowed_1', '2025-01-01', '2025-01-15', '2025-01-10'),
('Returned_1', '2025-01-02', '2025-01-16', '2025-01-15'),
('Overdue_1',  '2025-01-03', '2025-01-17', '2025-01-20'),
('Borrowed_2', '2025-02-01', '2025-02-15', '2025-02-12'),
('Returned_2', '2025-02-02', '2025-02-16', '2025-02-14'),
('Overdue_2',  '2025-02-03', '2025-02-17', '2025-02-22'),
('Borrowed_3', '2025-03-01', '2025-03-15', '2025-03-13'),
('Returned_3', '2025-03-02', '2025-03-16', '2025-03-15'),
('Borrowed_4', '2025-03-03', '2025-03-17', '2025-03-14'),
('Returned_4', '2025-03-04', '2025-03-18', '2025-03-17');

select*from loan1

INSERT INTO members1(Fname,email,phoneNumber,memberStartDate,loanStatus)
VALUES('Ali',   'ali1@email.com',   '91234501', '2024-01-10', 'Borrowed_1'),
('Sara',  'sara2@email.com',  '91234502', '2024-01-12', 'Returned_1'),
('Omar',  'omar3@email.com',  '91234503', '2024-01-15', 'Overdue_1'),
('Aisha', 'aisha4@email.com', '91234504', '2024-02-01', 'Borrowed_2'),
('Hassan','hassan5@email.com','91234505', '2024-02-05', 'Returned_2'),
('Noor',  'noor6@email.com',  '91234506', '2024-02-10', 'Overdue_2'),
('Khalid','khalid7@email.com','91234507', '2024-03-01', 'Borrowed_3'),
('Mona',  'mona8@email.com',  '91234508', '2024-03-05', 'Returned_3'),
('Yusuf', 'yusuf9@email.com', '91234509', '2024-03-10', 'Borrowed_4'),
('Laila', 'laila10@email.com','91234510', '2024-03-15', 'Returned_4');

select*from members1


INSERT INTO staff1(Fname,position,contactNumber)
VALUES('Ahmed',   'Librarian',        '90123401'),
('Fatma',   'Assistant',        '90123402'),
('Salim',   'Manager',          '90123403'),
('Amina',   'Archivist',        '90123404'),
('Khalifa', 'IT Support',       '90123405'),
('Noora',   'Catalog Specialist','90123406'),
('Hamad',   'Security Officer', '90123407'),
('Maryam',  'Customer Service', '90123408'),
('Yousef',  'Research Assistant','90123409'),
('Zainab',  'Training Officer', '90123410');

select*from staff1

INSERT INTO payment1(Amount,paymentDate,method,statusLoan)
VALUES
(1,  '2025-01-10', 'Cash',   'Borrowed_1'),
(2,  '2025-01-15', 'Card',   'Returned_1'),
(3,  '2025-01-20', 'Online', 'Overdue_1'),
(4,  '2025-02-12', 'Cash',   'Borrowed_2'),
(5,  '2025-02-14', 'Card',   'Returned_2'),
(6,  '2025-02-22', 'Online', 'Overdue_2'),
(7,  '2025-03-13', 'Cash',   'Borrowed_3'),
(8,  '2025-03-15', 'Card',   'Returned_3'),
(9,  '2025-03-14', 'Online', 'Borrowed_4'),
(10, '2025-03-17', 'Card',   'Returned_4');

select*from payment1

ALTER TABLE book1
DROP CONSTRAINT FK__book1__RatingCom__6FE99F9F;

SELECT name AS ConstraintName
FROM sys.key_constraints
WHERE type = 'PK'
  AND parent_object_id = OBJECT_ID('review1');

ALTER TABLE review1
DROP CONSTRAINT PK__review1__8EA9B93D593F8B7C;

SELECT name AS ConstraintName
FROM sys.key_constraints
WHERE type = 'PK'
  AND parent_object_id = OBJECT_ID('review1');

  ALTER TABLE review1
ALTER COLUMN ratingComment NVARCHAR(255) NULL;


INSERT INTO review1 (ratingComment,ratingReviewDate,IDMembers)
VALUES ('Amazing experience, will buy again!', '2026-02-09', 1),
('Good product but delivery was slow.', '2026-02-08', 2),
('Satisfied with my purchase.', '2026-02-07', 3),
('Not as described, a bit disappointed.', '2026-02-06', 4),
('Excellent quality, highly recommend!', '2026-02-05', 1),
('Average, nothing special.', '2026-02-04', 2),
('Fantastic! Exceeded my expectations.', '2026-02-03', 3),
('Poor packaging, item was damaged.', '2026-02-02', 4),
('Quick delivery and great support.', '2026-02-01', 1),
('Loved it, will definitely order again.', '2026-01-31', 2);

select*from review1

SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'book1'
  AND COLUMN_NAME = 'RatingComment';

SELECT name AS FKName
FROM sys.foreign_keys
WHERE parent_object_id = OBJECT_ID('book1')
  AND referenced_object_id = OBJECT_ID('review1');

EXEC sp_fkeys 'book1';

ALTER TABLE book1
ADD RatingComment_new NVARCHAR(255);

UPDATE book1
SET RatingComment_new = RatingComment;

ALTER TABLE book1
DROP COLUMN RatingComment;

EXEC sp_rename 'book1.RatingComment_new', 'RatingComment', 'COLUMN';


INSERT INTO book1 (ISBN, title, gender, price, AvaiStatus, shelfLocation, IDLibrary, IDMembers, RatingComment)
VALUES
('001', 'The Great Adventure', 'Fiction', 16, 'CheckedOut', 'A1', 1, 1, 'Amazing experience, will buy again!'),
('002', 'Learning SQL', 'Education', 26, 'CheckedOut', 'B2', 1, 2, 'Good product but delivery was slow.'),
('003', 'Mystery of the Night', 'Mystery', 13, 'CheckedOut', 'C3', 2, 3, 'Satisfied with my purchase.'),
('004', 'Cooking 101', 'Cooking', 18, 'CheckedOut', 'D4', 2, 4, 'Not as described, a bit disappointed.'),
('005', 'History of Art', 'Art', 30, 'CheckedOut', 'E5', 1, 1, 'Excellent quality, highly recommend!'),
('006', 'Science for Teens', 'Education', 20, 'CheckedOut', 'F6', 3, 2, 'Average, nothing special.'),
('007', 'Thriller Nights', 'Thriller', 15, 'CheckedOut', 'G7', 3, 3, 'Fantastic! Exceeded my expectations.'),
('008', 'Gardening Tips', 'Hobby', 22, 'CheckedOut', 'H8', 2, 4, 'Poor packaging, item was damaged.'),
('009', 'World Travel Guide', 'Travel', 29, 'CheckedOut', 'I9', 1, 1, 'Quick delivery and great support.'),
('010', 'The Great Mystery', 'Mystery', 17, 'CheckedOut', 'J10', 3, 2, 'Loved it, will definitely order again.');

select*from book1

SELECT l.LibraryName, lo.loc AS Location
FROM library1 l
JOIN location1 lo
ON l.ID = lo.IDLibrary;

SELECT title, gender, price
FROM book1;

SELECT Fname, email
FROM members1;

SELECT ID, Fname, position
FROM staff1;

SELECT *
FROM book1
WHERE gender = 'Fiction';

SELECT l.LibraryName, lo.loc
FROM library1 l
JOIN location1 lo
ON l.ID = lo.IDLibrary
WHERE lo.loc = 'New York';

SELECT *
FROM book1
WHERE AvaiStatus = 'CheckedOut';

SELECT *
FROM staff1
WHERE position = 'Librarian';

SELECT *
FROM loan1
WHERE loanStatus LIKE 'Overdue%';


SELECT *
FROM book1
WHERE price > 20;

SELECT *
FROM library1
WHERE EstablishYear < 2000;

SELECT *
FROM payment1
WHERE Amount >= 10;

SELECT *
FROM book1
WHERE price <= 15;

SELECT *
FROM book1
WHERE gender = 'Fiction'
  AND AvaiStatus <> 'CheckedOut';

  SELECT *
FROM book1
WHERE gender = 'Fiction'
   OR gender = 'Children';

SELECT l.LibraryName, l.EstablishYear, lo.loc
FROM library1 l
JOIN location1 lo
ON l.ID = lo.IDLibrary
WHERE l.EstablishYear > 2010
  AND lo.loc = 'California';

SELECT *
FROM book1
WHERE price>=10
AND price<=30


SELECT *
FROM book1
ORDER BY title ASC;

SELECT *
FROM book1
ORDER BY price DESC;




