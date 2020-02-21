drop table Users;
drop table Role;
drop table Users_Roles;

create table Users (
	-- Id uniqueidentifier primary key default newsid(),
	Id int primary key identity(1,1),
	First_Name varchar(25),
	Last_Name varchar(25),
	Email varchar (250) not null unique,
	Money_Spent decimal(10,2) default 0,
	CreatedAt datetime not null default getdate(),
	Bio text
); 

insert into Users(Email, Money_Spent, First_Name, Last_Name, Bio)
values ('IBRA_TOM123@TEST.COM', 10.333, 'IBRA', 'TOM', 'SOME DUDE'),
		('TEST@TEST.COM', 1.1 ,'FEST' ,'LEST' ,'I AM A TEST' ),
		('SAM_MATT21@TEST.COM', 32.555, 'SAM','MATT', 'ANOTHER DUDE');

select * from Users;

create table Role (
	Id int primary key identity(1,1),
	Name varchar (50) not null unique
); 

create table Users_Roles (
	UserId int references Users(Id) on delete cascade,
	RoleId int references Role(Id) on delete cascade,
	primary key (UserID, RoleId)
); 

insert into Role(Name)
Values ('admin');

insert into Users_Roles(UserId, RoleId)
values(1,1);

select Email, Name from Users
left join Users_Roles on Users.Id = Users_Roles.UserId
left join Role on Role.Id = Users_Roles.RoleId;


