Drop table ABC_USERS
/
Drop table Proposals
/
Drop table Messages
/
Drop SEQUENCE proposalid_sequence
/

Create table ABC_USERS( 
Username Varchar2(20)  primary key Not Null,
Password Varchar2(20)  Not Null, 
TeamName Varchar2(10)  Not Null,
MobileNumber Varchar2(10)
)
/

Create table Proposals ( 
proposalid Number(6) primary key, 
filename Varchar2(20) not null,
fileData blob,
companyname Varchar2(20),
teamname Varchar2(20),
proposaldate Date
)
/

Create table Messages ( 
queryid Number(6) primary key, 
sender Varchar2(20) not null,
receiver Varchar2(20) not null,
query Varchar2(100) not null,
reply Varchar2(200) ,
queryDate Date
)
/

Create sequence proposalid_sequence start with 1
/

INSERT INTO ABC_USERS VALUES('intu', 'intu', 'team1', '9876543210')
/
insert into messages values(1, 'team1', 'BeneesFradia', 'What is query?', '', sysdate)
/
commit
/