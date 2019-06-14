use jihyukchung;
Go
Create table USAddress
(
	AddrID 			int							constraint USAddress_pk primary key
	,StreetAddr		varchar(40)		NOT NULL
	,Optional		varchar(40)
	,City			varchar(21)		NOT NULL
	,StateCode		varchar(2)					-- For countries without State
	,CountryCode	varchar(3)		NOT NULL
	,PostalCode		varchar(5)		NOT NULL
);
Create table Employee
(
	EmployeeID 		int							constraint EmployeeID_pk primary key
	,FirstName		varchar(15)		NOT NULL
	,LastName		varchar(15)		NOT NULL
	,PhoneNumber	varchar(15)
	,AddrID			int							constraint Employee_USAddress_fk references USAddress(AddrID)
);
Create table Picker
(
	PickerID 		int							constraint PickerID_pk primary key
	,FirstName		varchar(15)		NOT NULL
	,LastName		varchar(15)		NOT NULL
	,PhoneNumber	varchar(15)
	,AddrID			int							constraint Picker_USAddress_fk references USAddress(AddrID)
	,BlackListed	bit				NOT NULL
);
Create table Station
(
	StationID 		int							constraint ShroomID_pk primary key
	,EmployeeID		int				NOT NULL	constraint Station_Employee_fk references Employee(EmployeeID)
	,isActive		bit				NOT NULL		
	,AddrID			int							constraint Station_USAddress_fk references USAddress(AddrID)
);
Create table Sale
(
	SaleID 			int							constraint SaleID_pk primary key
	,PickerID		int				NOT NULL	constraint Sale_Picker_fk references Picker(PickerID)
	,StationID		int				NOT NULL	constraint Sale_Station_fk references Station(StationID)
	,EmployeeID		int				NOT NULL	constraint Sale_Employee_fk references Employee(EmployeeID)
	,PickerID		int				NOT NULL	constraint Sale_Picker_fk references Picker(PickerID)
	,SaleDate		time			NOT NULL
);
Create table Grade
(
	GradeID 		int							constraint GradeID_pk primary key
	,ShroomID		decimal(8,2)	NOT NULL,
);
Create table IMT_Sale_Grade
(
	SaleID 			int 						constraint Sale_Grade_Sale_fk references Sale(SaleID)
	,GradeID		int							constraint Sale_Grade_Grade_fk references Grade(GradeID)
	,Quantity		int				NOT NULL
	,Bonus			decimal(8,2)	NOT NULL
	,constraint 	Sale_Grade_pk primary key (SaleID, GradeID)
);
Create table Price
(
	PriceID 		int							constraint PriceID_pk primary key
	,SaleID			int				NOT NULL	constraint Price_Sale_fk references Sale(SaleID)
	,StationID		int				NOT NULL	constraint Price_Station_fk references Station(StationID)
	,Cost			decimal(8,2)	NOT NULL
);
Create table Shroom
(
	ShroomID 		int							constraint ShroomID_pk primary key
	,Name			nvarchar(40)	NOT NULL
);
Create table Permit
(
	PermitID 		int							constraint ContractID_pk primary key
	,PickerID		int				NOT NULL	constraint Permit_Picker_fk references Picker(PickerID)
	,AddrID			int				NOT NULL	constraint Permit_USAddress_fk references USAddress(AddrID)
	,ExpDate		time			NOT NULL
	,ShroomID		int				NOT NULL	constraint Permit_Shroom_fk references Shroom(ShroomID)
);

Create table IMT_Picker_Permit
(
	PickerID		int				constraint Picker_Permit_Picker_fk references Picker(PickerID)
	,PermitID		int				constraint Picker_Permit_Permit_fk references Permit(PermitID)
	,constraint 	Station_Price_pk primary key (PickerID, PermitID)
);