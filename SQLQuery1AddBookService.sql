/*UC1 to create a Address Book ServiceDB*/

create database AddressBookServiceDataBase

use AddressBookServiceDB

---UC2 create a AddressBook table in the Address Book ServiceDB

create table ContactTable(
Id int identity(1,1) NOT NULL PRIMARY KEY,
FirstName varchar(16) ,
LastName varchar(16),
Address varchar(24),
City varchar(16),
State varchar(16),
ZipCode varchar(6),
PhoneNumber varchar(16),
EmailId varchar(24)
);

---UC3  Insert New Contacts in AddressBook DB 

Insert into ContactsTable(FirstName,LastName,Address,City,State,ZipCode,PhoneNumber,EmailId) values 
('Rishabh','B','xyz Road','Agra','UP','282001','7906552015','rish25@mail.com'),
('Amit','M','Buliding abc','Delhi','NewDelhi','110001','6545341514','amitm@mail.com'),
('Satty','K','above showroom','Panipat','HP','411042','7894561230','sattyo@mail.com'),
('Reeta','D','Near temple','Chennai','Tamil Nadu','600005','7744112233','reetad@mail.com'),
('Jiya','G','Opp mall','Ahemdabad','Gujrat','700073','7775553330','jiyag@mail.com');

---UC4 Edit existing contact person using their name 
UPDATE ContactsTable set State='UP' where FirstName='Rishabh' or FirstName='Amit'

---UC5 Delete contact by name 
Delete from ContactsTable where FirstName='Jiya'

--- UC6 Retrieve Person belonging to a City or State 
SELECT * from ContactsTable where State='UP' or State='NewDelhi';

---UC7 Count of address book by City and State 
select City,COUNT(City) as countOfCity from ContactsTable group by City order by City;
select State,COUNT(State) as countOfStates from ContactsTable group by State order by State;

---UC8 sort name entries based on city 
Insert into ContactsTable(FirstName,LastName,Address,City,State,ZipCode,PhoneNumber,EmailId) values 
('Rahul','S','near school','Agra','UP',400092,'7895553330','rahuls@mail.com'),
('Chetan','L','near collage','Ahemdabad','Gujrat',400089,'9877553030','chetanl@mail.com'),
('Neha','P','Kalina','Mumbai','Maharastra',400098,'7733400300','nehap@mail.com');
SELECT * from ContactsTable

SELECT * FROM ContactsTable WHERE City = 'Agra' ORDER BY FirstName ASC;	--ascending
SELECT * FROM ContactsTable WHERE City = 'Agra' ORDER BY FirstName DESC;	--descending

---UC9 Ability to identify each Address Book with name and Type. 

ALTER table ContactsTable ADD AdrBookName varchar(8);
ALTER table ContactsTable ADD PersonType VARCHAR(16);

UPDATE ContactsTable set AdrBookName='AB1' where Id=1 OR Id=6 OR Id=8
UPDATE ContactsTable set AdrBookName='AB2' where Id=2 OR Id=3 
UPDATE ContactsTable set AdrBookName='AB3' where Id=4 OR Id=7

UPDATE ContactsTable set PersonType='Friends' where AdrBookName='AB1'
UPDATE ContactsTable set PersonType='Family' where AdrBookName='AB2'
UPDATE ContactsTable set PersonType='Profession' where AdrBookName='AB3'

SELECT * FROM ContactsTable

---UC10 Ability to get number of contact persons i.e. count by type 

SELECT PersonType,COUNT(PersonType) as count from ContactsTable group by PersonType


---UC11 Ability to add person to both Friend and Family 

create table PersonsCategory
 (
	Id int identity(1,1) primary key,
	PersonId int foreign key references ContactsTable(Id),
	PersonType varchar(20) not null
	)
insert into PersonCategory(PersonId,PersonType) values (1,'Family'),(2,'Friend'),(3,'Family'),(4,'Friend'),(6,'Profession'),(7,'Profession'),(8,'Profession');
select * from PersonCategory;
----- adding id 4 as friend and family
insert into PersonCategory(PersonId,PersonType) values(1,'Profession'),(4,'Family');

---UC12 ER diagram and normalisation 

Alter Table ContactsTable drop column PersonType

---UC13  Test queries 

SELECT * FROM ContactsTable WHERE City = 'Agra' ORDER BY FirstName ASC;	--ascending
SELECT * from ContactsTable where State='UP' or City='Chennai';
SELECT City,COUNT(City) as countOfCity from ContactsTable group by City order by City;
