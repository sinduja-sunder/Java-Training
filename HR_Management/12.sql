--/*
--use [HR_Management ];
--create table Department(DepID int primary key identity(1,1),DepName not null varchar(20),DepHead not null varchar(20) );

--create table Location(LocID int primary key identity(1,1),LocName not null varchar(20),LocAddress not null varchar(100));

--create table Skills(SkillID int primary key identity(1,1),Skill not null varchar(10));
--*/

use [HR_Management ];
drop table Employee
create table Employee(
EmpID int primary key identity(1,1),
EmpFirstName varchar(40) not null,
EmpLastName varchar(40) not null,
ManagerRole int not null,
DepID int foreign key references Department(DepID),
ManagerID int ,
--check((ManagerID is Null) or(select * from Employee where EmpID = ManagerID)=1 ),
Email varchar(50) not null,
PhoneNo bigint not null,
PrimarySkill_1 int not null foreign key references Skills(SkillID),
PrimarySkill_2 int not null foreign key references Skills(SkillID),
PrimarySkill_3 int not null foreign key references Skills(SkillID),
Location int foreign key references Location(LocID),
Category varchar(20) not null check( Category in ('Built','UnBuilt')),
Assignment_status varchar(20) not null check(Assignment_status in ('active','terminated')),
HireDate date not null,
TerminationDate date,
Constraint td check((Assignment_status='active' and TerminationDate is Null) or (Assignment_status='terminated' and TerminationDate is Not NULL)));

Drop Function MGID;

CREATE FUNCTION MGID (
    @ID INT
)
RETURNS VARCHAR(10)
AS
BEGIN
    IF EXISTS (SELECT EmpID FROM Employee WHERE EmpID = @ID)
        return 'True'
    return 'False'
END

alter table Employee with check add constraint mid check([dbo].MGID(ManagerID)='True' or ManagerID is null)
drop table EmployeeHistory
create table EmployeeHistory(
ChangeID int primary key identity(1,1),
EmpID int not null,
EmpFirstName varchar(30) not null,
EmpLastName varchar(30) not null,
ManagerRole int not null,
DepID int not null,
ManagerID int not null,
Email varchar(30) not null,
PhoneNo bigint not null,
PrimarySkill_1 int not null,
PrimarySkill_2 int not null,
PrimarySkill_3 int not null,
Location int not null,
Category varchar(20) not null,
Assignment_status varchar(20) not null,
HireDate date not null,
TerminationDate date null,
OldEmpFirstName varchar(30) ,
OldEmpLastName varchar(30) ,
OldManagerRole int,
OldDepID int ,
OldManagerID int ,
OldEmail varchar(30) ,
OldPhoneNo int ,
OldPrimarySkill_1 int ,
OldPrimarySkill_2 int ,
OldPrimarySkill_3 int ,
OldLocation int ,
OldCategory varchar(20),
OldAssignment_status varchar(20),
ChangeType varchar(20) check(ChangeType in ('INSERT','UPDATE','DELETE'))
);




use [HR_Management ];
drop trigger trigger_insert
create trigger trigger_insert
on Employee
After insert
as
Insert into  EmployeeHistory values ((select i.EmpID from inserted as i),(select i.EmpFirstName from inserted as i),(select i.EmpLastName from inserted as i),(select i.ManagerRole from inserted as i),(select i.DepID from inserted as i),(select i.ManagerID from inserted as i),(select i.Email from inserted as i),(select i.PhoneNo from inserted as i),(select i.PrimarySkill_1 from inserted as i),(select i.PrimarySkill_2 from inserted as i),(select i.PrimarySkill_3 from inserted as i),(select i.Location from inserted as i),(select i.Category from inserted as i),(select i.Assignment_status from inserted as i),(select i.HireDate from inserted as i),(select i.TerminationDate from inserted as i),NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'INSERT')
GO

use [HR_Management ];
drop trigger trigger_update;
create trigger trigger_update
on Employee
After update
as
begin
declare @efn varchar(20),@eln varchar(20),@email varchar(50),@cat varchar(20),@as varchar(20);
declare @did INT,@mr INT, @mid INT,@pno INT,@ps1 INT,@ps2 INT,@ps3 INT,@loc INT;
if((select i.Assignment_status from inserted as i )!='terminated')
Begin
	
	if((select i.EmpFirstName from inserted as i)!=(select i.EmpFirstName from deleted as i))
		set @efn = (select i.EmpFirstName from deleted as i);
	else
		set @efn = NULL;
	if((select i.EmpLastName from inserted as i)!=(select i.EmpLastName from deleted as i))
		set @eln = (select i.EmpLastName from deleted as i);
	else
		set @eln = NULL;
	if((select i.ManagerRole from inserted as i)!=(select i.ManagerRole from deleted as i))
		set @mr = (select i.ManagerRole from deleted as i);
	else
		set @mr = NULL;
	if((select i.DepID from inserted as i)!=(select i.DepID from deleted as i))
		set @did = (select i.DepID from deleted as i);
	else
		set @did = NULL;
	if((select i.ManagerID from inserted as i)!=(select i.ManagerID from deleted as i))
		set @mid = (select i.ManagerID from deleted as i);
	else
		set @mid = NULL;
	if((select i.Email from inserted as i)!=(select i.Email from deleted as i))
		set @email = (select i.Email from deleted as i);
	else
		set @email = NULL;
	if((select i.PhoneNo from inserted as i)!=(select i.PhoneNo from deleted as i))
		set @pno = (select i.PhoneNo from deleted as i);
	else
		set @pno = NULL;
	if((select i.PrimarySkill_1 from inserted as i)!=(select i.PrimarySkill_1 from deleted as i))
		set @ps1 = (select i.PrimarySkill_1 from deleted as i);
	else
		set @ps1 = NULL;
	if((select i.PrimarySkill_2 from inserted as i)!=(select i.PrimarySkill_2 from deleted as i))
		set @ps2 = (select i.PrimarySkill_2 from deleted as i);
	else
		set @ps2 = NULL;
	if((select i.PrimarySkill_3 from inserted as i)!=(select i.PrimarySkill_3 from deleted as i))
		set @ps3 = (select i.PrimarySkill_3 from deleted as i);
	else
		set @ps3 = NULL;
	if((select i.Location from inserted as i)!=(select i.Location from deleted as i))
		set @loc = (select i.Location from deleted as i);
	else
		set @loc = NULL;

	if((select i.Category from inserted as i)!=(select i.Category from deleted as i))
		set @cat = (select i.Category from deleted as i);
	else
		set @cat = NULL;


	Insert into  EmployeeHistory values (
	(select i.EmpID from inserted as i),
	(select i.EmpFirstName from inserted as i),
	(select i.EmpLastName from inserted as i),
	(select i.ManagerRole from inserted as i),
	(select i.DepID from inserted as i),
	(select i.ManagerID from inserted as i),
	(select i.Email from inserted as i),
	(select i.PhoneNo from inserted as i),
	(select i.PrimarySkill_1 from inserted as i),
	(select i.PrimarySkill_2 from inserted as i),
	(select i.PrimarySkill_3 from inserted as i),
	(select i.Location from inserted as i),
	(select i.Category from inserted as i),
	(select i.Assignment_status from inserted as i),
	(select i.HireDate from inserted as i),
	(select i.TerminationDate from inserted as i),
	@efn,
	@eln,
	@mr,
	@did,
	@mid,
	@email,
	@pno,
	@ps1,
	@ps2,
	@ps3,
	@loc,
	@cat,
	NULL,
	'UPDATE')
END
END
GO

--use [HR_Management ];
--drop trigger trigger_delete
--create trigger trigger_delete
--on Employee
--After delete
--as
--Insert into  EmployeeHistory values ((select i.EmpID from deleted as i),(select i.EmpFirstName from deleted as i),(select i.EmpLastName from deleted as i),(select i.ManagerRole from deleted as i),(select i.DepID from deleted as i),(select i.ManagerID from deleted as i),(select i.Email from deleted as i),(select i.PhoneNo from deleted as i),(select i.PrimarySkill_1 from deleted as i),(select i.PrimarySkill_2 from deleted as i),(select i.PrimarySkill_3 from deleted as i),(select i.Location from deleted as i),(select i.Category from deleted as i),(select i.Assignment_status from deleted as i),(select i.HireDate from deleted as i),(select i.TerminationDate from deleted as i),NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DELETE')
--GO



use [HR_Management ];
drop trigger trigger_delete
create trigger trigger_delete
on Employee
After update
as
begin 
if ((select i.Assignment_status from inserted as i)= 'terminated')
Insert into  EmployeeHistory values ((select i.EmpID from inserted as i),(select i.EmpFirstName from inserted as i),(select i.EmpLastName from inserted as i),(select i.ManagerRole from inserted as i),(select i.DepID from inserted as i),(select i.ManagerID from inserted as i),(select i.Email from inserted as i),(select i.PhoneNo from inserted as i),(select i.PrimarySkill_1 from inserted as i),(select i.PrimarySkill_2 from inserted as i),(select i.PrimarySkill_3 from inserted as i),(select i.Location from inserted as i),(select i.Category from inserted as i),(select i.Assignment_status from inserted as i),(select i.HireDate from inserted as i),GETDATE(),NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DELETE');
end
GO

--EmpID,EmpFirstName,EmpLastName,DepID,ManagerID,Email,PhoneNo,PrimarySkill_1,PrimarySkill_2,PrimarySkill_3,Location,Category,Assignment_status,HireDate,TerminationDate
	use [HR_Management ];
	drop procedure find
	create procedure find
	@dep int,
	@loc int,
	@MID int ,
	@EFN varchar(30),
	@skill int
	as 
	begin
	 declare @sql nvarchar(max)
	 set @sql = 'Select * from Employee where 1=1 '
	 if(@loc is not null)
		set @sql = @sql+'and Location=@l'
	 if(@MID is not null)
		set @sql = @sql+' and ManagerID=@m '
	 if(@EFN is not null)
		set @sql = @sql+' and EmpFirstName like ''%''+@e+''%''' 
	 if(@skill is not null)
		set @sql = @sql+' and (PrimarySkill_1=@s or PrimarySkill_2=@s or PrimarySkill_3=@s) '
	 if(@dep is not null)
		set @sql = @sql+' and DepID= @d'
	Execute sp_executesql @sql,N'@l int,@m int,@e varchar(50),@d int,@s int',@l=@loc,@m=@MID,@e=@EFN,@d=@dep,@s=@skill
	END
	Go


	Exec find NULL,NULL,NULL,NULL,1

	--use [HR_Management ]
	--create table Login(id int primary key identity(1,1),Username varchar(30) not null,Password varchar(30) not null);