if not exists (select * from sys.tables where [name] = 'Department')
begin
	create table Department
(
	[Id] int primary key identity(1,1), --starts with 1 and increments by 1
	DepartmentName nvarchar(50) not null,
	SupervisorId nvarchar(50) not null,
	ExpenseBudget int
)
end
else
print'Department table already exists'


if not exists (select * from sys.tables where [name] = 'Computer')
begin
	create table Computer
(
	[Id] int primary key identity(1,1), --starts with 1 and increments by 1
	PurchaseDate date not null,
	DecommissionDate date null,
	EmployeeId int not null,
	isMalfunctioning bit not null
)
end
else
print'Computer table already exists'



if not exists (select * from sys.tables where [name] = 'Employee')
begin
	create table Employee
(
	[Id] int primary key identity(1,1), --starts with 1 and increments by 1
	FirstName nvarchar(50) not null,
	LastName nvarchar(50) not null,
	DepartmentId int not null,
	isSupervisor bit not null,
	quitIn30Days bit not null,
)
end
else
print'Employee table already exists'



if not exists (select * from sys.tables where [name] = 'EmployeeTrainingProgram')
begin
	create table EmployeeTrainingProgram
(
	[Id] int primary key identity(1,1), --starts with 1 and increments by 1
	EmployeeId int not null,
	TrainingProgramId int not null,
	hasCompleted bit not null,
)
end
else
print'EmployeeTrainingProgram table already exists'



if not exists (select * from sys.tables where [name] = 'TrainingProgram')
begin
	create table TrainingProgram
(
	[Id] int primary key identity(1,1), --starts with 1 and increments by 1
	[Name] nvarchar(50) not null,
	StartDate date null,
	EndDate date null,
	MaximumAttendees int null,
)
end
else
print'TrainingProgram table already exists'



if not exists (select * from sys.tables where [name] = 'ProductType')
begin
	create table ProductType
(
	[Id] int primary key identity(1,1), --starts with 1 and increments by 1
	Name nvarchar(50) not null,
)
end
else
print'ProductType table already exists'



if not exists (select * from sys.tables where [name] = 'Product')
begin
	create table Product
(
	[Id] int primary key identity(1,1), --starts with 1 and increments by 1
	ProductTypeId int not null,
	Title nvarchar(50) not null,
	Price decimal(18,2) not null,
	Description nvarchar(50) null,
	Quantity int not null,
	CustomerId int null
)
end
else
print'Product table already exists'



if not exists (select * from sys.tables where [name] = 'ProductOrder')
begin
	create table ProductOrder
(
	[Id] int primary key identity(1,1), --starts with 1 and increments by 1
	ProductId int not null,
	OrderId int not null,
	TotalCost decimal(18,2) not null,
	hasPaymentType bit not null
)
end
else
print'ProductOrder table already exists'



if not exists (select * from sys.tables where [name] = 'Order')
begin
	create table [Order]
(
	[Id] int primary key identity(1,1), --starts with 1 and increments by 1
	CustomerId int not null,
	TotalCost decimal(18,2) not null,
	hasPaymentType bit not null
)
end
else
print'Order table already exists'



if not exists (select * from sys.tables where [name] = 'Customer')
begin
	create table Customer
(
	[Id] int primary key identity(1,1), --starts with 1 and increments by 1
	FirstName nvarchar(50) not null,
	LastName nvarchar(50) not null,
	hasAccountNumber bit not null,
	DateAccountCreated date not null
)
end
else
print'Customer table already exists'



if not exists (select * from sys.tables where [name] = 'PaymentType')
begin
	create table PaymentType
(
	[Id] int primary key identity(1,1), --starts with 1 and increments by 1
	[Name] nvarchar(50) not null,
	[CustomerId] int not null,
)
end
else
print'PaymentType table already exists'



alter table Employee
add constraint FK_Department
	foreign key (DepartmentId)
	references Department (Id)



alter table Computer
add constraint FK_Employee
	foreign key (EmployeeId)
	references Employee (Id)



alter table EmployeeTrainingProgram
add constraint FK_Employee2
	foreign key (EmployeeId)
	references Employee (Id)



alter table EmployeeTrainingProgram
add constraint FK_TrainingProgram
	foreign key (TrainingProgramId)
	references TrainingProgram (Id)



alter table Product
add constraint FK_ProductType
	foreign key (ProductTypeId)
	references ProductType (Id)



alter table ProductOrder
add constraint FK_ProductId
	foreign key (ProductId)
	references Product (Id)



alter table ProductOrder
add constraint FK_OrderId
	foreign key (OrderId)
	references [Order] (Id)



alter table [Order]
add constraint FK_Order_Customer
	foreign key (CustomerId)
	references Customer (Id)



alter table PaymentType
add constraint FK_PaymentType_Customer
	foreign key (CustomerId)
	references Customer (Id)