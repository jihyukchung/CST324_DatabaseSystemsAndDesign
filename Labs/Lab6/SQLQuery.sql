USE jihyukchung;
Go

IF  DB_ID('jihyukchungTShirtsDB') IS NOT NULL
    DROP DATABASE jihyukchungTShirtsDB;

CREATE DATABASE jihyukchungTShirtsDB;
GO

USE jihyukchungTShirtsDB;

Create table UserTB
(
	UserID 			int				NOT NULL	constraint UserTB_pk primary key
	,EmailAddress	VARCHAR(255)	NOT NULL	UNIQUE
	,FirstName		varchar(20)		NOT NULL	
	,LastName		varchar(20)		NOT NULL
	,PreferredName	varchar(20)
	,PhoneNumber	varchar(15)
);
Create table USAddressTB
(
	AddrID	 		int				NOT NULL	constraint USAddressTB_pk primary key
	,StreetAddr		varchar(40)		NOT NULL
	,Optional		varchar(40)		
	,City			varchar(21)		NOT NULL
	,State			varchar(2)		NOT NULL
	,CountryCode	varchar(3)		NOT NULL
	,PostalCode		INT				NOT NULL
);
Create table OrderTB
(
	OrderID 		int				NOT NULL	constraint OrderTB_pk primary key
	,UserID			int				NOT NULL	constraint OrderTB_UserTB_fk references UserTB(UserID)
	,AddrID			int				NOT NULL	constraint OrderTB_USAddressTB_fk references USAddressTB(AddrID)
	,ShippingCost	decimal(8, 2)				DEFAULT 5.00
	--,TotalCost		decimal(8, 2)	NOT NULL
	,ShippingFlag	bit				NOT NULL
);
Create table SizeTB
(
	SizeID 			int				NOT NULL	constraint SizeTB_pk primary key
	,ClothingSize	varchar(3)		NOT NULL
);
Create table TShirtsTB
(
	TShirtsID 		int							constraint TShirtsTB_pk primary key
	,Name			varchar(100)	NOT NULL
	,Brand			varchar(20)		NOT NULL
	,Cost			decimal(8, 2)				DEFAULT 10
	,StockQuantity	INT				NOT NULL
);
Create table Order_TShirts_IMT
(
	OrderID			int				NOT NULL	constraint Order_TShirts_OrderTB_fk references OrderTB(OrderID)
	,TShirtsID		int				NOT NULL	constraint Order_TShirts_TShirts_fk references TShirtsTB(TShirtsID)
	,OrderQuantity	int				NOT NULL	
	,SizeID			int				NOT NULL	constraint Order_TShirts_SizeTB_fk references SizeTB(SizeID)
	,constraint 	Order_TShirts_pk primary key (OrderID, TShirtsID, SizeID)
);

INSERT INTO UserTB (UserID, EmailAddress, FirstName, LastName) VALUES
(1, 'jihyuk.chung@oit.edu', 'Jihyuk', 'Chung'),
(2, 'John.Second@oit.edu', 'John', 'Second'),
(3, 'John.Third@oit.edu', 'John', 'Third'),
(4, 'NotJohn.Forth@oit.edu', 'John', 'Forth');

INSERT INTO USAddressTB VALUES
(1, '273 South Peg Shop St', '', 'Burbank', 'IL', 'USA', 60459),
(2, '42 N. Miller Drive', '', 'Merrillville', 'IN', 'USA', 46410);

INSERT INTO OrderTB VALUES
(1, 2, 2, 5.00, 0),
(2, 1, 1, 7.25, 0);

INSERT INTO SizeTB (SizeID, ClothingSize) VALUES
(1, 'XS'),
(2, 'S'),
(3, 'M'),
(4, 'L'),
(5, 'XL'),
(6, '2XL'),
(7, '3XL'),
(8, '4XL');

INSERT INTO TShirtsTB VALUES
(1, 'PERSONALIZED TEAM BOWLING', 'Cafe Press', '7.59', 12),
(2, 'Mens Classic Jersey', 'Champion', '6.98', 50),
(3, 'Mens Ultra Cotton Adult Long Sleeve', 'Gildan', '7.41', 31),
(4, 'Mens Classic Jersey Script', 'Champion', '9.98', 12),
(5, 'Mens Big & Tall Workwear Pocket Short-Sleeve', 'Carhartt', '12.99', 39),
(6, 'K87 Workwear Pocket Short-Sleeve', 'Carhartt', '12.99', 12);

INSERT INTO Order_TShirts_IMT VALUES
(1, 3, 2, 5),
(1, 2, 1, 5),
(2, 6, 1, 8);